module Day14
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

struct Rocks
    nrows::Int
    ncols::Int
    moving::Vector{Vector{Int}}
    fixed::Vector{Vector{Int}}
end

function parse_input(x::AbstractString)
    moving_rocks = Vector{Int}[]
    fixed_rocks = Vector{Int}[]
    lines = splitlines(x)
    for (r, line) in enumerate(lines)
        for (c, char) in enumerate(line)
            if r == 1
                push!(moving_rocks, Int[])
                push!(fixed_rocks, Int[])
            end
            if char == 'O'
                push!(moving_rocks[c], r)
            elseif char == '#'
                push!(fixed_rocks[c], r)
            end
        end
    end
    return Rocks(length(lines), length(lines[1]), moving_rocks, fixed_rocks)
end

###
### Part 1
###

# tilts to north
function tilt(r::Rocks)
    tilted_rocks = Vector{UnitRange{Int}}[]
    for (moving, fixed) in zip(r.moving, r.fixed)
        push!(tilted_rocks, tilt(moving, fixed))
    end
    return Rocks(r.nrows, r.ncols, (collect ∘ Iterators.flatten).(tilted_rocks), r.fixed)
end

function tilt(moving, fixed)
    tilted = UnitRange{Int}[]
    len = length(moving)
    f1, i = 0, 1
    for f2 in fixed
        c = 0
        while i <= len && moving[i] < f2
            c += 1
            i += 1
        end
        c > 0 && push!(tilted, range(f1+1, length=c))
        f1 = f2
    end
    i <= len && push!(tilted, range(f1+1, length=len-i+1))
    return tilted
end

load(r::Rocks) = load(r.moving, r.ncols)
load(rocks, n) = sum((n +1 ) .- Iterators.flatten(rocks))

solve1(x) = load(tilt(x))

###
### Part 2
###

# clockwise (r, c) -> (c, R - r + 1)
rotate(r::Rocks) = return Rocks(r.ncols, r.nrows, rotate(r.moving, r.nrows, r.ncols), rotate(r.fixed, r.nrows, r.ncols))
function rotate(rocks, R, C)
    rotated = [Int[] for _ in 1:C]
    for (c, col) in enumerate(rocks)
        for r in col
            push!(rotated[R-r+1], c)
        end
    end
    return rotated #[sort(x) for x in rotated]
end

key(r::Rocks) = r.moving

function cycle(r::Rocks)
    for _ in 1:4
        r = (rotate ∘ tilt)(r)
    end
    return r
end

function solve2(x)
    N = 1000000000
    seen = Dict(key(x) => 0)
    for i in 1:N
        x = cycle(x)
        if haskey(seen, key(x))
            j = seen[key(x)]
            Δ = i - j
            for (k, v) in seen
                v >= j && N % Δ == v % Δ && return load(k, x.ncols)
            end
            # N % Δ == i % Δ && return load(x)
        end
        seen[key(x)] = i
    end
    return x
end

end  # module
