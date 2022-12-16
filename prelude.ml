type ident = string

type loc = Lexing.position * Lexing.position
let dloc = Lexing.dummy_pos, Lexing.dummy_pos

module Errors = struct

  open Format

  let reset = "\027[m"
  let bold = "\027[1m"
  let red = "\027[31m"
  let green = "\027[33m"
  let blue = "\027[34m"
  let purple = "\027[35m"

  let emph_pp color pp fmt a =
       fprintf fmt "%s%s%a%s" bold color pp a reset

  let emph color fmt s =
     emph_pp color (fun fmt s -> fprintf fmt "%s" s) fmt s

  let pp_loc fmt (Lexing.{pos_lnum=l1;pos_cnum=c1;pos_bol=b1},
                         Lexing.{pos_lnum=l2;pos_cnum=c2;pos_bol=b2}) =
    if l1 = l2
    then fprintf fmt "line %d, characters %d-%d" l1 (c1-b1) (c2-b2)
    else fprintf fmt "from line %d, characters %d, to line %d characters %d"
           l1 (c1-b1) l2 (c2-b2)

  let error ?loc pp =
    let fmt = err_formatter in
    (match loc with
    | None -> ()
    | Some loc -> fprintf fmt "%s%s%a%s:\n" bold green pp_loc loc reset);
    fprintf fmt "%s%sError%s: " bold red reset;
    pp fmt;
    exit 0

  let syntax_error ?msg loc =
    let pp fmt =
      fprintf fmt "syntax error";
      match msg with
      | None -> ()
      | Some s ->
         fprintf fmt " %s%s(%s)%s" bold blue s reset in
    error ~loc pp

  let raise_error ?msg =
    let pp fmt =
      match msg with
      | None -> ()
      | Some s ->
         fprintf fmt " %s%s(%s)%s" bold green s reset in
    error pp

end

let gensym : ?prefix:string -> unit -> ident =
  let c = ref 0 in
  fun ?(prefix="_x") ->
  fun () -> (incr c; prefix ^ "_0x" ^ string_of_int !c)
