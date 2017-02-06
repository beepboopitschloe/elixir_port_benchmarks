# PortBenchmark

Quick-and-dirty benchmarks for using Ports to communicate with various
languages.

## Latest Stats

Here are the results as of Feb 03, 2017 on a very old 2009-era AMD Phenom 2 Desktop:

```
Settings:
  duration:      1.0 s

## LargeMsgBench
large message is 8010 bytes.
[12:28:02] 1/10: go
[12:28:05] 2/10: java
[12:28:08] 3/10: node
[12:28:10] 4/10: ocaml
[12:28:13] 5/10: rust
## SmallMsgBench
small message is 102 bytes.
[12:28:16] 6/10: go
[12:28:18] 7/10: java
[12:28:21] 8/10: node
[12:28:24] 9/10: ocaml
[12:28:26] 10/10: rust

Finished in 26.72 seconds

## LargeMsgBench
benchm iterations   average time
rust        50000   53.28 µs/op
ocaml       20000   84.54 µs/op
go          20000   94.96 µs/op
node        10000   136.08 µs/op
java        10000   197.80 µs/op
## SmallMsgBench
benchm iterations   average time
rust       100000   20.90 µs/op
ocaml      100000   21.44 µs/op
go         100000   24.25 µs/op
java        50000   32.77 µs/op
node        50000   52.35 µs/op
```

## Running the Benchmarks

```
$ mix deps.get
$ mix compile
$ mix bench
```

## Compiling

Compiling the native applications for your system, run these from within the
`./bench` directory:
```sh
go compile go_port.go
rustc -C opt-level=3 rust_port.rs
ocamlopt -o ocaml_port ocaml_port.ml
```

## Contributing

If you'd like to add new benchmarks for other languages, please do! Right now
there is no structure to speak of; just add the necessary code to `./bench/`.
