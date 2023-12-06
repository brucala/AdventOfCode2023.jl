module Day6
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

function parse_input(x::AbstractString)
    lines = splitlines(x)
    t = toint.(split(lines[1][10:end]))
    d = toint.(split(lines[2][10:end]))
    return t, d
end

###
### Part 1
###

# t * (t - x) > d
# because is symetrical we find the <=d bottom solultions and extract twice that
nways(t, d) = t + 1 - 2(floor(Int, (t - √(t*t - 4d))/2)+1)

solve1(x) = nways.(x[1], x[2]) |> prod

###
### Part 2
###

function solve2(x)
    t, d = toint.(join.(x))
    return nways(t, d)
end

end  # module
