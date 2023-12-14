# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬─────────┐
│ day │ part │       time │     memory │  allocs │
├─────┼──────┼────────────┼────────────┼─────────┤
│   1 │    0 │  33.486 μs │ 109.31 KiB │      31 │
│   1 │    1 │  94.606 μs │ 134.27 KiB │    3001 │
│   1 │    2 │   1.185 ms │   1.00 MiB │   63690 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   2 │    0 │  88.663 μs │  62.19 KiB │     330 │
│   2 │    1 │ 219.366 μs │ 200.16 KiB │    1560 │
│   2 │    2 │ 371.362 μs │ 371.30 KiB │    3302 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   3 │    0 │ 305.100 μs │ 336.09 KiB │      65 │
│   3 │    1 │   2.000 ms │    0 bytes │       0 │
│   3 │    2 │   1.790 ms │    0 bytes │       0 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   4 │    0 │   1.001 ms │ 834.33 KiB │    2651 │
│   4 │    1 │ 395.174 μs │ 381.05 KiB │    2846 │
│   4 │    2 │ 202.436 μs │ 399.45 KiB │    3026 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   5 │    0 │ 225.325 μs │ 168.82 KiB │    1769 │
│   5 │    1 │   3.206 μs │  224 bytes │       1 │
│   5 │    2 │  10.710 ms │   1.77 MiB │   19993 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   6 │    0 │   4.233 μs │   2.61 KiB │      33 │
│   6 │    1 │  45.357 ns │   96 bytes │       1 │
│   6 │    2 │ 603.353 ns │   1.06 KiB │      23 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   7 │    0 │   1.612 ms │   1.51 MiB │   20034 │
│   7 │    1 │  68.468 μs │ 140.72 KiB │       4 │
│   7 │    2 │   3.079 ms │   2.02 MiB │   28401 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   8 │    0 │ 507.236 μs │ 926.48 KiB │    8829 │
│   8 │    1 │ 434.602 μs │    0 bytes │       0 │
│   8 │    2 │   2.172 ms │  27.97 KiB │     818 │
├─────┼──────┼────────────┼────────────┼─────────┤
│   9 │    0 │ 390.985 μs │ 360.95 KiB │     831 │
│   9 │    1 │  60.113 μs │ 322.05 KiB │    1866 │
│   9 │    2 │  72.430 μs │ 365.75 KiB │    2064 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  10 │    0 │ 205.996 μs │ 285.96 KiB │      46 │
│  10 │    1 │   1.954 ms │   5.71 MiB │   53638 │
│  10 │    2 │  10.617 ms │  10.19 MiB │   53686 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  11 │    0 │ 355.710 μs │   2.23 MiB │    3488 │
│  11 │    1 │  20.438 ms │    0 bytes │       0 │
│  11 │    2 │  20.459 ms │    0 bytes │       0 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  12 │    0 │ 638.761 μs │ 777.94 KiB │    6032 │
│  12 │    1 │   7.632 ms │   6.01 MiB │   82274 │
│  12 │    2 │ 119.299 ms │ 124.33 MiB │ 1191184 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  13 │    0 │ 295.786 μs │ 476.90 KiB │    1658 │
│  13 │    1 │ 105.923 μs │ 367.86 KiB │    3036 │
│  13 │    2 │ 152.098 μs │ 634.05 KiB │    4786 │
├─────┼──────┼────────────┼────────────┼─────────┤
│  14 │    0 │  76.045 μs │ 123.99 KiB │     636 │
│  14 │    1 │  69.059 μs │ 181.23 KiB │     576 │
│  14 │    2 │  41.877 ms │  77.40 MiB │  454529 │
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
