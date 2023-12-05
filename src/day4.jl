module Day4
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

function parse_input(x::AbstractString)
    y = Tuple{Vector{Int}, Vector{Int}}[]
    for line in splitlines(x)
        a, b = split(split(line, ':')[2], '|')
        a, b = split.((a, b))
        #@assert length(toint.(b)) == length(Set(toint.(b)))
        push!(y, (toint.(a), toint.(b)))
    end
    return y
end

###
### Part 1
###

nwins(winning, numbers) = length(winning ∩ numbers)
function score(x)
    n = nwins(x...)
    return n > 0 ? 2 ^ (n-1) : 0
end

solve1(x) = sum(score.(x))

###
### Part 2
###

function solve2(x)
    N = length(x)
    copies = ones(Int, N)
    for (i, card) in enumerate(x)
        n = nwins(card...)
        n > 0 && (copies[i+1: min(i+n, N)] .+= copies[i])
    end
    return sum(copies)
end

end  # module
