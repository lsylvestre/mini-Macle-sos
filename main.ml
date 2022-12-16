
(* files to process *)
let inputs = ref ([] : string list)

let add_file f = inputs := !inputs @ [f]

let flag_nb_step = ref 10

(* main config *)
let () =
 Arg.parse [
   ("-n", Arg.Set_int flag_nb_step,
    "set number of logical step of the execution");
    ]
      add_file "Usage:\n  ./interp file"
;;


List.iter (fun path ->
  let chop =
    match Filename.chop_suffix_opt ~suffix:".mcl" path with
    | None -> Prelude.Errors.raise_error ~msg:"extension .mcl expected"
    | Some s -> s
  in
  let filepath_env = chop ^ ".obs" in
  let ast,env =
    let ic = open_in path in
    let ic_env = open_in filepath_env in
    try
      let lexbuf = Lexing.from_channel ic in
      let ast = Parser.prog Lexer.token lexbuf in

      let lexbuf_obs = Lexing.from_channel ic_env in
      let env = Parser.observer Lexer.token lexbuf_obs in
      close_in ic;
      close_in ic_env;
      ast,env
    with e -> (close_in_noerr ic; close_in_noerr ic_env; raise e)
  in
  let _ = Interp.chronogramme env ast !flag_nb_step in
  ()) !inputs



