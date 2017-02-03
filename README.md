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
  [11:55:00] 1/8: go
  [11:55:03] 2/8: java
  [11:55:04] 3/8: node
  [11:55:06] 4/8: rust
  ## SmallMsgBench
  small message is 102 bytes.
  [11:55:09] 5/8: go
  [11:55:12] 6/8: java
  [11:55:14] 7/8: node
  [11:55:18] 8/8: rust

  Finished in 20.06 seconds

  ## LargeMsgBench
  bench iterations   average time
  rust       50000   54.48 µs/op
  go         20000   93.18 µs/op
  node       10000   137.10 µs/op
  java        5000   209.14 µs/op
  ## SmallMsgBench
  bench iterations   average time
  rust      100000   20.69 µs/op
  go        100000   23.48 µs/op
  java       50000   35.86 µs/op
  node       50000   53.84 µs/op
```

## Running the Benchmarks

```
$ mix deps.get
$ mix compile
$ mix bench
```

## Contributing

If you'd like to add new benchmarks for other languages, please do! Right now
there is no structure to speak of; just add the necessary code to `./bench/`.
