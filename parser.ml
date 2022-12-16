
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WITH
    | WILDCARD
    | WHEN
    | UP_IDENT of (
# 18 "parser.mly"
       (string)
# 18 "parser.ml"
  )
    | TRY
    | TIMES
    | TILDE
    | THEN
    | STRING_LIT of (
# 27 "parser.mly"
       (string)
# 27 "parser.ml"
  )
    | SEMI_SEMI
    | RPAREN
    | RIGHT_ARROW
    | REC
    | RAISE
    | QUOTE_TVAR of (
# 18 "parser.mly"
       (string)
# 37 "parser.ml"
  )
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
    | INT_LIT of (
# 20 "parser.mly"
       (int)
# 59 "parser.ml"
  )
    | INPUT
    | IN
    | IMMEDIATE
    | IF
    | IDENT of (
# 18 "parser.mly"
       (string)
# 68 "parser.ml"
  )
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
    | BOOL_LIT of (
# 19 "parser.mly"
       (bool)
# 85 "parser.ml"
  )
    | AND
    | AMP_AMP
    | ABORT
  
end

include MenhirBasics

# 1 "parser.mly"
  
    open Ast
    open Prelude

  let rec as_atom loc = function
  | Atom a -> a
  | If(a,e1,e2) -> Op(IfThenElse,[a;as_atom loc e1;as_atom loc e2])
  | _ -> Errors.syntax_error ~msg:"an atomic expression is expected.\n\
                                  \ Hint: use a let-binding to compute\
                                  \ this expression before" loc


