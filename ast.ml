type ident = string
type const = Int of int | Bool of bool | Unit | Nil
type op = Add | Sub | Mult | Eq | Lt | Le | Not | And | Or | IfThenElse

type exn_name = ident

type atom =
  | Value of value
  | Op of op * atom list
  | GetInput of ident
  | Current of ident

and value =
  | Var of ident
  | Const of const
  | Fun of ident list * exp

and exp =
  | LetRec of (ident * (ident list * exp)) list * exp
  | App of value * atom list
  | ImmediateApp of ident * atom list
  | If of atom * exp * exp
  | Atom of atom
  | LetAnd of (ident * exp) * (ident * exp) * exp
  | SetNext of (ident * atom) * exp
  | Local of ident * ident * const * exp
  | Raise of int * exn_name 
  | Try of exp * exn_name * exp
  | AbortWhen of exp * atom

type prog = decl list * exp
and decl = Let of ident * value
| Input of ident
| Output of ident * const


module Env = Map.Make(String)



let env_extend bs r =
  List.fold_left (fun r (x,t) -> Env.add x t r) r bs

let env_of_list l =
  List.fold_left (fun r (x,v) -> Env.add x v r) Env.empty l

let (++) r1 r2 =
  Env.union (fun x _ _ -> Printf.printf "*** %s\n" x; assert false) r1 r2


type 'a stream = {last:'a; next: 'a env -> 'a }
and 'a io =  I of 'a stream | O of 'a
and 'a env = 'a io Env.t


let int_ n = Value (Const (Int n))
let const_ c = Value (Const c)

let op_ op args = Op(op,args)

let if_ a e1 e2 = If(a,e1,e2)

let var_ x = Var x

let val_ v = Value v
let app_ v args =
  App(v,args)

let app_imm_ f args =
  ImmediateApp(f,args)

let atom_ a = Atom a
let unit_ = Value (Const Unit)

let letand_ b1 b2 e = LetAnd(b1,b2,e)

let let_ x1 e1 e =
  letand_ (x1,e1) ("_",atom_ unit_) e

let letrec_ ts e = LetRec(ts,e)

let set_next_ o a e =
  SetNext((o,a),e)


