module Day12
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

function parse_line(x)
    arrangement, expected = split(x)
    expected = toint.(split(expected, ','))
    return String(arrangement), expected
end

parse_input(x::AbstractString) = parse_line.(splitlines(x))

###
### Part 1
###

get_possible_blocks(x) = String.(split(x, '.', keepempty=false))

function ispossible(blocks, expected)
    isempty(blocks) && return sum(expected, init=0) == 0
    length(expected) < sum(b->any(==('#'), b), blocks) && return false
    isempty(expected) && return true  # because above passed
    b, e = blocks[1], expected[1]
    all(==('?'), b) && return true
    return length(b) >= e
    # could check next if equal lengths or if all ?
end

function narrangements(x)
    blocks, expected = get_possible_blocks(x[1]), x[2]
    return narrangements!(
        blocks, expected,
        Dict{Tuple{String, Vector{Int}}, Int}(),
        Dict{NTuple{2, Int}, Int}(),
    )
end

function narrangements!(blocks::Vector{String}, expected, seen1, seen2)
    isempty(blocks) && return Int(sum(expected, init=0) == 0)
    length(expected) < sum(b->any(==('#'), b), blocks) && return 0
    isempty(expected) && return 1

    k = length.((blocks, expected))
    haskey(seen2, k) && return seen2[k]

    block, brest... = blocks

    n = 0
    for i in 1:length(expected)
        ex, exrest = expected[1:i], expected[i+1:end]
        ispossible(brest, exrest) || continue
        n1 = narrangements!(block, ex, seen1)
        n1 == 0 && continue
        n2 = narrangements!(brest, exrest, seen1, seen2)
        n += n1 * n2
    end

    if all(==('?'), block)
        n += narrangements!(brest, expected, seen1, seen2)
    end

    seen2[k] = n
    return n
end

function narrangements!(block::String, expected, seen)
    isempty(block) && return Int(isempty(expected))
    isempty(expected) && return Int(all(==('?'), block))

    k = (block, expected)
    haskey(seen, k) && return seen[k]

    len = length(block)
    len < sum(expected) + length(expected) - 1 && return 0

    ex, rest... = expected
    if block[1] == '#'
        n = 0
        if len < ex
            n = 0
        elseif len == ex
            n = Int(isempty(rest))
        elseif block[ex + 1] == '#'
            n = 0
        else
            n = narrangements!(block[ex+2:end], rest, seen)
        end
        seen[k] = n
        return n
    end

    if all(==('?'), block) && length(expected) == 1
        n = length(block) - expected[1] + 1
        seen[k] = n
        return n
    end

    n = narrangements!('#'*block[2:end], expected, seen)
    n += narrangements!(block[2:end], expected, seen)
    seen[k] = n
    return n
end

solve1(x) = sum(narrangements, x)

###
### Part 2
###

unfold(x) = unfold(x...)
unfold(x, expected) = (((x*'?')^5)[1:end-1], repeat(expected, 5))

solve2(x) = sum(narrangements, unfold.(x))

end  # module
