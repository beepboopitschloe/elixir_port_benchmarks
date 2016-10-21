# PortBenchmark

Quick-and-dirty benchmarks for using Ports to communicate with various
languages.

## Latest Stats

Here are the results as of Oct 21, 4:45 PM CST on a mid-2015 15" Macbook Pro:

| language | average time |
| -------- | ------------ |
| go       | 63.14 µs/op  | 
| java     | 64.47 µs/op  |
| node     | 69.07 µs/op  |

## Running the Benchmarks

```
$ mix deps.get
$ mix compile
$ mix bench
```

## Contributing

If you'd like to add new benchmarks for other languages, please do! Right now
there is no structure to speak of; just add the necessary code to `./bench/`.
