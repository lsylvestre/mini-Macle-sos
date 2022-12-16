open Ast

let normalize_rec bs e =
  match e with
  | Atom _ -> e
  | _ -> LetRec(bs,e)

let normalize_abort e a =
  match e with
  | Atom _ -> e
  | _ -> AbortWhen(e,a)

let eval_op op args =
  match op,args with
  | Add,[Const (Int n); Const (Int m)] -> Const (Int(n+m))
  | Sub,[Const (Int n); Const (Int m)] -> Const (Int(n-m))
  | Mult,[Const (Int n); Const (Int m)] -> Const (Int(n*m))
  | Eq,[Const (Int n); Const (Int m)] -> Const (Bool(n=m))
  | Lt,[Const (Int n); Const (Int m)] -> Const (Bool(n<m))
  | Le,[Const (Int n); Const (Int m)] -> Const (Bool(n<=m))
  | And,[Const (Bool a); Const (Bool b)] -> Const (Bool(a&&b))
  | Or,[Const (Bool a); Const (Bool b)] -> Const (Bool(a||b))
  | Not,[Const (Bool b)] -> Const (Bool (not b))
  | IfThenElse,[Const (Bool b); v1; v2] ->
      if b then v1 else v2
  | _ -> Print.pp_atom Format.std_formatter (Op(op,List.map (fun x -> Value x) args)); assert false

exception Unbound_value of ident
exception Unbound_input of ident
exception Unbound_output of ident

let check_lengths xs args =
  if List.compare_lengths xs args <> 0 then
          Prelude.Errors.raise_error
            ~msg:("arity mismatch: function (fun "^String.concat " " xs^" -> ...) is applied to "^
                  string_of_int (List.length args)^" arguments")

let rec sos_a i o a =
  match a with
  | Value v ->
      v
  | Op(op,args) ->
      let args' = List.map (sos_a i o) args in
      eval_op op args'
  | GetInput x ->
      if Env.mem x i then Const (Env.find x i) else
        raise (Unbound_input x)
  | Current x ->
      if Env.mem x o then Const (Env.find x o) else
        raise (Unbound_output x)

let shift_return_code k =
  if k < 2 then k else k - 1

