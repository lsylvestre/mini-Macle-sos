%{
    open Ast
    open Prelude

  let rec as_atom loc = function
  | Atom a -> a
  | If(a,e1,e2) -> Op(IfThenElse,[a;as_atom loc e1;as_atom loc e2])
  | _ -> Errors.syntax_error ~msg:"an atomic expression is expected.\n\
                                  \ Hint: use a let-binding to compute\
                                  \ this expression before" loc

%}
%token LPAREN RPAREN COMMA PIPE_PIPE EQ EQEQ COL
%token FUN
%token PIPE
%token LET REC AND IN IF THEN ELSE
%token TRY WITH WILDCARD ABORT WHEN
%token <string> IDENT UP_IDENT QUOTE_TVAR
%token <bool> BOOL_LIT
%token <int> INT_LIT
%token PLUS MINUS TIMES LT LE GT GE NEQ NOT MOD DIV AMP_AMP OR
%token EOF
%token SEMI_SEMI
%token RIGHT_ARROW
%token RAISE FAILURE INVALID_ARG
%token DO NEXT
%token <string> STRING_LIT
%token INPUT OUTPUT IMMEDIATE
%token TILDE QUESTION_MARK
%token LOCAL

/* The precedences must be listed from low to high. */

%left PAR
%nonassoc IN
%nonassoc SEMICOL
%nonassoc LET
%left     COMMA
%nonassoc IF THEN ELSE
%right    AMP_AMP OR
%left     LT LE GT GE NEQ EQ EQEQ
%left     PLUS MINUS
%left     TIMES
%right    DIV MOD
%nonassoc DOT
%nonassoc TILDE BANG BOOL_LIT IDENT LPAREN

%start <prog> prog
%start <(ident * const io) list> observer

%%


observer:
l=eq* EOF { List.concat l }

eq:
| INPUT x=IDENT EQ c=const
   { let i = I{last=c;next=fun _ -> c} in
     [x,i] }
| INPUT x=IDENT EQ c=const RIGHT_ARROW a=exp
   {
    let i =
      I{last=c;
        next=(fun env ->
               match Interp.sos_a (Env.filter_map (fun _ ->
                              function
                              | (I {last}) -> Some last
                              | O _ -> None) env)
                           (Env.filter_map (fun _ ->
                              function
                              | (O c) -> Some c
                              | I _ -> None) env) (as_atom $loc a) with
               | Const c -> c
               | _ -> assert false)} in
    [x,i] }
| OUTPUT xs=separated_nonempty_list(COMMA,IDENT)
   { List.map (fun x -> x,O Nil) xs }


prog:
| p=rprog EOF { let (ds,e) = p in List.rev ds, e }

rprog:
| INPUT xs=separated_nonempty_list(COMMA,IDENT) p=rprog
    { let (ds,e) = p in List.map (fun x -> Input x) xs@ds,e }
| OUTPUT xs=separated_nonempty_list(COMMA,output_decl) p=rprog
    { let (ds,e) = p in (List.map (fun (x,c) -> Output (x,c)) xs@ds),e }
| LET x=IDENT EQ v=value p=rprog
    { let (ds,e) = p in Let(x,v)::ds,e }
| LET x=IDENT xs=IDENT+ EQ e=exp p=rprog
    { let (ds,e') = p in Let(x,Fun(xs,e))::ds,e' }
| e=lexp { [],e }
| SEMI_SEMI e=exp { [],e }

output_decl:
| x=IDENT { x, Nil }
| x=IDENT EQ c=const { x,c }

const:
| b=BOOL_LIT { Bool b }
| n=INT_LIT  { Int n }
| LPAREN RPAREN { Unit }

lexp:
| LPAREN e=exp RPAREN { e }
| LET REC ts=separated_nonempty_list(AND,transition) IN e=exp
  {letrec_ ts e }
| a=simple_atom args=simple_atom+
  { match a with
    | Value v -> app_ v args
    | _ -> assert false }
| IMMEDIATE f=IDENT args=simple_atom+
  { app_imm_ f args }
| IF a=atom THEN e1=exp ELSE e2=exp {
    match e1,e2 with
    | Atom a1, Atom a2 -> Atom (Op(IfThenElse,[a;a1;a2]))
    | _ -> If(a,e1,e2) }
| DO x=next EQ a=exp IN e=exp { set_next_ x (as_atom $loc a) e }
| LOCAL LT x=IDENT DIV y=IDENT GT EQ c=const IN e=exp
   { Local(x,y,c,e) }
| RAISE exc=UP_IDENT
   { Raise(-1,exc) }
| TRY e1=exp WITH exc=UP_IDENT RIGHT_ARROW e2=exp
   { Try(e1,exc,e2) }
| ABORT e=exp WHEN a=lexp
   { AbortWhen(e,as_atom $loc a) }
| a=atom { Atom a }

exp:
| e=lexp { e }
| LET x1=IDENT EQ e1=exp IN e=exp
  { let_ x1 e1 e }
| LET x=IDENT xs=IDENT+ EQ e1=exp IN e2=exp
    { let_ x (Atom (Value (Fun(xs,e1)))) e2 }
| LET x1=IDENT EQ e1=exp AND x2=IDENT EQ e2=exp IN e=exp
  { letand_ (x1,e1) (x2,e2) e }

transition:
| f=IDENT xs=IDENT+ EQ e=exp { f,(xs,e) }

next:
LPAREN NEXT x=IDENT RPAREN
| NEXT x=IDENT {x}

value:
| LPAREN v=value RPAREN { v }
| c=const                         { Const c }
| x=IDENT { Var x }
| FUN xs=IDENT+ RIGHT_ARROW e=exp { Fun(xs,e) }

atom:
| a1=exp PLUS a2=exp { Op(Add,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp MINUS a2=exp { Op(Sub,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp TIMES a2=exp { Op(Mult,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp LT a2=exp { Op(Lt,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp LE a2=exp { Op(Le,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp EQEQ a2=exp { Op(Eq,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp AMP_AMP a2=exp { Op(And,[as_atom $loc a1;as_atom $loc a2]) }
| a1=exp OR a2=exp { Op(Or,[as_atom $loc a1;as_atom $loc a2]) }
| NOT a=simple_atom { Op(Not,[a]) }
| a=simple_atom { a }


simple_atom:
| LPAREN a=exp RPAREN { as_atom $loc a }
| QUESTION_MARK x=IDENT { GetInput x }
| TILDE x=IDENT { Current x }
| c=const       { Value (Const c) }
| x=IDENT { Value (Var x) }
| LPAREN FUN xs=IDENT+ RIGHT_ARROW e=exp RPAREN { Value (Fun(xs,e)) }
