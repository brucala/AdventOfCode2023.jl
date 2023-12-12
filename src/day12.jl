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

narrangements(x) = narrangements(x...)
function narrangements(x, expected)
    ndamaged = count('#', x)

    # no more expected
    length(expected) == 0 && return Int(ndamaged == 0)

    nexpected = sum(expected)
    # too many damaged
    ndamaged > nexpected && return 0

    possible_blocks = get_possible_blocks(x)
    # too many blocks
    !isempty(possible_blocks) && nmin_possible_blocks(possible_blocks) > length(expected) && return 0

    nunknown = count('?', x)
    # not enough
    ndamaged + nunknown < nexpected && return 0
    # check validity if no more unknowns
    nunknown > 0 || return Int(length.(possible_blocks) == expected)

    x = strip(x, '.')
    if x[1] === '?'
        return narrangements(x[2:end], expected) + narrangements('#' * x[2:end], expected)
    end

    i = findfirst('.', x)
    i = isnothing(i) ? typemax(Int) : i
    # not enough in first block
    i - 1 < expected[1] && return 0

    j = findfirst('?', x)
    # first block known
    i < j && return i - 1 > expected[1] ? 0 : narrangements(x[i+1:end], expected[2:end])

    # too many in first possible block
    j - 1 > expected[1] && return 0

    # first unknown divides exactly first expected block
    j - 1 == expected[1] && return narrangements(x[j+1:end], expected[2:end])

    return narrangements(x[1:j-1] * '#' * x[j+1:end], expected)
end

get_possible_blocks(x) = String.(split(x, '.', keepempty=false))
nmin_possible_blocks(possible_blocks) = sum(x -> any(==('#'), x), possible_blocks)

solve1(x) = sum(narrangements, x)

###
### Part 2
###

function ispossible(blocks, expected)
    isempty(blocks) && return sum(expected, init=0) == 0
    length(expected) < sum(b->any(==('#'), b), blocks) && return false
    isempty(expected) && return true  # because above passed
    b, e = blocks[1], expected[1]
    all(==('?'), b) && return true
    return length(b) >= e
    # could check next if equal lengths or if all ?
end

function narrangements2(x)
    blocks, expected = get_possible_blocks(x[1]), x[2]
    return narrangements2!(blocks, expected, Dict{Tuple{String, Vector{Int}}, Int}())
end

function narrangements2!(blocks::Vector{String}, expected, seen)
    isempty(blocks) && return Int(sum(expected, init=0) == 0)
    length(expected) < sum(b->any(==('#'), b), blocks) && return 0
    isempty(expected) && return 1

    block, brest... = blocks

    n = 0
    for i in 1:length(expected)
        ex, exrest = expected[1:i], expected[i+1:end]
        ispossible(brest, exrest) || continue
        n1 = narrangements2!(block, ex, seen)
        n1 == 0 && continue
        n2 = narrangements2!(brest, exrest, seen)
        n += n1 * n2
    end

    if all(==('?'), block)
        n += narrangements2!(brest, expected, seen)
    end

    return n
end

function narrangements2!(block::String, expected, seen)
    isempty(block) && return Int(isempty(expected))
    isempty(expected) && return Int(all(==('?'), block))

    k = (block, expected)
    haskey(seen, k) && return seen[k]

    len = length(block)
    if len < sum(expected) + length(expected) - 1
        seen[k] = 0
        return 0
    end

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
            n = narrangements2!(block[ex+2:end], rest, seen)
        end
        seen[k] = n
        return n
    end

    if all(==('?'), block) && length(expected) == 1
        n = length(block) - expected[1] + 1
        seen[k] = n
        return n
    end

    n = narrangements2!('#'*block[2:end], expected, seen)
    n += narrangements2!(block[2:end], expected, seen)
    seen[k] = n
    return n
end


unfold(x) = unfold(x...)
unfold(x, expected) = (((x*'?')^5)[1:end-1], repeat(expected, 5))

solve2(x) = sum(narrangements2, unfold.(x))

end  # module
