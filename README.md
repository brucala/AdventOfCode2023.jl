# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬─────────┐
│ day │ part │       time │     memory │  allocs │
├─────┼──────┼────────────┼────────────┼─────────┤
│   1 │    0 │  36.286 μs │ 109.31 KiB │      31 │
│   1 │    1 │  96.107 μs │ 134.27 KiB │    3001 │
│   1 │    2 │   1.210 ms │   1.00 MiB │   63690 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   2 │    0 │  69.565 μs │  62.19 KiB │     330 │
│   2 │    1 │ 230.170 μs │ 200.16 KiB │    1560 │
│   2 │    2 │ 411.024 μs │ 371.30 KiB │    3302 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   3 │    0 │ 238.010 μs │ 336.09 KiB │      65 │
│   3 │    1 │   2.098 ms │    0 bytes │       0 │
│   3 │    2 │   2.116 ms │    0 bytes │       0 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   4 │    0 │   1.041 ms │ 834.33 KiB │    2651 │
│   4 │    1 │ 222.033 μs │ 381.05 KiB │    2846 │
│   4 │    2 │ 214.885 μs │ 399.45 KiB │    3026 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   5 │    0 │ 248.955 μs │ 168.82 KiB │    1769 │
│   5 │    1 │   3.348 μs │  224 bytes │       1 │
│   5 │    2 │   9.915 ms │   1.77 MiB │   19993 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   6 │    0 │   4.643 μs │   2.61 KiB │      33 │
│   6 │    1 │  44.987 ns │   96 bytes │       1 │
│   6 │    2 │ 634.337 ns │   1.06 KiB │      23 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   7 │    0 │   1.832 ms │   1.51 MiB │   20034 │
│   7 │    1 │  72.958 μs │ 140.72 KiB │       4 │
│   7 │    2 │   2.308 ms │   2.02 MiB │   28401 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   8 │    0 │ 552.951 μs │ 926.48 KiB │    8829 │
│   8 │    1 │ 439.401 μs │    0 bytes │       0 │
│   8 │    2 │   2.543 ms │  27.97 KiB │     818 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   9 │    0 │ 410.578 μs │ 360.95 KiB │     831 │
│   9 │    1 │  63.969 μs │ 322.05 KiB │    1866 │
│   9 │    2 │  83.012 μs │ 365.75 KiB │    2064 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  10 │    0 │ 208.075 μs │ 285.96 KiB │      46 │
│  10 │    1 │   1.853 ms │   5.71 MiB │   53638 │
│  10 │    2 │  10.529 ms │  10.19 MiB │   53686 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  11 │    0 │ 341.532 μs │   2.23 MiB │    3488 │
│  11 │    1 │  20.282 ms │    0 bytes │       0 │
│  11 │    2 │  20.336 ms │    0 bytes │       0 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  12 │    0 │ 600.468 μs │ 777.94 KiB │    6032 │
│  12 │    1 │   5.124 ms │   6.01 MiB │   82274 │
│  12 │    2 │ 122.871 ms │ 124.33 MiB │ 1191184 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  13 │    0 │ 310.996 μs │ 476.90 KiB │    1658 │
│  13 │    1 │  99.193 μs │ 367.86 KiB │    3036 │
│  13 │    2 │ 146.247 μs │ 634.05 KiB │    4786 │
└─────┴──────┴────────────┴────────────┴─────────┘

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
