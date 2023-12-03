module Day3
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

const Point = Tuple{Int, Int}

function parse_input(x::AbstractString)
    symbols = Dict{Point, Char}()
    numbers = Dict{Tuple{Int, UnitRange{Int}}, Int}()
    for (i, line) in enumerate(splitlines(x))
        j=0
        while j < length(line)
            j += 1
            line[j] == '.' && continue
            if isdigit(line[j])
                j2 = j
                while j2 < length(line) && isdigit(line[j2+1])
                    j2 += 1
                end
                numbers[(i, j:j2)] = toint(line[j:j2])
                j = j2
            else
                symbols[(i, j)] = line[j]
            end
        end
    end
    return symbols, numbers
end

###
### Part 1
###

function adjacent(npos, spos)
    i, jrange = npos
    ii, jj = spos
    i == ii && return jj in (jrange.start - 1, jrange.stop + 1)
    ii in (i-1, i+1) && return jj in (jrange.start-1):(jrange.stop+1)
    return false
end

function solve1(x)
    symbols, numbers = x
    sol = 0
    for (npos, number) in numbers
        if any(spos -> adjacent(npos, spos), keys(symbols))
            sol += number
        end
    end
    return sol
end

###
### Part 2
###

function solve2(x)
    symbols, numbers = x
    sol = 0
    for (spos, symbol) in symbols
        symbol == '*' || continue
        n, ratio = 0, 1
        for (npos, number) in numbers
            adjacent(npos, spos) || continue
            n += 1
            n > 2 && break
            ratio *= number
        end
        n == 2 && (sol += ratio)
    end
    return sol
end

end  # module