let rec sos_e d i o e =
  match e with
  | Atom a ->
      let v = sos_a i o a in
      (Env.empty, 0, Atom (Value v))
  | If(a,e1,e2) ->
      (match sos_a i o a with
      | Const (Bool true) ->
        let (o',k,e1') = sos_e d i o e1 in
        (o',k,e1')
      | Const (Bool false) ->
        let (o',k,e2') = sos_e d i o e2 in
        (o',k,e2')
      | _ -> Prelude.Errors.raise_error ~msg:"typing error")
  | LetAnd((x1,e1),(x2,e2),e) ->
      let (o1,k1,e1') = sos_e d i o e1 in
      let (o2,k2,e2') = sos_e d i o e2 in
      if k1 = 0 && k2 = 0 then
        (match e1',e2' with
        | Atom (Value v1),Atom (Value v2) ->
          let (o',k,e') =
            sos_e d i o (Subst.subst (env_of_list [x1,v1;x2,v2]) e)
          in
           (o1 ++ o2 ++ o',k,e')
        | _ -> assert false)
      else
        o1 ++ o2, max k1 k2, LetAnd((x1,e1'),(x2,e2'),e)
  | SetNext((x,a),e) ->
      let v = sos_a i o a in
      assert (Env.mem x o);
      let (o',k,e') = sos_e d i o e in
      if Env.mem x o' then (o',k,e') else
      (match v with
       | Const c -> (Env.add x c o'), k, e'
       | _ -> assert false)
  | LetRec(ts,e) ->
      let (o,k,e') = sos_e (env_extend ts d) i o e in
      o, max 1 k, normalize_rec ts e'
  | App(v,args) ->
      (match v with
      | Fun(xs,e) ->
          check_lengths xs args;
          let vs = List.map (sos_a i o) args in
          let (o',k,e') =
            sos_e d i o (Subst.subst (env_of_list (List.combine xs vs)) e)
          in
          o', k, e'
      | Var f ->
          let (xs,e) = Env.find f d in
          check_lengths xs args;
          let vs = List.map (sos_a i o) args in
          Env.empty, 1, (Subst.subst (env_of_list (List.combine xs vs)) e)
      | Const _ ->
          assert false)
  | ImmediateApp(x,args) ->
      let (o0,k0,e) = sos_e d i o (App((Var x),args)) in
      assert (Env.cardinal o0 = 0);
      assert (k0 = 1);
      let (o',k,e') = sos_e d i o e in
      (o',k,e')
  | Local(x,y,c,e) ->
      let (o',k,e') = sos_e d (Env.add y c i) (Env.add x c o) e in
      let c' = match Env.find_opt x o' with
               | None -> c
               | Some c -> c in
      (Env.remove x o'),k,Local(x,y,c',e')
  | Raise(k,exc) ->
     Env.empty, k+2, Atom unit_
  | Try(e,exc,e2) ->
     let (o',k,e') = sos_e d i o e in
     if k <> 2 then (o',shift_return_code k,e') else
     let (o'',k',e2') = sos_e d i o e2 in
     (o'',k',e2')
  | AbortWhen(e,a) ->
     let (o',k,e') = sos_e d i o e in
     (match sos_a i o a with
      | Const (Bool false) ->
        (o',k,normalize_abort e' a)
      | Const (Bool true) ->
        (o',max k 1, Atom unit_)
      | _ -> Prelude.Errors.raise_error ~msg:"typing error")
let rec sos_pi env i o pi =
  match pi with
  | [],e ->
      let (o',k,e') = sos_e Env.empty i o e in
      let env' = Env.union (fun _ _ v -> Some v) env @@
        Env.union (fun _ _ v -> Some v)
          (Env.map (fun c -> O c) o)
          (Env.map (fun c -> O c) o') in
      env',([],e')
  | (d::ds),e ->
      (match d with
       | Input x ->
         (match Env.find x env with
          | I stream ->
              let env',(ds',e') =
                sos_pi env (Env.add x stream.last i) o (ds,e)
              in
              env',((d::ds'),e')
          | _ -> assert false)
       | Output (x,c) ->
           let env',(ds',e') = sos_pi env i (Env.add x c o) (ds,e) in
           (match Env.find x env' with
            | O c' ->
                env',((Output(x,c')::ds'),e')
            | _ -> assert false)
       | Let (x,v) ->
           let env',(ds',e') =
             sos_pi env i o (Subst.subst_prog (env_of_list [x,v]) (ds,e)) in
           env',((d::ds'),e'))

let sos s pi =
  sos_pi s Env.empty Env.empty pi


let rec sos_n ?(trace=fun _ _ -> ()) env pi n =
  if n < 0 then env,pi else
  let env',pi' = sos env pi in
  trace env' pi';

  let env'' = Env.map (function
      | I stream -> I {stream with last=stream.next env'}
      | o -> o) env' in
  sos_n ~trace env'' pi' (n-1)

open Printf

let print_const = function
| Int n -> printf "%d" n
| Bool b -> printf "%b" b
| Unit -> printf "()"
| Nil -> printf "nil"

let print_io = function
| O c -> print_const c
| I {last=c} -> print_const c

let chronogramme ls pi n =
  let env = env_of_list ls in
  List.iter (fun (x,(I {last=c} | O c)) ->
      printf "%s=" x; print_const c; printf "\t|"
    ) ls;
  printf "\n--------------------------------\n";
  let trace env _ =
    List.iter (fun (x,_) -> print_io (Env.find x env); printf "\t| ") ls;
    printf "\n";
  in
  let pi = Ast.Rename.ren_prog pi in
  let pi = Ast.Set_exc_lvl.lvl_raise_pi pi in

  (* Ast.Print.pp_prog Format.std_formatter pi; *)

  sos_n ~trace env pi n
