# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬────────┐
│ day │ part │       time │     memory │ allocs │
├─────┼──────┼────────────┼────────────┼────────┤
│   1 │    0 │  35.789 μs │ 109.31 KiB │     31 │
│   1 │    1 │  89.436 μs │ 134.27 KiB │   3001 │
│   1 │    2 │   1.134 ms │   1.00 MiB │  63690 │
├─────┼──────┼────────────┼────────────┼────────┤
│   2 │    0 │  65.321 μs │  62.19 KiB │    330 │
│   2 │    1 │ 214.040 μs │ 200.16 KiB │   1560 │
│   2 │    2 │ 377.394 μs │ 371.30 KiB │   3302 │
├─────┼──────┼────────────┼────────────┼────────┤
│   3 │    0 │   2.135 ms │ 336.09 KiB │     65 │
│   3 │    1 │   1.958 ms │    0 bytes │      0 │
│   3 │    2 │   1.901 ms │    0 bytes │      0 │
├─────┼──────┼────────────┼────────────┼────────┤
│   4 │    0 │ 969.189 μs │ 834.33 KiB │   2651 │
│   4 │    1 │ 235.989 μs │ 381.05 KiB │   2846 │
│   4 │    2 │ 208.590 μs │ 399.45 KiB │   3026 │
├─────┼──────┼────────────┼────────────┼────────┤
│   5 │    0 │ 220.571 μs │ 168.82 KiB │   1769 │
│   5 │    1 │   3.203 μs │  224 bytes │      1 │
│   5 │    2 │  10.517 ms │   1.77 MiB │  19993 │
├─────┼──────┼────────────┼────────────┼────────┤
│   6 │    0 │   4.095 μs │   2.61 KiB │     33 │
│   6 │    1 │  40.041 ns │   96 bytes │      1 │
│   6 │    2 │ 566.503 ns │   1.06 KiB │     23 │
├─────┼──────┼────────────┼────────────┼────────┤
│   7 │    0 │   1.726 ms │   1.51 MiB │  20034 │
│   7 │    1 │  66.934 μs │ 140.72 KiB │      4 │
│   7 │    2 │   2.114 ms │   2.02 MiB │  28401 │
├─────┼──────┼────────────┼────────────┼────────┤
│   8 │    0 │ 491.930 μs │ 926.48 KiB │   8829 │
│   8 │    1 │ 440.095 μs │    0 bytes │      0 │
│   8 │    2 │   2.183 ms │  27.97 KiB │    818 │
└─────┴──────┴────────────┴────────────┴────────┘

```

> **Part 0** refers to the **parsing of the input data**.

Results above run under the following `versioninfo()`:
```
Julia Version 1.9.1
Commit 147bdf428cd (2023-06-07 08:27 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
  CPU: 8 × 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-14.0.6 (ORCJIT, tigerlake)
  Threads: 1 on 8 virtual cores
Environment:
  JULIA_PROJECT = @.

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