# 108 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_observer) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: observer. *)

  | MenhirState001 : (('s, _menhir_box_observer) _menhir_cell1_OUTPUT, _menhir_box_observer) _menhir_state
    (** State 001.
        Stack shape : OUTPUT.
        Start symbol: observer. *)

  | MenhirState003 : (('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 003.
        Stack shape : IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState008 : (('s, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_state
    (** State 008.
        Stack shape : INPUT IDENT.
        Start symbol: observer. *)

  | MenhirState009 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 009.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState014 : ((('s, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_cell1_const, _menhir_box_observer) _menhir_state
    (** State 014.
        Stack shape : INPUT IDENT const.
        Start symbol: observer. *)

  | MenhirState015 : (('s, 'r) _menhir_cell1_TRY, 'r) _menhir_state
    (** State 015.
        Stack shape : TRY.
        Start symbol: <undetermined>. *)

  | MenhirState022 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 022.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState023 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 023.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState024 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 024.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState031 : (('s, 'r) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 031.
        Stack shape : LOCAL IDENT IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState033 : ((('s, 'r) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, 'r) _menhir_cell1_const, 'r) _menhir_state
    (** State 033.
        Stack shape : LOCAL IDENT IDENT const.
        Start symbol: <undetermined>. *)

  | MenhirState035 : (('s, 'r) _menhir_cell1_LET, 'r) _menhir_state
    (** State 035.
        Stack shape : LET.
        Start symbol: <undetermined>. *)

  | MenhirState036 : (('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 036.
        Stack shape : IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState037 : (('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 037.
        Stack shape : IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState040 : ((('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_state
    (** State 040.
        Stack shape : IDENT nonempty_list(IDENT).
        Start symbol: <undetermined>. *)

  | MenhirState042 : (('s, 'r) _menhir_cell1_IMMEDIATE _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 042.
        Stack shape : IMMEDIATE IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState044 : (('s, 'r) _menhir_cell1_simple_atom, 'r) _menhir_state
    (** State 044.
        Stack shape : simple_atom.
        Start symbol: <undetermined>. *)

  | MenhirState048 : (('s, 'r) _menhir_cell1_IF, 'r) _menhir_state
    (** State 048.
        Stack shape : IF.
        Start symbol: <undetermined>. *)

  | MenhirState057 : (('s, 'r) _menhir_cell1_DO _menhir_cell0_next, 'r) _menhir_state
    (** State 057.
        Stack shape : DO next.
        Start symbol: <undetermined>. *)

  | MenhirState058 : (('s, 'r) _menhir_cell1_ABORT, 'r) _menhir_state
    (** State 058.
        Stack shape : ABORT.
        Start symbol: <undetermined>. *)

  | MenhirState059 : (('s, 'r) _menhir_cell1_simple_atom, 'r) _menhir_state
    (** State 059.
        Stack shape : simple_atom.
        Start symbol: <undetermined>. *)

  | MenhirState062 : ((('s, 'r) _menhir_cell1_ABORT, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 062.
        Stack shape : ABORT exp.
        Start symbol: <undetermined>. *)

  | MenhirState063 : (((('s, 'r) _menhir_cell1_ABORT, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_WHEN, 'r) _menhir_state
    (** State 063.
        Stack shape : ABORT exp WHEN.
        Start symbol: <undetermined>. *)

  | MenhirState065 : (('s, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 065.
        Stack shape : exp.
        Start symbol: <undetermined>. *)

  | MenhirState066 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_TIMES, 'r) _menhir_state
    (** State 066.
        Stack shape : exp TIMES.
        Start symbol: <undetermined>. *)

  | MenhirState069 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_PLUS, 'r) _menhir_state
    (** State 069.
        Stack shape : exp PLUS.
        Start symbol: <undetermined>. *)

  | MenhirState070 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_PLUS, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 070.
        Stack shape : exp PLUS exp.
        Start symbol: <undetermined>. *)

  | MenhirState071 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_OR, 'r) _menhir_state
    (** State 071.
        Stack shape : exp OR.
        Start symbol: <undetermined>. *)

  | MenhirState072 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_OR, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 072.
        Stack shape : exp OR exp.
        Start symbol: <undetermined>. *)

  | MenhirState073 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 073.
        Stack shape : exp MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState074 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_MINUS, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 074.
        Stack shape : exp MINUS exp.
        Start symbol: <undetermined>. *)

  | MenhirState075 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_LT, 'r) _menhir_state
    (** State 075.
        Stack shape : exp LT.
        Start symbol: <undetermined>. *)

  | MenhirState076 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_LT, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 076.
        Stack shape : exp LT exp.
        Start symbol: <undetermined>. *)

  | MenhirState077 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_LE, 'r) _menhir_state
    (** State 077.
        Stack shape : exp LE.
        Start symbol: <undetermined>. *)

  | MenhirState078 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_LE, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 078.
        Stack shape : exp LE exp.
        Start symbol: <undetermined>. *)

  | MenhirState079 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_EQEQ, 'r) _menhir_state
    (** State 079.
        Stack shape : exp EQEQ.
        Start symbol: <undetermined>. *)

  | MenhirState080 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_EQEQ, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 080.
        Stack shape : exp EQEQ exp.
        Start symbol: <undetermined>. *)

  | MenhirState081 : ((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_AMP_AMP, 'r) _menhir_state
    (** State 081.
        Stack shape : exp AMP_AMP.
        Start symbol: <undetermined>. *)

  | MenhirState082 : (((('s, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_AMP_AMP, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 082.
        Stack shape : exp AMP_AMP exp.
        Start symbol: <undetermined>. *)

  | MenhirState083 : ((('s, 'r) _menhir_cell1_DO _menhir_cell0_next, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 083.
        Stack shape : DO next exp.
        Start symbol: <undetermined>. *)

  | MenhirState084 : (((('s, 'r) _menhir_cell1_DO _menhir_cell0_next, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_state
    (** State 084.
        Stack shape : DO next exp IN.
        Start symbol: <undetermined>. *)

  | MenhirState085 : ((((('s, 'r) _menhir_cell1_DO _menhir_cell0_next, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 085.
        Stack shape : DO next exp IN exp.
        Start symbol: <undetermined>. *)

  | MenhirState087 : ((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_atom, 'r) _menhir_state
    (** State 087.
        Stack shape : IF atom.
        Start symbol: <undetermined>. *)

  | MenhirState088 : (((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_atom, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 088.
        Stack shape : IF atom exp.
        Start symbol: <undetermined>. *)

  | MenhirState089 : ((((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_atom, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_ELSE, 'r) _menhir_state
    (** State 089.
        Stack shape : IF atom exp ELSE.
        Start symbol: <undetermined>. *)

  | MenhirState090 : (((((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_atom, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_ELSE, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 090.
        Stack shape : IF atom exp ELSE exp.
        Start symbol: <undetermined>. *)

  | MenhirState091 : (((('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 091.
        Stack shape : IDENT nonempty_list(IDENT) exp.
        Start symbol: <undetermined>. *)

  | MenhirState093 : (('s, 'r) _menhir_cell1_transition, 'r) _menhir_state
    (** State 093.
        Stack shape : transition.
        Start symbol: <undetermined>. *)

  | MenhirState096 : ((('s, 'r) _menhir_cell1_LET, 'r) _menhir_cell1_separated_nonempty_list_AND_transition_, 'r) _menhir_state
    (** State 096.
        Stack shape : LET separated_nonempty_list(AND,transition).
        Start symbol: <undetermined>. *)

  | MenhirState097 : (((('s, 'r) _menhir_cell1_LET, 'r) _menhir_cell1_separated_nonempty_list_AND_transition_, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 097.
        Stack shape : LET separated_nonempty_list(AND,transition) exp.
        Start symbol: <undetermined>. *)

  | MenhirState098 : (('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 098.
        Stack shape : LET IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState099 : ((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_state
    (** State 099.
        Stack shape : LET IDENT EQ.
        Start symbol: <undetermined>. *)

  | MenhirState100 : (((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 100.
        Stack shape : LET IDENT EQ exp.
        Start symbol: <undetermined>. *)

  | MenhirState101 : ((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_state
    (** State 101.
        Stack shape : LET IDENT EQ exp IN.
        Start symbol: <undetermined>. *)

  | MenhirState102 : (((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 102.
        Stack shape : LET IDENT EQ exp IN exp.
        Start symbol: <undetermined>. *)

  | MenhirState105 : ((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_AND _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 105.
        Stack shape : LET IDENT EQ exp AND IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState106 : (((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_AND _menhir_cell0_IDENT, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 106.
        Stack shape : LET IDENT EQ exp AND IDENT exp.
        Start symbol: <undetermined>. *)

  | MenhirState107 : ((((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_AND _menhir_cell0_IDENT, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_state
    (** State 107.
        Stack shape : LET IDENT EQ exp AND IDENT exp IN.
        Start symbol: <undetermined>. *)

  | MenhirState108 : (((((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_EQ, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_AND _menhir_cell0_IDENT, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 108.
        Stack shape : LET IDENT EQ exp AND IDENT exp IN exp.
        Start symbol: <undetermined>. *)

  | MenhirState110 : ((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_state
    (** State 110.
        Stack shape : LET IDENT nonempty_list(IDENT).
        Start symbol: <undetermined>. *)

  | MenhirState111 : (((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 111.
        Stack shape : LET IDENT nonempty_list(IDENT) exp.
        Start symbol: <undetermined>. *)

  | MenhirState112 : ((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_state
    (** State 112.
        Stack shape : LET IDENT nonempty_list(IDENT) exp IN.
        Start symbol: <undetermined>. *)

  | MenhirState113 : (((((('s, 'r) _menhir_cell1_LET _menhir_cell0_IDENT, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 113.
        Stack shape : LET IDENT nonempty_list(IDENT) exp IN exp.
        Start symbol: <undetermined>. *)

  | MenhirState114 : (((('s, 'r) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, 'r) _menhir_cell1_const, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 114.
        Stack shape : LOCAL IDENT IDENT const exp.
        Start symbol: <undetermined>. *)

  | MenhirState115 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_FUN, 'r) _menhir_state
    (** State 115.
        Stack shape : LPAREN FUN.
        Start symbol: <undetermined>. *)

  | MenhirState117 : (((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_FUN, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_state
    (** State 117.
        Stack shape : LPAREN FUN nonempty_list(IDENT).
        Start symbol: <undetermined>. *)

  | MenhirState118 : ((((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_FUN, 'r) _menhir_cell1_nonempty_list_IDENT_, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 118.
        Stack shape : LPAREN FUN nonempty_list(IDENT) exp.
        Start symbol: <undetermined>. *)

  | MenhirState120 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 120.
        Stack shape : LPAREN exp.
        Start symbol: <undetermined>. *)

  | MenhirState122 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 122.
        Stack shape : LPAREN exp.
        Start symbol: <undetermined>. *)

  | MenhirState125 : ((('s, 'r) _menhir_cell1_TRY, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 125.
        Stack shape : TRY exp.
        Start symbol: <undetermined>. *)

  | MenhirState128 : (((('s, 'r) _menhir_cell1_TRY, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_WITH _menhir_cell0_UP_IDENT, 'r) _menhir_state
    (** State 128.
        Stack shape : TRY exp WITH UP_IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState129 : ((((('s, 'r) _menhir_cell1_TRY, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_WITH _menhir_cell0_UP_IDENT, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 129.
        Stack shape : TRY exp WITH UP_IDENT exp.
        Start symbol: <undetermined>. *)

  | MenhirState130 : (((('s, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_cell1_const, _menhir_box_observer) _menhir_cell1_exp, _menhir_box_observer) _menhir_state
    (** State 130.
        Stack shape : INPUT IDENT const exp.
        Start symbol: observer. *)

  | MenhirState134 : (('s, _menhir_box_observer) _menhir_cell1_eq, _menhir_box_observer) _menhir_state
    (** State 134.
        Stack shape : eq.
        Start symbol: observer. *)

  | MenhirState136 : ('s, _menhir_box_prog) _menhir_state
    (** State 136.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState137 : (('s, _menhir_box_prog) _menhir_cell1_SEMI_SEMI, _menhir_box_prog) _menhir_state
    (** State 137.
        Stack shape : SEMI_SEMI.
        Start symbol: prog. *)

  | MenhirState138 : ((('s, _menhir_box_prog) _menhir_cell1_SEMI_SEMI, _menhir_box_prog) _menhir_cell1_exp, _menhir_box_prog) _menhir_state
    (** State 138.
        Stack shape : SEMI_SEMI exp.
        Start symbol: prog. *)

  | MenhirState139 : (('s, _menhir_box_prog) _menhir_cell1_OUTPUT, _menhir_box_prog) _menhir_state
    (** State 139.
        Stack shape : OUTPUT.
        Start symbol: prog. *)

  | MenhirState141 : (('s, _menhir_box_prog) _menhir_cell1_IDENT, _menhir_box_prog) _menhir_state
    (** State 141.
        Stack shape : IDENT.
        Start symbol: prog. *)

  | MenhirState143 : ((('s, _menhir_box_prog) _menhir_cell1_OUTPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_output_decl_, _menhir_box_prog) _menhir_state
    (** State 143.
        Stack shape : OUTPUT separated_nonempty_list(COMMA,output_decl).
        Start symbol: prog. *)

  | MenhirState145 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_state
    (** State 145.
        Stack shape : LET IDENT.
        Start symbol: prog. *)

  | MenhirState146 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_state
    (** State 146.
        Stack shape : LET IDENT EQ.
        Start symbol: prog. *)

  | MenhirState147 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 147.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState149 : ((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_state
    (** State 149.
        Stack shape : LPAREN FUN.
        Start symbol: prog. *)

  | MenhirState151 : (((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_state
    (** State 151.
        Stack shape : LPAREN FUN nonempty_list(IDENT).
        Start symbol: prog. *)

  | MenhirState152 : ((((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_cell1_exp, _menhir_box_prog) _menhir_state
    (** State 152.
        Stack shape : LPAREN FUN nonempty_list(IDENT) exp.
        Start symbol: prog. *)

  | MenhirState156 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_state
    (** State 156.
        Stack shape : LET IDENT EQ FUN.
        Start symbol: prog. *)

  | MenhirState158 : ((((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_state
    (** State 158.
        Stack shape : LET IDENT EQ FUN nonempty_list(IDENT).
        Start symbol: prog. *)

  | MenhirState159 : (((((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_cell1_exp, _menhir_box_prog) _menhir_state
    (** State 159.
        Stack shape : LET IDENT EQ FUN nonempty_list(IDENT) exp.
        Start symbol: prog. *)

  | MenhirState160 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_value, _menhir_box_prog) _menhir_state
    (** State 160.
        Stack shape : LET IDENT EQ value.
        Start symbol: prog. *)

  | MenhirState161 : (('s, _menhir_box_prog) _menhir_cell1_INPUT, _menhir_box_prog) _menhir_state
    (** State 161.
        Stack shape : INPUT.
        Start symbol: prog. *)

  | MenhirState162 : ((('s, _menhir_box_prog) _menhir_cell1_INPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_IDENT_, _menhir_box_prog) _menhir_state
    (** State 162.
        Stack shape : INPUT separated_nonempty_list(COMMA,IDENT).
        Start symbol: prog. *)

  | MenhirState167 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_state
    (** State 167.
        Stack shape : LET IDENT nonempty_list(IDENT).
        Start symbol: prog. *)

  | MenhirState168 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_cell1_exp, _menhir_box_prog) _menhir_state
    (** State 168.
        Stack shape : LET IDENT nonempty_list(IDENT) exp.
        Start symbol: prog. *)

  | MenhirState172 : (('s, _menhir_box_prog) _menhir_cell1_output_decl, _menhir_box_prog) _menhir_state
    (** State 172.
        Stack shape : output_decl.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_atom = 
  | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (Ast.atom) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_const = 
  | MenhirCell1_const of 's * ('s, 'r) _menhir_state * (Ast.const) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_eq = 
  | MenhirCell1_eq of 's * ('s, 'r) _menhir_state * ((Prelude.ident * Ast.const Ast.io) list)

and ('s, 'r) _menhir_cell1_exp = 
  | MenhirCell1_exp of 's * ('s, 'r) _menhir_state * (Ast.exp) * Lexing.position * Lexing.position

and 's _menhir_cell0_next = 
  | MenhirCell0_next of 's * (Ast.ident)

and ('s, 'r) _menhir_cell1_nonempty_list_IDENT_ = 
  | MenhirCell1_nonempty_list_IDENT_ of 's * ('s, 'r) _menhir_state * (Ast.ident list)

and ('s, 'r) _menhir_cell1_output_decl = 
  | MenhirCell1_output_decl of 's * ('s, 'r) _menhir_state * (Ast.ident * Ast.const)

and ('s, 'r) _menhir_cell1_separated_nonempty_list_AND_transition_ = 
  | MenhirCell1_separated_nonempty_list_AND_transition_ of 's * ('s, 'r) _menhir_state * ((Ast.ident * (Ast.ident list * Ast.exp)) list)

and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_IDENT_ = 
  | MenhirCell1_separated_nonempty_list_COMMA_IDENT_ of 's * ('s, 'r) _menhir_state * (Ast.ident list)

and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_output_decl_ = 
  | MenhirCell1_separated_nonempty_list_COMMA_output_decl_ of 's * ('s, 'r) _menhir_state * ((Ast.ident * Ast.const) list)

and ('s, 'r) _menhir_cell1_simple_atom = 
  | MenhirCell1_simple_atom of 's * ('s, 'r) _menhir_state * (Ast.atom) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_transition = 
  | MenhirCell1_transition of 's * ('s, 'r) _menhir_state * (Ast.ident * (Ast.ident list * Ast.exp))

and ('s, 'r) _menhir_cell1_value = 
  | MenhirCell1_value of 's * ('s, 'r) _menhir_state * (Ast.value)

and ('s, 'r) _menhir_cell1_ABORT = 
  | MenhirCell1_ABORT of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_AMP_AMP = 
  | MenhirCell1_AMP_AMP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_AND = 
  | MenhirCell1_AND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DO = 
  | MenhirCell1_DO of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_ELSE = 
  | MenhirCell1_ELSE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EQ = 
  | MenhirCell1_EQ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EQEQ = 
  | MenhirCell1_EQEQ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FUN = 
  | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 18 "parser.mly"
       (string)
# 659 "parser.ml"
) * Lexing.position * Lexing.position

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 18 "parser.mly"
       (string)
# 666 "parser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_IMMEDIATE = 
  | MenhirCell1_IMMEDIATE of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_IN = 
  | MenhirCell1_IN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_INPUT = 
  | MenhirCell1_INPUT of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LE = 
  | MenhirCell1_LE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LOCAL = 
  | MenhirCell1_LOCAL of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LT = 
  | MenhirCell1_LT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_OR = 
  | MenhirCell1_OR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OUTPUT = 
  | MenhirCell1_OUTPUT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SEMI_SEMI = 
  | MenhirCell1_SEMI_SEMI of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TIMES = 
  | MenhirCell1_TIMES of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TRY = 
  | MenhirCell1_TRY of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_UP_IDENT = 
  | MenhirCell0_UP_IDENT of 's * (
# 18 "parser.mly"
       (string)
# 724 "parser.ml"
) * Lexing.position

and ('s, 'r) _menhir_cell1_WHEN = 
  | MenhirCell1_WHEN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WITH = 
  | MenhirCell1_WITH of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.prog) [@@unboxed]

and _menhir_box_observer = 
  | MenhirBox_observer of ((Prelude.ident * Ast.const Ast.io) list) [@@unboxed]

let _menhir_action_02 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 153 "parser.mly"
                     ( Op(Add,[as_atom _loc a1;as_atom _loc a2]) )
# 747 "parser.ml"
     : (Ast.atom))

let _menhir_action_03 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 154 "parser.mly"
                      ( Op(Sub,[as_atom _loc a1;as_atom _loc a2]) )
# 758 "parser.ml"
     : (Ast.atom))

let _menhir_action_04 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 155 "parser.mly"
                      ( Op(Mult,[as_atom _loc a1;as_atom _loc a2]) )
# 769 "parser.ml"
     : (Ast.atom))

let _menhir_action_05 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 156 "parser.mly"
                   ( Op(Lt,[as_atom _loc a1;as_atom _loc a2]) )
# 780 "parser.ml"
     : (Ast.atom))

let _menhir_action_06 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 157 "parser.mly"
                   ( Op(Le,[as_atom _loc a1;as_atom _loc a2]) )
# 791 "parser.ml"
     : (Ast.atom))

let _menhir_action_07 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 158 "parser.mly"
                     ( Op(Eq,[as_atom _loc a1;as_atom _loc a2]) )
# 802 "parser.ml"
     : (Ast.atom))

let _menhir_action_08 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 159 "parser.mly"
                        ( Op(And,[as_atom _loc a1;as_atom _loc a2]) )
# 813 "parser.ml"
     : (Ast.atom))

let _menhir_action_09 =
  fun _endpos_a2_ _startpos_a1_ a1 a2 ->
    let _endpos = _endpos_a2_ in
    let _startpos = _startpos_a1_ in
    let _loc = (_startpos, _endpos) in
    (
# 160 "parser.mly"
                   ( Op(Or,[as_atom _loc a1;as_atom _loc a2]) )
# 824 "parser.ml"
     : (Ast.atom))

let _menhir_action_10 =
  fun a ->
    (
# 161 "parser.mly"
                    ( Op(Not,[a]) )
# 832 "parser.ml"
     : (Ast.atom))

let _menhir_action_11 =
  fun a ->
    (
# 162 "parser.mly"
                ( a )
# 840 "parser.ml"
     : (Ast.atom))

let _menhir_action_12 =
  fun b ->
    (
# 101 "parser.mly"
             ( Bool b )
# 848 "parser.ml"
     : (Ast.const))

let _menhir_action_13 =
  fun n ->
    (
# 102 "parser.mly"
             ( Int n )
# 856 "parser.ml"
     : (Ast.const))

let _menhir_action_14 =
  fun () ->
    (
# 103 "parser.mly"
                ( Unit )
# 864 "parser.ml"
     : (Ast.const))

let _menhir_action_15 =
  fun c x ->
    (
# 59 "parser.mly"
   ( let i = I{last=c;next=fun _ -> c} in
     [x,i] )
# 873 "parser.ml"
     : ((Prelude.ident * Ast.const Ast.io) list))

let _menhir_action_16 =
  fun _endpos_a_ _startpos__1_ a c x ->
    let _endpos = _endpos_a_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 62 "parser.mly"
   (
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
                              | I _ -> None) env) (as_atom _loc a) with
               | Const c -> c
               | _ -> assert false)} in
    [x,i] )
# 898 "parser.ml"
     : ((Prelude.ident * Ast.const Ast.io) list))

let _menhir_action_17 =
  fun xs ->
    (
# 78 "parser.mly"
   ( List.map (fun x -> x,O Nil) xs )
# 906 "parser.ml"
     : ((Prelude.ident * Ast.const Ast.io) list))

let _menhir_action_18 =
  fun e ->
    (
# 131 "parser.mly"
         ( e )
# 914 "parser.ml"
     : (Ast.exp))

let _menhir_action_19 =
  fun e e1 x1 ->
    (
# 133 "parser.mly"
  ( let_ x1 e1 e )
# 922 "parser.ml"
     : (Ast.exp))

let _menhir_action_20 =
  fun e1 e2 x xs ->
    (
# 135 "parser.mly"
    ( let_ x (Atom (Value (Fun(xs,e1)))) e2 )
# 930 "parser.ml"
     : (Ast.exp))

let _menhir_action_21 =
  fun e e1 e2 x1 x2 ->
    (
# 137 "parser.mly"
  ( letand_ (x1,e1) (x2,e2) e )
# 938 "parser.ml"
     : (Ast.exp))

let _menhir_action_22 =
  fun e ->
    (
# 106 "parser.mly"
                      ( e )
# 946 "parser.ml"
     : (Ast.exp))

let _menhir_action_23 =
  fun e ts ->
    (
# 108 "parser.mly"
  (letrec_ ts e )
# 954 "parser.ml"
     : (Ast.exp))

let _menhir_action_24 =
  fun a args ->
    (
# 110 "parser.mly"
  ( match a with
    | Value v -> app_ v args
    | _ -> assert false )
# 964 "parser.ml"
     : (Ast.exp))

let _menhir_action_25 =
  fun args f ->
    (
# 114 "parser.mly"
  ( app_imm_ f args )
# 972 "parser.ml"
     : (Ast.exp))

let _menhir_action_26 =
  fun a e1 e2 ->
    (
# 115 "parser.mly"
                                    (
    match e1,e2 with
    | Atom a1, Atom a2 -> Atom (Op(IfThenElse,[a;a1;a2]))
    | _ -> If(a,e1,e2) )
# 983 "parser.ml"
     : (Ast.exp))

let _menhir_action_27 =
  fun _endpos_e_ _startpos__1_ a e x ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 119 "parser.mly"
                              ( set_next_ x (as_atom _loc a) e )
# 994 "parser.ml"
     : (Ast.exp))

let _menhir_action_28 =
  fun c e x y ->
    (
# 121 "parser.mly"
   ( Local(x,y,c,e) )
# 1002 "parser.ml"
     : (Ast.exp))

let _menhir_action_29 =
  fun exc ->
    (
# 123 "parser.mly"
   ( Raise(-1,exc) )
# 1010 "parser.ml"
     : (Ast.exp))

let _menhir_action_30 =
  fun e1 e2 exc ->
    (
# 125 "parser.mly"
   ( Try(e1,exc,e2) )
# 1018 "parser.ml"
     : (Ast.exp))

let _menhir_action_31 =
  fun _endpos_a_ _startpos__1_ a e ->
    let _endpos = _endpos_a_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 127 "parser.mly"
   ( AbortWhen(e,as_atom _loc a) )
# 1029 "parser.ml"
     : (Ast.exp))

let _menhir_action_32 =
  fun a ->
    (
# 128 "parser.mly"
         ( Atom a )
# 1037 "parser.ml"
     : (Ast.exp))

let _menhir_action_33 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 1045 "parser.ml"
     : ((Prelude.ident * Ast.const Ast.io) list list))

let _menhir_action_34 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 1053 "parser.ml"
     : ((Prelude.ident * Ast.const Ast.io) list list))

let _menhir_action_35 =
  fun x ->
    (
# 144 "parser.mly"
               (x)
# 1061 "parser.ml"
     : (Ast.ident))

let _menhir_action_36 =
  fun x ->
    (
# 144 "parser.mly"
               (x)
# 1069 "parser.ml"
     : (Ast.ident))

let _menhir_action_37 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 1077 "parser.ml"
     : (Ast.ident list))

let _menhir_action_38 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 1085 "parser.ml"
     : (Ast.ident list))

let _menhir_action_39 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 1093 "parser.ml"
     : (Ast.atom list))

let _menhir_action_40 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 1101 "parser.ml"
     : (Ast.atom list))

let _menhir_action_41 =
  fun l ->
    (
# 55 "parser.mly"
          ( List.concat l )
# 1109 "parser.ml"
     : ((Prelude.ident * Ast.const Ast.io) list))

let _menhir_action_42 =
  fun x ->
    (
# 97 "parser.mly"
          ( x, Nil )
# 1117 "parser.ml"
     : (Ast.ident * Ast.const))

let _menhir_action_43 =
  fun c x ->
    (
# 98 "parser.mly"
                     ( x,c )
# 1125 "parser.ml"
     : (Ast.ident * Ast.const))

let _menhir_action_44 =
  fun p ->
    (
# 82 "parser.mly"
              ( let (ds,e) = p in List.rev ds, e )
# 1133 "parser.ml"
     : (Ast.prog))

let _menhir_action_45 =
  fun p xs ->
    (
# 86 "parser.mly"
    ( let (ds,e) = p in List.map (fun x -> Input x) xs@ds,e )
# 1141 "parser.ml"
     : (Ast.decl list * Ast.exp))

let _menhir_action_46 =
  fun p xs ->
    (
# 88 "parser.mly"
    ( let (ds,e) = p in (List.map (fun (x,c) -> Output (x,c)) xs@ds),e )
# 1149 "parser.ml"
     : (Ast.decl list * Ast.exp))

let _menhir_action_47 =
  fun p v x ->
    (
# 90 "parser.mly"
    ( let (ds,e) = p in Let(x,v)::ds,e )
# 1157 "parser.ml"
     : (Ast.decl list * Ast.exp))

let _menhir_action_48 =
  fun e p x xs ->
    (
# 92 "parser.mly"
    ( let (ds,e') = p in Let(x,Fun(xs,e))::ds,e' )
# 1165 "parser.ml"
     : (Ast.decl list * Ast.exp))

let _menhir_action_49 =
  fun e ->
    (
# 93 "parser.mly"
         ( [],e )
# 1173 "parser.ml"
     : (Ast.decl list * Ast.exp))

let _menhir_action_50 =
  fun e ->
    (
# 94 "parser.mly"
                  ( [],e )
# 1181 "parser.ml"
     : (Ast.decl list * Ast.exp))

let _menhir_action_51 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 1189 "parser.ml"
     : ((Ast.ident * (Ast.ident list * Ast.exp)) list))

let _menhir_action_52 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 1197 "parser.ml"
     : ((Ast.ident * (Ast.ident list * Ast.exp)) list))

let _menhir_action_53 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 1205 "parser.ml"
     : (Ast.ident list))

let _menhir_action_54 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 1213 "parser.ml"
     : (Ast.ident list))

let _menhir_action_55 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 1221 "parser.ml"
     : ((Ast.ident * Ast.const) list))

let _menhir_action_56 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 1229 "parser.ml"
     : ((Ast.ident * Ast.const) list))

let _menhir_action_57 =
  fun _endpos__3_ _startpos__1_ a ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 166 "parser.mly"
                      ( as_atom _loc a )
# 1240 "parser.ml"
     : (Ast.atom))

let _menhir_action_58 =
  fun x ->
    (
# 167 "parser.mly"
                        ( GetInput x )
# 1248 "parser.ml"
     : (Ast.atom))

let _menhir_action_59 =
  fun x ->
    (
# 168 "parser.mly"
                ( Current x )
# 1256 "parser.ml"
     : (Ast.atom))

let _menhir_action_60 =
  fun c ->
    (
# 169 "parser.mly"
                ( Value (Const c) )
# 1264 "parser.ml"
     : (Ast.atom))

let _menhir_action_61 =
  fun x ->
    (
# 170 "parser.mly"
          ( Value (Var x) )
# 1272 "parser.ml"
     : (Ast.atom))

let _menhir_action_62 =
  fun e xs ->
    (
# 171 "parser.mly"
                                                ( Value (Fun(xs,e)) )
# 1280 "parser.ml"
     : (Ast.atom))

let _menhir_action_63 =
  fun e f xs ->
    (
# 140 "parser.mly"
                             ( f,(xs,e) )
# 1288 "parser.ml"
     : (Ast.ident * (Ast.ident list * Ast.exp)))

let _menhir_action_64 =
  fun v ->
    (
# 147 "parser.mly"
                        ( v )
# 1296 "parser.ml"
     : (Ast.value))

let _menhir_action_65 =
  fun c ->
    (
# 148 "parser.mly"
                                  ( Const c )
# 1304 "parser.ml"
     : (Ast.value))

let _menhir_action_66 =
  fun x ->
    (
# 149 "parser.mly"
          ( Var x )
# 1312 "parser.ml"
     : (Ast.value))

let _menhir_action_67 =
  fun e xs ->
    (
# 150 "parser.mly"
                                  ( Fun(xs,e) )
# 1320 "parser.ml"
     : (Ast.value))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ABORT ->
        "ABORT"
    | AMP_AMP ->
        "AMP_AMP"
    | AND ->
        "AND"
    | BOOL_LIT _ ->
        "BOOL_LIT"
    | COL ->
        "COL"
    | COMMA ->
        "COMMA"
    | DIV ->
        "DIV"
    | DO ->
        "DO"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | EQEQ ->
        "EQEQ"
    | FAILURE ->
        "FAILURE"
    | FUN ->
        "FUN"
    | GE ->
        "GE"
    | GT ->
        "GT"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | IMMEDIATE ->
        "IMMEDIATE"
    | IN ->
        "IN"
    | INPUT ->
        "INPUT"
    | INT_LIT _ ->
        "INT_LIT"
    | INVALID_ARG ->
        "INVALID_ARG"
    | LE ->
        "LE"
    | LET ->
        "LET"
    | LOCAL ->
        "LOCAL"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | NEQ ->
        "NEQ"
    | NEXT ->
        "NEXT"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | OUTPUT ->
        "OUTPUT"
    | PIPE ->
        "PIPE"
    | PIPE_PIPE ->
        "PIPE_PIPE"
    | PLUS ->
        "PLUS"
    | QUESTION_MARK ->
        "QUESTION_MARK"
    | QUOTE_TVAR _ ->
        "QUOTE_TVAR"
    | RAISE ->
        "RAISE"
    | REC ->
        "REC"
    | RIGHT_ARROW ->
        "RIGHT_ARROW"
    | RPAREN ->
        "RPAREN"
    | SEMI_SEMI ->
        "SEMI_SEMI"
    | STRING_LIT _ ->
        "STRING_LIT"
    | THEN ->
        "THEN"
    | TILDE ->
        "TILDE"
    | TIMES ->
        "TIMES"
    | TRY ->
        "TRY"
    | UP_IDENT _ ->
        "UP_IDENT"
    | WHEN ->
        "WHEN"
    | WILDCARD ->
        "WILDCARD"
    | WITH ->
        "WITH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_132 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_observer =
    fun _menhir_stack _v ->
      let l = _v in
      let _v = _menhir_action_41 l in
      MenhirBox_observer _v
  
  let rec _menhir_run_135 : type  ttv_stack. (ttv_stack, _menhir_box_observer) _menhir_cell1_eq -> _ -> _menhir_box_observer =
    fun _menhir_stack _v ->
      let MenhirCell1_eq (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_34 x xs in
      _menhir_goto_list_eq_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_eq_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_observer) _menhir_state -> _menhir_box_observer =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState134 ->
          _menhir_run_135 _menhir_stack _v
      | MenhirState000 ->
          _menhir_run_132 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_174 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let p = _v in
      let _v = _menhir_action_44 p in
      MenhirBox_prog _v
  
  let rec _menhir_goto_rprog : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState136 ->
          _menhir_run_174 _menhir_stack _v
      | MenhirState143 ->
          _menhir_run_170 _menhir_stack _v
      | MenhirState168 ->
          _menhir_run_169 _menhir_stack _v
      | MenhirState160 ->
          _menhir_run_165 _menhir_stack _v
      | MenhirState162 ->
          _menhir_run_163 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_170 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_OUTPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_output_decl_ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_separated_nonempty_list_COMMA_output_decl_ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_OUTPUT (_menhir_stack, _menhir_s) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_46 p xs in
      _menhir_goto_rprog _menhir_stack _v _menhir_s
  
  and _menhir_run_169 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_cell1_exp -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_exp (_menhir_stack, _, e, _, _) = _menhir_stack in
      let MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, x, _, _) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_48 e p x xs in
      _menhir_goto_rprog _menhir_stack _v _menhir_s
  
  and _menhir_run_165 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_value -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_value (_menhir_stack, _, v) = _menhir_stack in
      let MenhirCell1_EQ (_menhir_stack, _) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, x, _, _) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_47 p v x in
      _menhir_goto_rprog _menhir_stack _v _menhir_s
  
  and _menhir_run_163 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_INPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_IDENT_ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_separated_nonempty_list_COMMA_IDENT_ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_INPUT (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_45 p xs in
      _menhir_goto_rprog _menhir_stack _v _menhir_s
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_observer) _menhir_state -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OUTPUT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003
          | _ ->
              _eRR ())
      | ABORT | BOOL_LIT _ | DO | EOF | IDENT _ | IF | IMMEDIATE | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | SEMI_SEMI | TILDE | TRY ->
          let x = _v in
          let _v = _menhir_action_53 x in
          _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_IDENT_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState161 ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState003 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_162 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_INPUT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | SEMI_SEMI ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | OUTPUT ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | LET ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | INT_LIT _v_0 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_162 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | INPUT ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | IDENT _v_2 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState162 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | BOOL_LIT _v_4 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_162 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState162
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_TRY (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | INT_LIT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos_0, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | IDENT _v ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos_1, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState015 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | BOOL_LIT _v ->
          let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos_2, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, x, _startpos__1_) = (_endpos, _v, _startpos) in
          let _v = _menhir_action_59 x in
          _menhir_goto_simple_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_simple_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState022 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState136 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState143 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState167 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState158 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState147 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState151 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState014 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState048 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_124 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_a_, a) = (_endpos, _v) in
      let _v = _menhir_action_10 a in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState048 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState136 ->
          _menhir_run_068_spec_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState143 ->
          _menhir_run_068_spec_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState167 ->
          _menhir_run_068_spec_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState168 ->
          _menhir_run_068_spec_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState146 ->
          _menhir_run_068_spec_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState160 ->
          _menhir_run_068_spec_160 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState162 ->
          _menhir_run_068_spec_162 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState158 ->
          _menhir_run_068_spec_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState147 ->
          _menhir_run_068_spec_147 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState151 ->
          _menhir_run_068_spec_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState137 ->
          _menhir_run_068_spec_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState014 ->
          _menhir_run_068_spec_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState015 ->
          _menhir_run_068_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState128 ->
          _menhir_run_068_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState023 ->
          _menhir_run_068_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState024 ->
          _menhir_run_068_spec_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState117 ->
          _menhir_run_068_spec_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState033 ->
          _menhir_run_068_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState110 ->
          _menhir_run_068_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState112 ->
          _menhir_run_068_spec_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState099 ->
          _menhir_run_068_spec_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState105 ->
          _menhir_run_068_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState107 ->
          _menhir_run_068_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState101 ->
          _menhir_run_068_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState096 ->
          _menhir_run_068_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState040 ->
          _menhir_run_068_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState087 ->
          _menhir_run_068_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState089 ->
          _menhir_run_068_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState057 ->
          _menhir_run_068_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState084 ->
          _menhir_run_068_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState058 ->
          _menhir_run_068_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState063 ->
          _menhir_run_068_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState071 ->
          _menhir_run_068_spec_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState081 ->
          _menhir_run_068_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState079 ->
          _menhir_run_068_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState077 ->
          _menhir_run_068_spec_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState075 ->
          _menhir_run_068_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState073 ->
          _menhir_run_068_spec_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState069 ->
          _menhir_run_068_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState066 ->
          _menhir_run_068_spec_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_086 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState087 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
          | _ ->
              _eRR ())
      | AMP_AMP | EQEQ | LE | LT | MINUS | OR | PLUS | TIMES ->
          let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_32 a in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UP_IDENT _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_startpos__1_, _endpos_exc_, exc) = (_startpos, _endpos, _v) in
          let _v = _menhir_action_29 exc in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_exc_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_lexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState136 ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState143 ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState167 ->
          _menhir_run_061_spec_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState146 ->
          _menhir_run_061_spec_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState158 ->
          _menhir_run_061_spec_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState147 ->
          _menhir_run_061_spec_147 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState151 ->
          _menhir_run_061_spec_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState137 ->
          _menhir_run_061_spec_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState014 ->
          _menhir_run_061_spec_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState128 ->
          _menhir_run_061_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState015 ->
          _menhir_run_061_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState023 ->
          _menhir_run_061_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState024 ->
          _menhir_run_061_spec_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState117 ->
          _menhir_run_061_spec_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState033 ->
          _menhir_run_061_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState112 ->
          _menhir_run_061_spec_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState110 ->
          _menhir_run_061_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState107 ->
          _menhir_run_061_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState105 ->
          _menhir_run_061_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState101 ->
          _menhir_run_061_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState099 ->
          _menhir_run_061_spec_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState096 ->
          _menhir_run_061_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState040 ->
          _menhir_run_061_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState089 ->
          _menhir_run_061_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState087 ->
          _menhir_run_061_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState048 ->
          _menhir_run_061_spec_048 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState084 ->
          _menhir_run_061_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState057 ->
          _menhir_run_061_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState081 ->
          _menhir_run_061_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState079 ->
          _menhir_run_061_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState077 ->
          _menhir_run_061_spec_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState075 ->
          _menhir_run_061_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState073 ->
          _menhir_run_061_spec_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState071 ->
          _menhir_run_061_spec_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState069 ->
          _menhir_run_061_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState066 ->
          _menhir_run_061_spec_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState058 ->
          _menhir_run_061_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_164 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AMP_AMP | EQEQ | LE | LT | MINUS | OR | PLUS | TIMES ->
          let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_18 e in
          _menhir_goto_exp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v _menhir_s _tok
      | EOF ->
          let e = _v in
          let _v = _menhir_action_49 e in
          _menhir_goto_rprog _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_exp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState167 ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState158 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState151 ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState014 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState147 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState136 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState143 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState048 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_168 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | SEMI_SEMI ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | OUTPUT ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | LET ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | INT_LIT _v_0 ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | INPUT ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | IN ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | IDENT _v_4 ->
          let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState168 _tok
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | BOOL_LIT _v_8 ->
          let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TIMES (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState066 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | _ ->
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, x, _startpos__1_) = (_endpos, _v, _startpos) in
          let _v = _menhir_action_58 x in
          _menhir_goto_simple_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | LPAREN ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | INT_LIT _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, n) = (_endpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_022 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _v _tok
      | IDENT _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, x) = (_endpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _tok
      | BOOL_LIT _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, b) = (_endpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_022 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | RPAREN ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | INT_LIT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos_0, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | IDENT _v ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos_1, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState023 _tok
      | FUN ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | BOOL_LIT _v ->
          let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos_2, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let _endpos__2_ = _endpos in
      let _v = _menhir_action_14 () in
      _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_const : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState146 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState147 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState141 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState136 ->
          _menhir_run_046_spec_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState143 ->
          _menhir_run_046_spec_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState167 ->
          _menhir_run_046_spec_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState168 ->
          _menhir_run_046_spec_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState160 ->
          _menhir_run_046_spec_160 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState162 ->
          _menhir_run_046_spec_162 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState158 ->
          _menhir_run_046_spec_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState151 ->
          _menhir_run_046_spec_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState137 ->
          _menhir_run_046_spec_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState014 ->
          _menhir_run_046_spec_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState015 ->
          _menhir_run_046_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState128 ->
          _menhir_run_046_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState022 ->
          _menhir_run_046_spec_022 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState023 ->
          _menhir_run_046_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState024 ->
          _menhir_run_046_spec_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState117 ->
          _menhir_run_046_spec_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState033 ->
          _menhir_run_046_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState110 ->
          _menhir_run_046_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState112 ->
          _menhir_run_046_spec_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState099 ->
          _menhir_run_046_spec_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState105 ->
          _menhir_run_046_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState107 ->
          _menhir_run_046_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState101 ->
          _menhir_run_046_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState096 ->
          _menhir_run_046_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState040 ->
          _menhir_run_046_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState087 ->
          _menhir_run_046_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState089 ->
          _menhir_run_046_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState048 ->
          _menhir_run_046_spec_048 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState057 ->
          _menhir_run_046_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState084 ->
          _menhir_run_046_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState058 ->
          _menhir_run_046_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState063 ->
          _menhir_run_046_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState071 ->
          _menhir_run_046_spec_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState081 ->
          _menhir_run_046_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState079 ->
          _menhir_run_046_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState077 ->
          _menhir_run_046_spec_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState075 ->
          _menhir_run_046_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState073 ->
          _menhir_run_046_spec_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState069 ->
          _menhir_run_046_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState066 ->
          _menhir_run_046_spec_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState059 ->
          _menhir_run_046_spec_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState042 ->
          _menhir_run_046_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState044 ->
          _menhir_run_046_spec_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState031 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState008 ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_155 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AMP_AMP | AND | EQEQ | IN | LE | LT | MINUS | OR | PLUS | TIMES ->
          let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_60 c in
          _menhir_goto_simple_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
      | ABORT | BOOL_LIT _ | DO | IDENT _ | IF | IMMEDIATE | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | TILDE | TRY ->
          let c = _v in
          let _v = _menhir_action_65 c in
          _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_value : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState146 ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState147 ->
          _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_160 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_value (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | SEMI_SEMI ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | OUTPUT ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | LET ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | INT_LIT _v_0 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_160 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | INPUT ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | IDENT _v_2 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState160 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | BOOL_LIT _v_4 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_160 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | _ ->
          _eRR ()
  
  and _menhir_run_137 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SEMI_SEMI (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState137 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | _ ->
          _eRR ()
  
  and _menhir_run_024 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | RPAREN ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | INT_LIT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos_0, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | IDENT _v ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos_1, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState024 _tok
      | FUN ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | BOOL_LIT _v ->
          let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos_2, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LOCAL (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos_0, _endpos) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DIV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | IDENT _v_1 ->
                      let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_3 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_1, _startpos_2, _endpos_3) in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | GT ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | EQ ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | LPAREN ->
                                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
                              | INT_LIT _v_4 ->
                                  let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
                                  let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  let (_endpos_n_, _startpos_n_, n) = (_endpos_6, _startpos_5, _v_4) in
                                  let _v = _menhir_action_13 n in
                                  _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v MenhirState031 _tok
                              | BOOL_LIT _v_8 ->
                                  let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
                                  let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
                                  let _v = _menhir_action_12 b in
                                  _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v MenhirState031 _tok
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState033 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REC ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos_0, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_1 ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState098
          | EQ ->
              let _menhir_stack = MenhirCell1_EQ (_menhir_stack, MenhirState098) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRY ->
                  _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | TILDE ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | RAISE ->
                  _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | QUESTION_MARK ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | NOT ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | LPAREN ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | LOCAL ->
                  _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | LET ->
                  _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | INT_LIT _v_2 ->
                  let _startpos_3 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_n_, _startpos_n_, n) = (_endpos_4, _startpos_3, _v_2) in
                  let _v = _menhir_action_13 n in
                  _menhir_run_046_spec_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
              | IMMEDIATE ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | IF ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | IDENT _v_6 ->
                  let _startpos_7 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_8 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_x_, _startpos_x_, x) = (_endpos_8, _startpos_7, _v_6) in
                  let _v = _menhir_action_61 x in
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState099 _tok
              | DO ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | BOOL_LIT _v_10 ->
                  let _startpos_11 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_12 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_b_, _startpos_b_, b) = (_endpos_12, _startpos_11, _v_10) in
                  let _v = _menhir_action_12 b in
                  _menhir_run_046_spec_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
              | ABORT ->
                  _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LET -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036
      | _ ->
          _eRR ()
  
  and _menhir_run_037 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState037
      | EQ | RIGHT_ARROW ->
          let x = _v in
          let _v = _menhir_action_37 x in
          _menhir_goto_nonempty_list_IDENT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_IDENT_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState145 ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState156 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState149 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_166 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState167 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_167 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState167 _tok
  
  and _menhir_run_059 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TILDE ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | LPAREN ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | INT_LIT _v_0 ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IDENT _v_4 ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
          let _v = _menhir_action_61 x in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState059 _tok
      | BOOL_LIT _v_8 ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT | AMP_AMP | AND | DO | ELSE | EOF | EQEQ | IF | IMMEDIATE | IN | INPUT | LE | LET | LOCAL | LT | MINUS | NOT | OR | OUTPUT | PLUS | RAISE | RPAREN | SEMI_SEMI | THEN | TIMES | TRY | WHEN | WITH ->
          let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_11 a in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_059 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_atom -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState059 _tok
  
  and _menhir_run_044 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TILDE ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | QUESTION_MARK ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | LPAREN ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | INT_LIT _v_0 ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IDENT _v_4 ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
          let _v = _menhir_action_61 x in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState044 _tok
      | BOOL_LIT _v_8 ->
          let _menhir_stack = MenhirCell1_simple_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT | AMP_AMP | AND | DO | ELSE | EOF | EQEQ | IF | IMMEDIATE | IN | INPUT | LE | LET | LOCAL | LT | MINUS | NOT | OR | OUTPUT | PLUS | RAISE | RPAREN | SEMI_SEMI | THEN | TIMES | TRY | WHEN | WITH ->
          let (_endpos_x_, x) = (_endpos, _v) in
          let _v = _menhir_action_39 x in
          _menhir_goto_nonempty_list_simple_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_044 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_atom -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState044 _tok
  
  and _menhir_goto_nonempty_list_simple_atom_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState059 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState042 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_060 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_atom -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_simple_atom (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
      let (_endpos_args_, args) = (_endpos, _v) in
      let _v = _menhir_action_24 a args in
      _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_args_ _startpos_a_ _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IMMEDIATE _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, f, _, _) = _menhir_stack in
      let MenhirCell1_IMMEDIATE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_args_, args) = (_endpos, _v) in
      let _v = _menhir_action_25 args f in
      _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_args_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_045 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_atom -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_simple_atom (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let (_endpos_xs_, xs) = (_endpos, _v) in
      let _v = _menhir_action_40 x xs in
      _menhir_goto_nonempty_list_simple_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
  
  and _menhir_run_041 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_IMMEDIATE (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos_0, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | LPAREN ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | INT_LIT _v_1 ->
              let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_3 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_3, _startpos_2, _v_1) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IDENT _v_5 ->
              let _startpos_6 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_7 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_7, _startpos_6, _v_5) in
              let _v = _menhir_action_61 x in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState042 _tok
          | BOOL_LIT _v_9 ->
              let _startpos_10 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_11 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_11, _startpos_10, _v_9) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_042 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IMMEDIATE _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState042 _tok
  
  and _menhir_run_048 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | INT_LIT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos_0, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_048 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | IDENT _v ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos_1, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState048 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | BOOL_LIT _v ->
          let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos_2, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_048 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_048 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState048 _tok
  
  and _menhir_run_049 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_DO (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NEXT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_36 x in
              _menhir_goto_next _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NEXT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v in
                      let _v = _menhir_action_35 x in
                      _menhir_goto_next _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_next : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DO -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_next (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState057 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_057 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState057 _tok
  
  and _menhir_run_058 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_ABORT (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | INT_LIT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos_0, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | IDENT _v ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos_1, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState058 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | BOOL_LIT _v ->
          let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos_2, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_058 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ABORT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState058 _tok
  
  and _menhir_run_157 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_ARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState158 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState158
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_158 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState158 _tok
  
  and _menhir_run_150 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_ARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState151 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState151
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_151 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState151 _tok
  
  and _menhir_run_116 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FUN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHT_ARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState117 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_117 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FUN, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState117 _tok
  
  and _menhir_run_109 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState110 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_110 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState110 _tok
  
  and _menhir_run_039 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | INT_LIT _v_0 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | IDENT _v_2 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState040 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | BOOL_LIT _v_4 ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_040 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState040 _tok
  
  and _menhir_run_038 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 x xs in
      _menhir_goto_nonempty_list_IDENT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_046_spec_099 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState099 _tok
  
  and _menhir_run_046_spec_033 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, ttv_result) _menhir_cell1_const -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState033 _tok
  
  and _menhir_run_046_spec_024 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState024 _tok
  
  and _menhir_run_115 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState115
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_137 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_SEMI_SEMI -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState137 _tok
  
  and _menhir_run_139 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OUTPUT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState139
      | _ ->
          _eRR ()
  
  and _menhir_run_140 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
          | INT_LIT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_13 n in
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL_LIT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v_4 in
              let _v = _menhir_action_12 b in
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | ABORT | BOOL_LIT _ | COMMA | DO | IDENT _ | IF | IMMEDIATE | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | SEMI_SEMI | TILDE | TRY ->
          let x = _v in
          let _v = _menhir_action_42 x in
          _menhir_goto_output_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_142 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_43 c x in
      _menhir_goto_output_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_output_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_output_decl (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState172
          | _ ->
              _eRR ())
      | ABORT | BOOL_LIT _ | DO | IDENT _ | IF | IMMEDIATE | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | SEMI_SEMI | TILDE | TRY ->
          let x = _v in
          let _v = _menhir_action_55 x in
          _menhir_goto_separated_nonempty_list_COMMA_output_decl_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_output_decl_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState172 ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState139 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_173 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_output_decl -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_output_decl (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_56 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_output_decl_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_143 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_OUTPUT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_output_decl_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | SEMI_SEMI ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | OUTPUT ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | LET ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | INT_LIT _v_0 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | INPUT ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | IDENT _v_2 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState143 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | BOOL_LIT _v_4 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState143
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_144 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REC ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos_0, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_1 ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState145
          | EQ ->
              let _menhir_stack = MenhirCell1_EQ (_menhir_stack, MenhirState145) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRY ->
                  _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | TILDE ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | RAISE ->
                  _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | QUESTION_MARK ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | NOT ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | LPAREN ->
                  _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | LOCAL ->
                  _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | LET ->
                  _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | INT_LIT _v_2 ->
                  let _startpos_3 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_n_, _startpos_n_, n) = (_endpos_4, _startpos_3, _v_2) in
                  let _v = _menhir_action_13 n in
                  _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v MenhirState146 _tok
              | IMMEDIATE ->
                  _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | IF ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | IDENT _v_6 ->
                  _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState146
              | FUN ->
                  let _menhir_stack = MenhirCell1_FUN (_menhir_stack, MenhirState146) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | IDENT _v ->
                      _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState156
                  | _ ->
                      _eRR ())
              | DO ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | BOOL_LIT _v_8 ->
                  let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
                  let _v = _menhir_action_12 b in
                  _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v MenhirState146 _tok
              | ABORT ->
                  _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_147 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | RPAREN ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | LPAREN ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | INT_LIT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos_0, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v MenhirState147 _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | IDENT _v ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState147
      | FUN ->
          let _menhir_stack = MenhirCell1_FUN (_menhir_stack, MenhirState147) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState149
          | _ ->
              _eRR ())
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | BOOL_LIT _v ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos_1, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v MenhirState147 _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | _ ->
          _eRR ()
  
  and _menhir_run_148 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AMP_AMP | AND | EQEQ | IN | LE | LT | MINUS | OR | PLUS | TIMES ->
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_goto_simple_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v _menhir_s _tok
      | ABORT | BOOL_LIT _ | DO | IDENT _ | IF | IMMEDIATE | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | TILDE | TRY ->
          let x = _v in
          let _v = _menhir_action_66 x in
          _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_143 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_OUTPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_output_decl_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState143 _tok
  
  and _menhir_run_161 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_INPUT (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState161
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_160 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_value -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState160 _tok
  
  and _menhir_run_153 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let v = _v in
          let _v = _menhir_action_64 v in
          _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_046_spec_136 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState136 _tok
  
  and _menhir_run_046_spec_168 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState168 _tok
  
  and _menhir_run_046_spec_162 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_INPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState162 _tok
  
  and _menhir_run_046_spec_014 : type  ttv_stack. ((ttv_stack, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_cell1_const -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState014 _tok
  
  and _menhir_run_046_spec_015 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_TRY -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState015 _tok
  
  and _menhir_run_046_spec_128 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_TRY, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WITH _menhir_cell0_UP_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState128 _tok
  
  and _menhir_run_046_spec_022 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let (_endpos_c_, c) = (_endpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _v _tok
  
  and _menhir_run_046_spec_023 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState023 _tok
  
  and _menhir_run_046_spec_112 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState112 _tok
  
  and _menhir_run_046_spec_105 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState105 _tok
  
  and _menhir_run_046_spec_107 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState107 _tok
  
  and _menhir_run_046_spec_101 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState101 _tok
  
  and _menhir_run_046_spec_096 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET, ttv_result) _menhir_cell1_separated_nonempty_list_AND_transition_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState096 _tok
  
  and _menhir_run_046_spec_087 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState087 _tok
  
  and _menhir_run_046_spec_089 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState089 _tok
  
  and _menhir_run_046_spec_084 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState084 _tok
  
  and _menhir_run_046_spec_063 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ABORT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WHEN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState063 _tok
  
  and _menhir_run_046_spec_071 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_OR -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState071 _tok
  
  and _menhir_run_046_spec_081 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AMP_AMP -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState081 _tok
  
  and _menhir_run_046_spec_079 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_EQEQ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState079 _tok
  
  and _menhir_run_046_spec_077 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LE -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState077 _tok
  
  and _menhir_run_046_spec_075 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState075 _tok
  
  and _menhir_run_046_spec_073 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState073 _tok
  
  and _menhir_run_046_spec_069 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState069 _tok
  
  and _menhir_run_046_spec_066 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_60 c in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v MenhirState066 _tok
  
  and _menhir_run_013 : type  ttv_stack. ((ttv_stack, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_observer) _menhir_state -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHT_ARROW ->
          let _menhir_stack = MenhirCell1_const (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState014 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | _ ->
              _eRR ())
      | EOF | INPUT | OUTPUT ->
          let MenhirCell0_IDENT (_menhir_stack, x, _, _) = _menhir_stack in
          let MenhirCell1_INPUT (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let c = _v in
          let _v = _menhir_action_15 c x in
          _menhir_goto_eq _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_eq : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_observer) _menhir_state -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_eq (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OUTPUT ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | INPUT ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | EOF ->
          let _v = _menhir_action_33 () in
          _menhir_run_135 _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_observer) _menhir_state -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_INPUT (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos_0, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState008
              | INT_LIT _v_1 ->
                  let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_3 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_n_, _startpos_n_, n) = (_endpos_3, _startpos_2, _v_1) in
                  let _v = _menhir_action_13 n in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v MenhirState008 _tok
              | BOOL_LIT _v_5 ->
                  let _startpos_6 = _menhir_lexbuf.Lexing.lex_start_p in
                  let _endpos_7 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos_b_, _startpos_b_, b) = (_endpos_7, _startpos_6, _v_5) in
                  let _v = _menhir_action_12 b in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v MenhirState008 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState069 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState071 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState073 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState075 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState077 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
      | _ ->
          _eRR ()
  
  and _menhir_run_112 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState112 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EQEQ (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState079 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AMP_AMP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState081 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | _ ->
          _eRR ()
  
  and _menhir_run_159 : type  ttv_stack. (((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | ABORT | BOOL_LIT _ | DO | IDENT _ | IF | IMMEDIATE | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | SEMI_SEMI | TILDE | TRY ->
          let MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_67 e xs in
          _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_152 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | RPAREN ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | _ ->
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FUN, ttv_result) _menhir_cell1_nonempty_list_IDENT_, ttv_result) _menhir_cell1_exp -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_exp (_menhir_stack, _, e, _, _) = _menhir_stack in
      let MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let _endpos__6_ = _endpos in
      let _v = _menhir_action_62 e xs in
      _menhir_goto_simple_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_138 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_SEMI_SEMI as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
      | EOF ->
          let MenhirCell1_SEMI_SEMI (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_50 e in
          _menhir_goto_rprog _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_130 : type  ttv_stack. (((ttv_stack, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_observer) _menhir_state -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | EOF | INPUT | OUTPUT ->
          let MenhirCell1_const (_menhir_stack, _, c, _, _) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, x, _, _) = _menhir_stack in
          let MenhirCell1_INPUT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_a_, a) = (_endpos, _v) in
          let _v = _menhir_action_16 _endpos_a_ _startpos__1_ a c x in
          _menhir_goto_eq _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_129 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_TRY, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WITH _menhir_cell0_UP_IDENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell0_UP_IDENT (_menhir_stack, exc, _) = _menhir_stack in
          let MenhirCell1_WITH (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, e1, _, _) = _menhir_stack in
          let MenhirCell1_TRY (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e2_, e2) = (_endpos, _v) in
          let _v = _menhir_action_30 e1 e2 exc in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e2_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_125 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_TRY as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          let _menhir_stack = MenhirCell1_WITH (_menhir_stack, MenhirState125) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UP_IDENT _v_0 ->
              let _endpos_1 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _menhir_stack = MenhirCell0_UP_IDENT (_menhir_stack, _v_0, _endpos_1) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RIGHT_ARROW ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TRY ->
                      _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | TILDE ->
                      _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | RAISE ->
                      _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | QUESTION_MARK ->
                      _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | NOT ->
                      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | LPAREN ->
                      _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | LOCAL ->
                      _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | LET ->
                      _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | INT_LIT _v_2 ->
                      let _startpos_3 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_endpos_n_, _startpos_n_, n) = (_endpos_4, _startpos_3, _v_2) in
                      let _v = _menhir_action_13 n in
                      _menhir_run_046_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
                  | IMMEDIATE ->
                      _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | IF ->
                      _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | IDENT _v_6 ->
                      let _startpos_7 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_8 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_endpos_x_, _startpos_x_, x) = (_endpos_8, _startpos_7, _v_6) in
                      let _v = _menhir_action_61 x in
                      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState128 _tok
                  | DO ->
                      _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | BOOL_LIT _v_10 ->
                      let _startpos_11 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_12 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_endpos_b_, _startpos_b_, b) = (_endpos_12, _startpos_11, _v_10) in
                      let _v = _menhir_action_12 b in
                      _menhir_run_046_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
                  | ABORT ->
                      _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | _ ->
          _eRR ()
  
  and _menhir_run_122 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | RPAREN ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (a, _endpos__3_) = (_v, _endpos_0) in
          let _v = _menhir_action_57 _endpos__3_ _startpos__1_ a in
          _menhir_goto_simple_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | RPAREN ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (e, _endpos__3_) = (_v, _endpos_0) in
          let _v = _menhir_action_22 e in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | _ ->
          _eRR ()
  
  and _menhir_run_118 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FUN, ttv_result) _menhir_cell1_nonempty_list_IDENT_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | RPAREN ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
      | _ ->
          _eRR ()
  
  and _menhir_run_114 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, ttv_result) _menhir_cell1_const as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_const (_menhir_stack, _, c, _, _) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, y, _, _) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, x, _, _) = _menhir_stack in
          let MenhirCell1_LOCAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_28 c e x y in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_113 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, e1, _, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, x, _, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e2_, e2) = (_endpos, _v) in
          let _v = _menhir_action_20 e1 e2 x xs in
          _menhir_goto_exp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e2_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_111 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | IN ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack ttv_result. (((((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, e2, _, _) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, x2, _, _) = _menhir_stack in
          let MenhirCell1_AND (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, e1, _, _) = _menhir_stack in
          let MenhirCell1_EQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, x1, _, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_21 e e1 e2 x1 x2 in
          _menhir_goto_exp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState106) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState107 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | _ ->
              _eRR ())
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, e1, _, _) = _menhir_stack in
          let MenhirCell1_EQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, x1, _, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_19 e e1 x1 in
          _menhir_goto_exp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState100) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState101 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
          | _ ->
              _eRR ())
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | AND ->
          let _menhir_stack = MenhirCell1_AND (_menhir_stack, MenhirState100) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_12 ->
              let _startpos_13 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_14 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_12, _startpos_13, _endpos_14) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TRY ->
                      _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | TILDE ->
                      _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | RAISE ->
                      _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | QUESTION_MARK ->
                      _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | NOT ->
                      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | LPAREN ->
                      _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | LOCAL ->
                      _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | LET ->
                      _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | INT_LIT _v_15 ->
                      let _startpos_16 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_17 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_endpos_n_, _startpos_n_, n) = (_endpos_17, _startpos_16, _v_15) in
                      let _v = _menhir_action_13 n in
                      _menhir_run_046_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
                  | IMMEDIATE ->
                      _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | IF ->
                      _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | IDENT _v_19 ->
                      let _startpos_20 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_21 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_endpos_x_, _startpos_x_, x) = (_endpos_21, _startpos_20, _v_19) in
                      let _v = _menhir_action_61 x in
                      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState105 _tok
                  | DO ->
                      _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | BOOL_LIT _v_23 ->
                      let _startpos_24 = _menhir_lexbuf.Lexing.lex_start_p in
                      let _endpos_25 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_endpos_b_, _startpos_b_, b) = (_endpos_25, _startpos_24, _v_23) in
                      let _v = _menhir_action_12 b in
                      _menhir_run_046_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
                  | ABORT ->
                      _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LET, ttv_result) _menhir_cell1_separated_nonempty_list_AND_transition_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_separated_nonempty_list_AND_transition_ (_menhir_stack, _, ts) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_23 e ts in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | AND | IN ->
          let MenhirCell1_nonempty_list_IDENT_ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, f, _, _) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_63 e f xs in
          (match (_tok : MenhirBasics.token) with
          | AND ->
              let _menhir_stack = MenhirCell1_transition (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v ->
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState093
              | _ ->
                  _eRR ())
          | IN ->
              let x = _v in
              let _v = _menhir_action_51 x in
              _menhir_goto_separated_nonempty_list_AND_transition_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_AND_transition_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState035 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_095 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_separated_nonempty_list_AND_transition_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | LET ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | INT_LIT _v_0 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v_0) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | IDENT _v_2 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v_2) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState096 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | BOOL_LIT _v_4 ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v_4) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_transition -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_transition (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_52 x xs in
      _menhir_goto_separated_nonempty_list_AND_transition_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_090 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, e1, _, _) = _menhir_stack in
          let MenhirCell1_atom (_menhir_stack, _, a, _, _) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e2_, e2) = (_endpos, _v) in
          let _v = _menhir_action_26 a e1 e2 in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e2_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | ELSE ->
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState088) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState089 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
          | _ ->
              _eRR ())
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _, a, _, _) = _menhir_stack in
          let MenhirCell0_next (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_DO (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_27 _endpos_e_ _startpos__1_ a e x in
          _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState083) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState084 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | _ ->
              _eRR ())
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AMP_AMP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_AMP_AMP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_08 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_EQEQ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
      | ABORT | AMP_AMP | AND | BOOL_LIT _ | DO | ELSE | EOF | EQEQ | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LE | LET | LOCAL | LPAREN | LT | NOT | OR | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_EQEQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_07 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
      | ABORT | AMP_AMP | AND | BOOL_LIT _ | DO | ELSE | EOF | EQEQ | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LE | LET | LOCAL | LPAREN | LT | NOT | OR | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_LE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_06 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
      | ABORT | AMP_AMP | AND | BOOL_LIT _ | DO | ELSE | EOF | EQEQ | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LE | LET | LOCAL | LPAREN | LT | NOT | OR | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_LT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_05 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState074
      | ABORT | AMP_AMP | AND | BOOL_LIT _ | DO | ELSE | EOF | EQEQ | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LE | LET | LOCAL | LPAREN | LT | MINUS | NOT | OR | OUTPUT | PLUS | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_MINUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_03 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_OR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | PLUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | OR ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | MINUS ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | LT ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | LE ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | EQEQ ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | AMP_AMP ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | ABORT | AND | BOOL_LIT _ | DO | ELSE | EOF | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LET | LOCAL | LPAREN | NOT | OUTPUT | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_OR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_09 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_PLUS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
      | ABORT | AMP_AMP | AND | BOOL_LIT _ | DO | ELSE | EOF | EQEQ | IDENT _ | IF | IMMEDIATE | IN | INPUT | INT_LIT _ | LE | LET | LOCAL | LPAREN | LT | MINUS | NOT | OR | OUTPUT | PLUS | QUESTION_MARK | RAISE | RPAREN | SEMI_SEMI | THEN | TILDE | TRY | WHEN | WITH ->
          let MenhirCell1_PLUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
          let (_endpos_a2_, a2) = (_endpos, _v) in
          let _v = _menhir_action_02 _endpos_a2_ _startpos_a1_ a1 a2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_TIMES (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_exp (_menhir_stack, _menhir_s, a1, _startpos_a1_, _) = _menhir_stack in
      let (_endpos_a2_, a2) = (_endpos, _v) in
      let _v = _menhir_action_04 _endpos_a2_ _startpos_a1_ a1 a2 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a2_ _startpos_a1_ _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ABORT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | WHEN ->
          let _menhir_stack = MenhirCell1_WHEN (_menhir_stack, MenhirState062) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | TILDE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | RAISE ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | QUESTION_MARK ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | NOT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | LPAREN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | LOCAL ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | LET ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | INT_LIT _v_0 ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_n_, _startpos_n_, n) = (_endpos_2, _startpos_1, _v_0) in
              let _v = _menhir_action_13 n in
              _menhir_run_046_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
          | IMMEDIATE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | IF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | IDENT _v_4 ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_6 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_x_, _startpos_x_, x) = (_endpos_6, _startpos_5, _v_4) in
              let _v = _menhir_action_61 x in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState063 _tok
          | DO ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | BOOL_LIT _v_8 ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos_10 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_b_, _startpos_b_, b) = (_endpos_10, _startpos_9, _v_8) in
              let _v = _menhir_action_12 b in
              _menhir_run_046_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
          | ABORT ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
          | _ ->
              _eRR ())
      | TIMES ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | PLUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | OR ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | MINUS ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | LT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | LE ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | EQEQ ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | AMP_AMP ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ABORT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WHEN -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_WHEN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_exp (_menhir_stack, _, e, _, _) = _menhir_stack in
      let MenhirCell1_ABORT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_a_, a) = (_endpos, _v) in
      let _v = _menhir_action_31 _endpos_a_ _startpos__1_ a e in
      _menhir_goto_lexp _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_061_spec_167 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState167 _tok
  
  and _menhir_run_061_spec_146 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState146 _tok
  
  and _menhir_run_061_spec_158 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState158 _tok
  
  and _menhir_run_061_spec_147 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState147 _tok
  
  and _menhir_run_061_spec_151 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState151 _tok
  
  and _menhir_run_061_spec_137 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_SEMI_SEMI -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState137 _tok
  
  and _menhir_run_061_spec_014 : type  ttv_stack. ((ttv_stack, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_cell1_const -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState014 _tok
  
  and _menhir_run_061_spec_128 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_TRY, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WITH _menhir_cell0_UP_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState128 _tok
  
  and _menhir_run_061_spec_015 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_TRY -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState015 _tok
  
  and _menhir_run_061_spec_023 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState023 _tok
  
  and _menhir_run_061_spec_024 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState024 _tok
  
  and _menhir_run_061_spec_117 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FUN, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState117 _tok
  
  and _menhir_run_061_spec_033 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, ttv_result) _menhir_cell1_const -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState033 _tok
  
  and _menhir_run_061_spec_112 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState112 _tok
  
  and _menhir_run_061_spec_110 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState110 _tok
  
  and _menhir_run_061_spec_107 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState107 _tok
  
  and _menhir_run_061_spec_105 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState105 _tok
  
  and _menhir_run_061_spec_101 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState101 _tok
  
  and _menhir_run_061_spec_099 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState099 _tok
  
  and _menhir_run_061_spec_096 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET, ttv_result) _menhir_cell1_separated_nonempty_list_AND_transition_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState096 _tok
  
  and _menhir_run_061_spec_040 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState040 _tok
  
  and _menhir_run_061_spec_089 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState089 _tok
  
  and _menhir_run_061_spec_087 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState087 _tok
  
  and _menhir_run_061_spec_048 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState048 _tok
  
  and _menhir_run_061_spec_084 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState084 _tok
  
  and _menhir_run_061_spec_057 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState057 _tok
  
  and _menhir_run_061_spec_081 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AMP_AMP -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState081 _tok
  
  and _menhir_run_061_spec_079 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_EQEQ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState079 _tok
  
  and _menhir_run_061_spec_077 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LE -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState077 _tok
  
  and _menhir_run_061_spec_075 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState075 _tok
  
  and _menhir_run_061_spec_073 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState073 _tok
  
  and _menhir_run_061_spec_071 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_OR -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState071 _tok
  
  and _menhir_run_061_spec_069 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState069 _tok
  
  and _menhir_run_061_spec_066 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _tok
  
  and _menhir_run_061_spec_058 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ABORT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_18 e in
      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v MenhirState058 _tok
  
  and _menhir_run_068_spec_136 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v MenhirState136 _tok
  
  and _menhir_run_068_spec_143 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_OUTPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_output_decl_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v MenhirState143 _tok
  
  and _menhir_run_068_spec_167 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_168 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_, _menhir_box_prog) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v MenhirState168 _tok
  
  and _menhir_run_068_spec_146 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_160 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_value -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v MenhirState160 _tok
  
  and _menhir_run_068_spec_162 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_INPUT, _menhir_box_prog) _menhir_cell1_separated_nonempty_list_COMMA_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v MenhirState162 _tok
  
  and _menhir_run_068_spec_158 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_cell1_EQ, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_147 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_147 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_151 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_FUN, _menhir_box_prog) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_137 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_SEMI_SEMI -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_014 : type  ttv_stack. ((ttv_stack, _menhir_box_observer) _menhir_cell1_INPUT _menhir_cell0_IDENT, _menhir_box_observer) _menhir_cell1_const -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_015 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_TRY -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_128 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_TRY, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WITH _menhir_cell0_UP_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_023 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_024 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_117 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FUN, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_033 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOCAL _menhir_cell0_IDENT _menhir_cell0_IDENT, ttv_result) _menhir_cell1_const -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_110 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_112 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_099 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_105 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_107 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AND _menhir_cell0_IDENT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_101 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_IDENT, ttv_result) _menhir_cell1_EQ, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_096 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET, ttv_result) _menhir_cell1_separated_nonempty_list_AND_transition_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_040 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IDENT, ttv_result) _menhir_cell1_nonempty_list_IDENT_ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_087 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_089 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_atom, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_057 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_084 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_DO _menhir_cell0_next, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_058 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ABORT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_063 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ABORT, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_WHEN -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let (_endpos_a_, a) = (_endpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _v _tok
  
  and _menhir_run_068_spec_071 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_OR -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_081 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_AMP_AMP -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_079 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_EQEQ -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_077 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LE -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_075 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_LT -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_073 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_069 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _tok
  
  and _menhir_run_068_spec_066 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let (_endpos_a_, a) = (_endpos, _v) in
      let _v = _menhir_action_32 a in
      _menhir_run_061_spec_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _v _tok
  
  and _menhir_run_005 : type  ttv_stack. (ttv_stack, _menhir_box_observer) _menhir_cell1_OUTPUT -> _ -> _ -> _ -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_OUTPUT (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_17 xs in
      _menhir_goto_eq _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_004 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_54 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_observer =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | OUTPUT ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | INPUT ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF ->
          let _v = _menhir_action_33 () in
          _menhir_run_132 _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_136 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | TILDE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | SEMI_SEMI ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | RAISE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | QUESTION_MARK ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | OUTPUT ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | NOT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | LPAREN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | LOCAL ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | LET ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | INT_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_13 n in
          _menhir_run_046_spec_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _tok
      | INPUT ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | IMMEDIATE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | IF ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_61 x in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v MenhirState136 _tok
      | DO ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | BOOL_LIT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 b in
          _menhir_run_046_spec_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_b_ _v _tok
      | ABORT ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let observer =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_observer v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
