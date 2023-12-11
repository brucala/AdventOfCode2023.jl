# Advent of Code 2023

Solutions to [Advent of Code 2023 edition](https://adventofcode.com/2023) in Julia.

## Benchmarks

To run the benchmarks:

    $ julia cli/benchmark.jl

```
┌─────┬──────┬────────────┬────────────┬────────┐
│ day │ part │       time │     memory │ allocs │
├─────┼──────┼────────────┼────────────┼────────┤
│   1 │    0 │  36.577 μs │ 109.31 KiB │     31 │
│   1 │    1 │ 100.501 μs │ 134.27 KiB │   3001 │
│   1 │    2 │   1.097 ms │   1.00 MiB │  63690 │
├─────┼──────┼────────────┼────────────┼────────┤
│   2 │    0 │  70.767 μs │  62.19 KiB │    330 │
│   2 │    1 │ 243.785 μs │ 200.16 KiB │   1560 │
│   2 │    2 │ 409.351 μs │ 371.30 KiB │   3302 │
├─────┼──────┼────────────┼────────────┼────────┤
│   3 │    0 │ 213.152 μs │ 336.09 KiB │     65 │
│   3 │    1 │   2.869 ms │    0 bytes │      0 │
│   3 │    2 │   2.780 ms │    0 bytes │      0 │
├─────┼──────┼────────────┼────────────┼────────┤
│   4 │    0 │   1.034 ms │ 834.33 KiB │   2651 │
│   4 │    1 │ 223.283 μs │ 381.05 KiB │   2846 │
│   4 │    2 │ 227.583 μs │ 399.45 KiB │   3026 │
├─────┼──────┼────────────┼────────────┼────────┤
│   5 │    0 │ 233.340 μs │ 168.82 KiB │   1769 │
│   5 │    1 │   3.516 μs │  224 bytes │      1 │
│   5 │    2 │  10.147 ms │   1.77 MiB │  19993 │
├─────┼──────┼────────────┼────────────┼────────┤
│   6 │    0 │   4.160 μs │   2.61 KiB │     33 │
│   6 │    1 │  45.269 ns │   96 bytes │      1 │
│   6 │    2 │ 610.848 ns │   1.06 KiB │     23 │
├─────┼──────┼────────────┼────────────┼────────┤
│   7 │    0 │   1.752 ms │   1.51 MiB │  20034 │
│   7 │    1 │  75.158 μs │ 140.72 KiB │      4 │
│   7 │    2 │   2.078 ms │   2.02 MiB │  28401 │
├─────┼──────┼────────────┼────────────┼────────┤
│   8 │    0 │ 526.342 μs │ 926.48 KiB │   8829 │
│   8 │    1 │ 442.164 μs │    0 bytes │      0 │
│   8 │    2 │   2.247 ms │  27.97 KiB │    818 │
├─────┼──────┼────────────┼────────────┼────────┤
│   9 │    0 │ 442.502 μs │ 360.95 KiB │    831 │
│   9 │    1 │  63.391 μs │ 322.05 KiB │   1866 │
│   9 │    2 │  67.988 μs │ 365.75 KiB │   2064 │
├─────┼──────┼────────────┼────────────┼────────┤
│  10 │    0 │ 200.512 μs │ 285.96 KiB │     46 │
│  10 │    1 │   1.798 ms │   5.71 MiB │  53638 │
│  10 │    2 │  10.529 ms │  10.19 MiB │  53686 │
├─────┼──────┼────────────┼────────────┼────────┤
│  11 │    0 │ 358.244 μs │   2.23 MiB │   3488 │
│  11 │    1 │  21.553 ms │    0 bytes │      0 │
│  11 │    2 │  22.002 ms │    0 bytes │      0 │
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
