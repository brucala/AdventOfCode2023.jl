# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬─────────┐
│ day │ part │       time │     memory │  allocs │
├─────┼──────┼────────────┼────────────┼─────────┤
│   1 │    0 │  35.316 μs │ 109.31 KiB │      31 │
│   1 │    1 │  94.880 μs │ 134.27 KiB │    3001 │
│   1 │    2 │   1.223 ms │   1.00 MiB │   63690 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   2 │    0 │  70.694 μs │  62.19 KiB │     330 │
│   2 │    1 │ 235.217 μs │ 200.16 KiB │    1560 │
│   2 │    2 │ 402.346 μs │ 371.30 KiB │    3302 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   3 │    0 │ 353.234 μs │ 336.09 KiB │      65 │
│   3 │    1 │   2.022 ms │    0 bytes │       0 │
│   3 │    2 │   1.922 ms │    0 bytes │       0 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   4 │    0 │ 967.106 μs │ 834.33 KiB │    2651 │
│   4 │    1 │ 200.223 μs │ 381.05 KiB │    2846 │
│   4 │    2 │ 231.043 μs │ 399.45 KiB │    3026 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   5 │    0 │ 243.373 μs │ 168.82 KiB │    1769 │
│   5 │    1 │   3.603 μs │  224 bytes │       1 │
│   5 │    2 │  14.197 ms │   1.77 MiB │   19993 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   6 │    0 │   4.101 μs │   2.61 KiB │      33 │
│   6 │    1 │  52.323 ns │   96 bytes │       1 │
│   6 │    2 │ 687.090 ns │   1.06 KiB │      23 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   7 │    0 │   1.811 ms │   1.51 MiB │   20034 │
│   7 │    1 │  67.977 μs │ 140.72 KiB │       4 │
│   7 │    2 │   2.025 ms │   2.02 MiB │   28401 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   8 │    0 │ 558.706 μs │ 926.48 KiB │    8829 │
│   8 │    1 │ 465.493 μs │    0 bytes │       0 │
│   8 │    2 │   2.408 ms │  27.97 KiB │     818 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   9 │    0 │ 407.636 μs │ 360.95 KiB │     831 │
│   9 │    1 │  68.395 μs │ 322.05 KiB │    1866 │
│   9 │    2 │  73.916 μs │ 365.75 KiB │    2064 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  10 │    0 │ 206.618 μs │ 285.96 KiB │      46 │
│  10 │    1 │   1.832 ms │   5.71 MiB │   53638 │
│  10 │    2 │   9.896 ms │  10.19 MiB │   53686 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  11 │    0 │ 357.285 μs │   2.23 MiB │    3488 │
│  11 │    1 │  19.962 ms │    0 bytes │       0 │
│  11 │    2 │  19.649 ms │    0 bytes │       0 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  12 │    0 │ 592.232 μs │ 777.94 KiB │    6032 │
│  12 │    1 │   4.494 ms │   6.01 MiB │   82274 │
│  12 │    2 │ 119.095 ms │ 124.33 MiB │ 1191184 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  13 │    0 │ 305.916 μs │ 476.90 KiB │    1658 │
│  13 │    1 │ 134.065 μs │ 367.86 KiB │    3036 │
│  13 │    2 │ 152.676 μs │ 634.05 KiB │    4786 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  14 │    0 │  57.524 μs │ 123.99 KiB │     636 │
│  14 │    1 │  50.209 μs │ 181.23 KiB │     576 │
│  14 │    2 │  41.776 ms │  77.40 MiB │  454529 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  15 │    0 │ 123.524 μs │ 207.38 KiB │      32 │
│  15 │    1 │  62.799 μs │  31.30 KiB │       2 │
│  15 │    2 │   1.256 ms │   1.46 MiB │   17056 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  16 │    0 │ 134.148 μs │ 241.96 KiB │      46 │
│  16 │    1 │ 810.340 μs │ 974.07 KiB │      32 │
│  16 │    2 │ 365.136 ms │ 343.06 MiB │   13721 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  17 │    0 │ 275.722 μs │ 528.32 KiB │      46 │
│  17 │    1 │ 145.843 ms │  34.76 MiB │      52 │
│  17 │    2 │ 510.498 ms │ 157.09 MiB │ 1021811 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  18 │    0 │ 594.368 μs │ 616.96 KiB │    5628 │
│  18 │    1 │   2.068 ms │    0 bytes │       0 │
│  18 │    2 │  61.900 ms │   2.98 MiB │   88891 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  19 │    0 │  44.919 ms │   1.66 MiB │   26062 │
│  19 │    1 │  93.826 μs │ 114.66 KiB │    4132 │
│  19 │    2 │ 116.237 μs │ 839.31 KiB │    1560 │
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
