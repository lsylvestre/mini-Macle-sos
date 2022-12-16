{
  open Parser
  exception Eof

  let hashtbl_of_list_assoc l =
    let h = Hashtbl.create (List.length l) in
    List.iter (fun (k,v) -> Hashtbl.add h k v) l;
    h

  let keywords =
    hashtbl_of_list_assoc @@
     [ "let",   LET;
       "rec",   REC;
       "fun",   FUN;
       "and",   AND;
       "in",    IN;
       "if",    IF;
       "then",  THEN;
       "else",  ELSE;
       "true",  BOOL_LIT true;
       "false", BOOL_LIT false;
       "not",   NOT;
       "immediate", IMMEDIATE;
       "raise", RAISE;
       "try",   TRY;
       "with",  WITH;
       "do",    DO;
       "next",  NEXT;
       "input", INPUT;
       "output", OUTPUT;
       "or",    OR;
       "local", LOCAL;
       "abort", ABORT;
       "when",  WHEN;
     ]
}

let tvar_ident = [''']['a'-'z'] ['a'-'z''A'-'Z''0'-'9''_''A'-'Z'''']*
let ident = ['a'-'z''_'] ['a'-'z''A'-'Z''0'-'9''_''A'-'Z'''']*
let up_ident = ['A'-'Z']['a'-'z''A'-'Z''0'-'9''_''A'-'Z'''']*

rule token = parse
| ident as id         { try Hashtbl.find keywords id with
                        | Not_found -> IDENT id }
| "Failure"           { FAILURE }
| "Invalid_arg"       { INVALID_ARG }
| up_ident as lxm     { UP_IDENT lxm }
| tvar_ident as lxm   { QUOTE_TVAR lxm }
| '('                 { LPAREN }
| ')'                 { RPAREN }
| "~"                 { TILDE }
| ','                 { COMMA }
| "->"                { RIGHT_ARROW }
| "||"                { PIPE_PIPE }
| (['0'-'9']+) as n  { INT_LIT (int_of_string n) }
| "+"                 { PLUS }
| "-"                 { MINUS }
| "*"                 { TIMES }
| "/"                 { DIV }
| "<"                 { LT }
| "<="                { LE }
| ">"                 { GT }
| ">="                { GE }
| "="                 { EQ }
| "=="                { EQEQ }
| "&&"                { AMP_AMP }
| ['?']               { QUESTION_MARK }
| ['"']([^'"']* as s)['"'] { STRING_LIT s }
| ['_']               { WILDCARD }
| ['\n' ]             { (Lexing.new_line lexbuf) ; (token lexbuf) }
| [' ' '\t']          { token lexbuf }
| ";;"                { SEMI_SEMI }
| eof                 { EOF }
| "(*"                { comment lexbuf }
| _  as lxm           { failwith (Printf.sprintf "Unexpected character: %c"  lxm) }

and comment = parse
| "*)" { token lexbuf }
| _    { comment lexbuf }
