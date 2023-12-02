module Day2
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = map(l -> split(l, ":")[2], splitlines(x))

###
### Part 1
###

const MAXCOLOR = Dict("red" => 12, "green" => 13, "blue" => 14)

function solve1(x)
    sol = 0
    for (i, line) in enumerate(x)
        possible = true
        for s in eachsplit(line, [',', ';'])
            n, color = split(s)
            toint(n) > MAXCOLOR[color] && (possible = false; break)
        end
        sol += possible * i
    end
    return sol
end

###
### Part 2
###

function mincubes(line)
    cubes = Dict("red" => 0, "green" => 0, "blue" => 0)
    for s in eachsplit(line, [',', ';'])
        n, color = split(s)
        n = toint(n)
        n > cubes[color] && (cubes[color] = n)
    end
    return cubes
end
power(cubes) = prod(values(cubes))

solve2(x) = sum(power.(mincubes.(x)))

end  # module
