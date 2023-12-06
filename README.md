# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬────────┐
│ day │ part │       time │     memory │ allocs │
├─────┼──────┼────────────┼────────────┼────────┤
│   1 │    0 │  32.443 μs │ 109.31 KiB │     31 │
│   1 │    1 │  99.508 μs │ 134.27 KiB │   3001 │
│   1 │    2 │ 342.012 μs │  48.33 KiB │   1001 │
├─────┼──────┼────────────┼────────────┼────────┤
│   2 │    0 │  77.634 μs │  62.19 KiB │    330 │
│   2 │    1 │ 214.031 μs │ 200.16 KiB │   1560 │
│   2 │    2 │ 383.506 μs │ 371.30 KiB │   3302 │
├─────┼──────┼────────────┼────────────┼────────┤
│   3 │    0 │   2.373 ms │ 336.09 KiB │     65 │
│   3 │    1 │   1.927 ms │    0 bytes │      0 │
│   3 │    2 │   1.966 ms │    0 bytes │      0 │
├─────┼──────┼────────────┼────────────┼────────┤
│   4 │    0 │   1.026 ms │ 834.33 KiB │   2651 │
│   4 │    1 │ 203.550 μs │ 381.05 KiB │   2846 │
│   4 │    2 │ 187.512 μs │ 399.45 KiB │   3026 │
├─────┼──────┼────────────┼────────────┼────────┤
│   5 │    0 │ 214.734 μs │ 168.82 KiB │   1769 │
│   5 │    1 │   3.161 μs │  224 bytes │      1 │
│   5 │    2 │  13.355 ms │   1.77 MiB │  19993 │
├─────┼──────┼────────────┼────────────┼────────┤
│   6 │    0 │   4.087 μs │   2.61 KiB │     33 │
│   6 │    1 │  40.243 ns │   96 bytes │      1 │
│   6 │    2 │ 612.377 ns │   1.06 KiB │     23 │
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
