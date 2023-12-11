module Day9
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = map(l -> toint.(split(l)), splitlines(x))

###
### Part 1
###

next(x) = x[end] + (allequal(x) ? 0 : next(diff(x)))

solve1(x) = sum(next.(x))

###
### Part 2
###

solve2(x) = sum(next.(reverse.(x)))

end  # module
