module Day11
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

const Point = NTuple{2, Int}

struct Universe
    size::Point
    galaxies::Vector{Point}
    expanding_rows::Set{Int}
    expanding_cols::Set{Int}
end
function Universe(lines)
    n, m = length(lines), length(lines[1])
    erows, ecols = Set(1:n), Set(1:m)
    galaxies = Point[]
    for (r, line) in enumerate(lines)
        for (c, char) in enumerate(line)
            char == '.' && continue
            push!(galaxies, (r, c))
            erows = setdiff(erows, r)
            ecols = setdiff(ecols, c)
        end
    end
    return Universe((n,m), galaxies, erows, ecols)
end


function distance(u::Universe, i, j, n)
    g1 = u.galaxies[i]
    g2 = u.galaxies[j]
    d = sum(abs.(g1 .- g2))
    d += nexpanding(u.expanding_rows, g1[1], g2[1]) * (n-1)
    d += nexpanding(u.expanding_cols, g1[2], g2[2]) * (n-1)
end

function nexpanding(expanding, i, j)
    r = i<=j ? (i:j) : (j:i)
    return count(in(r), expanding)
end

parse_input(x::AbstractString) = Universe(splitlines(x))

###
### Part 1
###

function solve1(x, n=2)
    ngalaxies = length(x.galaxies)
    sol = 0
    for i in 1:ngalaxies
        for j in (i+1):ngalaxies
            sol += distance(x, i, j, n)
        end
    end
    return sol
end

###
### Part 2
###

solve2(x) = solve1(x, 1000000)

end  # module
