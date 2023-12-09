# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬────────┐
│ day │ part │       time │     memory │ allocs │
├─────┼──────┼────────────┼────────────┼────────┤
│   1 │    0 │  68.585 μs │ 109.31 KiB │     31 │
│   1 │    1 │ 174.713 μs │ 134.27 KiB │   3001 │
│   1 │    2 │ 685.272 μs │  48.33 KiB │   1001 │
├─────┼──────┼────────────┼────────────┼────────┤
│   2 │    0 │ 128.503 μs │  62.19 KiB │    330 │
│   2 │    1 │ 420.075 μs │ 200.16 KiB │   1560 │
│   2 │    2 │ 715.097 μs │ 371.30 KiB │   3302 │
├─────┼──────┼────────────┼────────────┼────────┤
│   3 │    0 │   3.211 ms │ 336.09 KiB │     65 │
│   3 │    1 │   4.431 ms │    0 bytes │      0 │
│   3 │    2 │   4.086 ms │    0 bytes │      0 │
├─────┼──────┼────────────┼────────────┼────────┤
│   4 │    0 │   1.669 ms │ 834.33 KiB │   2651 │
│   4 │    1 │ 367.473 μs │ 381.05 KiB │   2846 │
│   4 │    2 │ 375.159 μs │ 399.45 KiB │   3026 │
├─────┼──────┼────────────┼────────────┼────────┤
│   5 │    0 │ 383.366 μs │ 168.82 KiB │   1769 │
│   5 │    1 │   8.754 μs │  224 bytes │      1 │
│   5 │    2 │  12.847 ms │   1.77 MiB │  19993 │
├─────┼──────┼────────────┼────────────┼────────┤
│   6 │    0 │   9.832 μs │   2.61 KiB │     33 │
│   6 │    1 │  74.716 ns │   96 bytes │      1 │
│   6 │    2 │   1.159 μs │   1.06 KiB │     23 │
├─────┼──────┼────────────┼────────────┼────────┤
│   7 │    0 │   2.910 ms │   1.51 MiB │  20034 │
│   7 │    1 │ 142.989 μs │ 140.72 KiB │      4 │
│   7 │    2 │   3.288 ms │   2.02 MiB │  28401 │
├─────┼──────┼────────────┼────────────┼────────┤
│   8 │    0 │ 952.268 μs │ 926.48 KiB │   8829 │
│   8 │    1 │ 896.696 μs │    0 bytes │      0 │
│   8 │    2 │   4.073 ms │  27.97 KiB │    818 │
├─────┼──────┼────────────┼────────────┼────────┤
│   9 │    0 │ 778.565 μs │ 360.95 KiB │    831 │
│   9 │    1 │ 102.198 μs │ 322.05 KiB │   1866 │
│   9 │    2 │ 108.825 μs │ 322.00 KiB │   1864 │
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
