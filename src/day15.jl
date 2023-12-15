module Day15
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = split(x, ',')

###
### Part 1
###

function HASH(s)
    sol = 0
    for c in s
        sol = 17(sol + Int(c)) % 256
    end
    return sol
end

solve1(x) = sum(HASH.(x))

###
### Part 2
###

function memo_hash(s, memo)
    haskey(memo, s) && return memo[s]
    h = HASH(s)
    memo[s] = h
    return h
end

function focal_power(boxes, lenses)
    sol = 0
    for (b, box) in enumerate(boxes)
        isempty(box) && continue
        for (l, lens) in enumerate(box)
            sol += b * l * lenses[lens]
        end
    end
    return sol
end

function solve2(x)
    boxes = [String[] for _ in 1:256]
    lenses = Dict{String, Int}()
    memo = Dict{String, Int}()
    for s in x
        label, flen = split(s, ['-', '='])
        box = boxes[memo_hash(label, memo)+1]
        #box = boxes[HASH(label)+1]
        i = findfirst(==(label), box)
        if isempty(flen)
            isnothing(i) || popat!(box, i)
        else
            lenses[label] = toint(flen)
            if isnothing(i)
                push!(box, label)
            else
                box[i] = label
            end
        end
    end
    return focal_power(boxes, lenses)
end

end  # module
