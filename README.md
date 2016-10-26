# PortBenchmark

Quick-and-dirty benchmarks for using Ports to communicate with various
languages.

## Latest Stats

Here are the results as of Oct 26 on a mid-2015 15" Macbook Pro:

```
Settings:
  duration:      1.0 s

## LargeMsgBench
large message is 8010 bytes.
[11:13:39] 1/6: go
[11:13:42] 2/6: java
[11:13:44] 3/6: node
## SmallMsgBench
small message is 102 bytes.
[11:13:47] 4/6: go
[11:13:48] 5/6: java
[11:13:50] 6/6: node

Finished in 14.09 seconds

## LargeMsgBench
bench iterations   average time 
go        100000   25.27 µs/op
node       50000   36.81 µs/op
java       50000   38.24 µs/op
## SmallMsgBench
bench iterations   average time 
go        100000   12.48 µs/op
java      100000   17.35 µs/op
node      100000   28.24 µs/op
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
