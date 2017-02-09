let rec main () =
  let text = try read_line () with _ -> exit 0 in
  let () = print_string "Responding to " in
  let () = print_endline text in
  main ()

let () = main ()
