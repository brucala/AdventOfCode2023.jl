module Day9
include("utils.jl")
using LinearAlgebra
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

function next(x)
    d = diff(x)
    sol = x[end] + d[end]
    while !allequal(d)
        d = diff(d)
        sol += d[end]
    end
    return sol
end

solve1(x) = sum(next.(x))

###
### Part 2
###

function next2(x)
    d = diff(x)
    i = 1
    sol = x[1] - d[1]
    while !allequal(d)
        d = diff(d)
        i += 1
        sol += d[1] * (-1)^i
    end
    return sol
end

solve2(x) = sum(next2.(x))

end  # module
