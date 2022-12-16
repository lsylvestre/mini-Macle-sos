
(* The type of tokens. *)

type token = 
  | WITH
  | WILDCARD
  | WHEN
  | UP_IDENT of (string)
  | TRY
  | TIMES
  | TILDE
  | THEN
  | STRING_LIT of (string)
  | SEMI_SEMI
  | RPAREN
  | RIGHT_ARROW
  | REC
  | RAISE
  | QUOTE_TVAR of (string)
  | QUESTION_MARK
  | PLUS
  | PIPE_PIPE
  | PIPE
  | OUTPUT
  | OR
  | NOT
  | NEXT
  | NEQ
  | MOD
  | MINUS
  | LT
  | LPAREN
  | LOCAL
  | LET
  | LE
  | INVALID_ARG
  | INT_LIT of (int)
  | INPUT
  | IN
  | IMMEDIATE
  | IF
  | IDENT of (string)
  | GT
  | GE
  | FUN
  | FAILURE
  | EQEQ
  | EQ
  | EOF
  | ELSE
  | DO
  | DIV
  | COMMA
  | COL
  | BOOL_LIT of (bool)
  | AND
  | AMP_AMP
  | ABORT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.prog)

val observer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((Prelude.ident * Ast.const Ast.io) list)