module Print = struct

  (* substitution avoiding captures *)
  open Format
  let rec pp_ident fmt x =
    fprintf fmt "%s" x

  let pp_op fmt op =
    fprintf fmt @@
      match op with
      | Add -> "+"
      | Sub -> "-"
      | Mult -> "*"
      | Le -> "<="
      | Lt -> "<"
      | Eq -> "=="
      | IfThenElse -> "if_then_else"
      | Not -> "not"
      | And -> "&&"
      | Or -> "or"

  let pp_const fmt = function
  | Int n -> fprintf fmt "%d" n
  | Bool b -> fprintf fmt "%b" b
  | Unit -> fprintf fmt "()"
  | Nil -> fprintf fmt "nil"

  let rec pp_atom fmt a =
    match a with
    | Value v ->
        pp_value fmt v
    | GetInput x ->
        fprintf fmt "%s%a" "?" pp_ident x
    | Current x ->
        fprintf fmt "%s%a" "~" pp_ident x
    | Op(op,args) ->
        fprintf fmt "((%a) " pp_op op;
        pp_print_list
              ~pp_sep:(fun fmt () -> fprintf fmt " ")
              pp_atom fmt args;
        fprintf fmt ")"

  and pp_value fmt v =
    match v with
    | Const c ->
        pp_const fmt c
    | Fun(xs,e) ->
        fprintf fmt "(@[<v 2>fun ";
        pp_print_list
              ~pp_sep:(fun fmt () -> fprintf fmt " ")
              pp_ident fmt xs;
        fprintf fmt " ->@,";
        pp_exp fmt e;
        fprintf fmt "@])"
    | Var x ->
        pp_ident fmt x

  and pp_exp fmt e =
    match e with
    | Atom a -> pp_atom fmt a
    | If(a,e1,e2) ->
        fprintf fmt "(@[<v>if %a@,then %a@,else %a@])"
          pp_atom a
          pp_exp e1
          pp_exp e2
    | LetAnd((x1,e1),(x2,e2),e) ->
        fprintf fmt "(@[<v>let %a = %a@,and %a = %a in@, %a@])"
          pp_ident x1
          pp_exp e1
          pp_ident x2
          pp_exp e2
          pp_exp e
    | SetNext((x,a),e) ->
        fprintf fmt "(@[<v>do (next %a) = %a in@,%a@])"
          pp_ident x pp_atom a pp_exp e
    | LetRec(bs,e) ->
       fprintf fmt "(@[<v>let rec ";
       pp_print_list
              ~pp_sep:(fun fmt () -> fprintf fmt "@,and ")
              (fun fmt (f,(xs,e)) ->
                  fprintf fmt "%a " pp_ident f;
                  pp_print_list
                    ~pp_sep:(fun fmt () -> fprintf fmt " ")
                  pp_ident fmt xs;
                  fprintf fmt " = %a" pp_exp e)
               fmt bs;
       fprintf fmt "in@,%a@])" pp_exp e
    | App(v,args) ->
        fprintf fmt "(%a " pp_value v;
        pp_print_list
              ~pp_sep:(fun fmt () -> fprintf fmt " ")
              pp_atom fmt args;
        fprintf fmt ")"
    | ImmediateApp(x,args) ->
        fprintf fmt "(immediate %a " pp_ident x;
        pp_print_list
              ~pp_sep:(fun fmt () -> fprintf fmt " ")
              pp_atom fmt args;
        fprintf fmt ")"
    | Local(x,y,c,e) ->
        fprintf fmt "(@[<v>local <%a/%a> = %a in@,%a@])"
          pp_ident x
          pp_ident y
          pp_const c
          pp_exp e
    | Raise(k,x) ->
        fprintf fmt "(@[<v>raise<%d> %a@])" k pp_ident x
    | Try(e,x,e') ->
        fprintf fmt "(@[<v>try %a with %a -> %a@])"
          pp_exp e
          pp_ident x
          pp_exp e'
   | AbortWhen(e,a) ->
        fprintf fmt "(@[<v>abort %a when %a@])"
          pp_exp e
          pp_atom a

  let rec pp_prog fmt (ds,e) =
    fprintf fmt "@[<v>";
    List.iter (function
        | Input x ->
            fprintf fmt "input %a@," pp_ident x
        | Output (x,c) ->
            fprintf fmt "output %a = %a@," pp_ident x pp_const c
        | Let(x,v) ->
            fprintf fmt "@,@[<v 2>let %a = %a@]@,@," pp_ident x pp_value v)
      ds;
    pp_exp fmt e;
    fprintf fmt "@]"
end



module Subst = struct

  (* substitution avoiding captures *)

  let rec subst_ident r x =
    match Env.find_opt x r with
    | None -> x
    | Some (Var y) -> y
    | Some _ -> assert false

  let rec subst_atom r a =
    match a with
    | Value v ->
        Value (subst_value r v)
    | GetInput x ->
        GetInput (subst_ident r x)
    | Current x ->
        Current (subst_ident r x)
    | Op(op,args) -> Op(op,List.map (subst_atom r) args)

  and subst_value r v =
    match v with
    | Const _ -> v
    | Fun(xs,e) ->
        let r' = List.fold_left (fun r x -> Env.remove x r) r xs in
        Fun(xs,subst r' e)
    | Var x ->
      (match Env.find_opt x r with
       | None -> v
       | Some v -> v)

  and subst r e =
    match e with
    | Atom a ->
        Atom (subst_atom r a)
    | If(a,e1,e2) ->
        If(subst_atom r a,subst r e1, subst r e2)
    | LetAnd((x1,e1),(x2,e2),e) ->
        let e' = if Env.mem x1 r || Env.mem x2 r then e else subst r e in
        LetAnd((x1,subst r e1),(x2,subst r e2),e')
    | SetNext((x,a),e) ->
        (* assert (not (Env.mem x r)); *)
        SetNext((subst_ident r x,subst_atom r a),subst r e)
    | LetRec(bs,e) ->
        LetRec(List.map (fun (x,(xs,e)) -> x,(xs,subst r e)) bs, subst r e) (* capture *)
    | App(v,args) ->
        App(subst_value r v, List.map (subst_atom r) args)
    | ImmediateApp(x,args) ->
        assert (not (Env.mem x r));
        ImmediateApp(x, List.map (subst_atom r) args)
    | Local(x,y,c,e) as le ->
        if Env.mem x r then le else Local(x,y,c,subst r e)
    | Raise(k,x) ->
        (* variables and exceptions are *not* in the same namespace *)
        Raise(k,x)
    | Try(e,exc,e') ->
        (* variables and exceptions are *not* in the same namespace *)
        Try(subst r e,exc,subst r e')
    | AbortWhen(e,a) ->
        AbortWhen(subst r e,subst_atom r a)

  let rec subst_prog r (ds,e) =
    let ds' =
      List.map (fun d -> match d with
          | Input _ | Output _ ->
            d
          | Let(x,v) ->
            Let(x,subst_value r v)) ds in
    ds', subst r e
end

module Rename = struct

  let gensym r x =
    if Env.mem x r then
      Prelude.gensym ~prefix:x ()
    else x

  let rec ren_atom r = function
  | Value v -> Value (ren_value r v)
  | Op(op,args) -> Op(op, List.map (ren_atom r) args)
  | GetInput x -> GetInput (ren_ident r x)
  | Current x -> Current (ren_ident r x)
  and ren_ident r x =
    match Env.find_opt x r with
    | None -> x
    | Some y -> y
  and ren_value r = function
    | Var x ->
        Var (ren_ident r x)
    | (Const _) as v ->
        v
    | Fun(xs,e) ->
        let xs' = List.map (gensym r) xs in
        let r' = List.fold_left2 (fun r x x' -> Env.add x x' r) r xs xs' in
        Fun(xs',ren_exp r' e)
  and ren_exp r = function
    | LetRec(ts,e) ->
        let r' = List.fold_right (fun (f,(_,e)) r ->
          let f' = (gensym r) f in
          Env.add f f' r) ts r
        in
        let ts' = List.map (fun (f,(xs,e)) ->
            (* assume xs all differents *)
            let xs' = List.map (gensym r) xs in
            let r'' = List.fold_left2 (fun r x x' -> Env.add x x' r) r' xs xs'
            in
            (ren_ident r' f, (List.map (ren_ident r) xs', ren_exp r'' e))) ts in
         LetRec(ts', ren_exp r' e)
    | App(v,args) ->
        App(ren_value r v, List.map (ren_atom r) args)
    | ImmediateApp(f,args) ->
        ImmediateApp(ren_ident r f, List.map (ren_atom r) args)
    | If(a,e1,e2) ->
        If(ren_atom r a, ren_exp r e1, ren_exp r e2)
    | Atom a ->
        Atom(ren_atom r a)
    | LetAnd((x1,e1),(x2,e2),e) ->
        (* assume x1 <> x2 *)
        let x1' = gensym r x1 in
        let x2' = gensym r x2 in
        let r' = Env.add x1 x1' (Env.add x2 x2' r) in
        LetAnd((x1', ren_exp r e1),(x2', ren_exp r e2), ren_exp r' e)
    | SetNext((x,a),e) ->
        SetNext((ren_ident r x, ren_atom r a), ren_exp r e)
    | Local(x,y,c,e) ->
        let x' = gensym r x in
        let y' = gensym r y in
        let r' = Env.add x x' (Env.add y y' r) in
        Local(x',y',c,ren_exp r' e)
    | Raise(k,exc) ->
        Raise(k,exc)
    | Try(e,exc,e') ->
        Try(ren_exp r e,exc,ren_exp r e')
    | AbortWhen(e,a) ->
        AbortWhen(ren_exp r e,ren_atom r a)

  let ren_prog (ds,e) =
    (* assume all top-level name introduced by `let` are differents *)
    (List.map (function (Input _ | Output _) as d -> d
               | Let(x,v) ->
                    Let(x,ren_value Env.empty v)) ds, ren_exp Env.empty e)

end

module Set_exc_lvl = struct
    let rec lvl_exp last r e =
      match e with
    | LetRec(ts,e) ->
         LetRec(List.map (fun (x,(xs,e)) -> (x,(xs,lvl_exp last r e))) ts,
                lvl_exp last r e)
    | App _ | ImmediateApp _ | Atom _ -> e
    | If(a,e1,e2) ->
        If(a, lvl_exp last r e1, lvl_exp last r e2)
    | LetAnd((x1,e1),(x2,e2),e) ->
        LetAnd((x1,lvl_exp last r e1),(x2,lvl_exp last r e2),lvl_exp last r e)
    | SetNext((x,a),e) ->
        SetNext((x,a),lvl_exp last r e)
    | Local(x,y,c,e) ->
        Local(x,y,c,lvl_exp last r e)
    | Raise(_,exc) ->
        (match Env.find_opt exc r with
        | None -> Prelude.Errors.raise_error ~msg:("uncatched exception "^exc)
        | Some lvl ->
            let k = last - lvl - 1 in
            Raise(k,exc))
    | Try(e,exc,e') ->
        Try(lvl_exp (last+1) (Env.add exc last r) e, exc, lvl_exp last r e')
    | AbortWhen(e,a) ->
        AbortWhen(lvl_exp last r e, a)

  let lvl_raise e =
    lvl_exp 0 Env.empty e


  let lvl_raise_pi (ds,e) =
    (List.map (function (Let(x,v)) ->
                          (match lvl_raise (Atom (Value v)) with
                          | (Atom (Value v')) -> Let(x,v')
                          | _ -> assert false) | d -> d) ds,lvl_raise e)
end



