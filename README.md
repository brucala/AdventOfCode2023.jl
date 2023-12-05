# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬────────┐
│ day │ part │       time │     memory │ allocs │
├─────┼──────┼────────────┼────────────┼────────┤
│   1 │    0 │  68.363 μs │ 109.31 KiB │     31 │
│   1 │    1 │ 170.294 μs │ 134.27 KiB │   3001 │
│   1 │    2 │ 710.070 μs │  48.33 KiB │   1001 │
├─────┼──────┼────────────┼────────────┼────────┤
│   2 │    0 │ 127.460 μs │  62.19 KiB │    330 │
│   2 │    1 │ 393.404 μs │ 200.16 KiB │   1560 │
│   2 │    2 │ 684.144 μs │ 371.30 KiB │   3302 │
├─────┼──────┼────────────┼────────────┼────────┤
│   3 │    0 │   3.222 ms │ 336.09 KiB │     65 │
│   3 │    1 │   4.422 ms │    0 bytes │      0 │
│   3 │    2 │   4.083 ms │    0 bytes │      0 │
├─────┼──────┼────────────┼────────────┼────────┤
│   4 │    0 │   1.697 ms │ 834.33 KiB │   2651 │
│   4 │    1 │ 366.277 μs │ 381.05 KiB │   2846 │
│   4 │    2 │ 374.089 μs │ 399.45 KiB │   3026 │
└─────┴──────┴────────────┴────────────┴────────┘

```

> **Part 0** refers to the **parsing of the input data**.

Results above run under the following `versioninfo()`:
```
Julia Version 1.9.4
Commit 8e5136fa297 (2023-11-14 08:46 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
  CPU: 4 × Intel(R) Core(TM) i7-5500U CPU @ 2.40GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-14.0.6 (ORCJIT, broadwell)
  Threads: 1 on 4 virtual cores

```

## Other CLI tools

To generate (src and test) templates for a given day:
```
$ julia cli/generate_day.jl -h
usage: generate_day.jl [-h] nday

positional arguments:
  nday        day number for files to be generated

optional arguments:
  -h, --help  show this help message and exit
```

To download the input data of a given day:
```
$ julia cli/get_input.jl -h
usage: get_input.jl [-d DAY] [-h]

optional arguments:
  -d, --day DAY  day number for the input to be downloaded. If not
                 given take today's input (type: Int64)
  -h, --help     show this help message and exit
```
