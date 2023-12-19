module Day16
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

const STEP = Dict(
    :n => (-1, 0),
    :s => (1, 0),
    :e => (0, 1),
    :w => (0, -1),
)

parse_input(x::AbstractString) = getgrid(x)

###
### Part 1
###

const Point = NTuple{2, Int}

function propagate!(passed, maze, pos, dir)
    checkbounds(Bool, maze, pos...) || return
    k = (pos, dir)
    k in passed && return
    push!(passed, k)

    c = maze[pos...]
    if c == '.' || (c == '-' && dir in (:e, :w)) ||  (c == '|' && dir in (:n, :s))
        propagate!(passed, maze, pos .+ STEP[dir], dir)
    elseif c == '\\'
        dir == :e && return propagate!(passed, maze, pos .+ STEP[:s], :s)
        dir == :w && return propagate!(passed, maze, pos .+ STEP[:n], :n)
        dir == :s && return propagate!(passed, maze, pos .+ STEP[:e], :e)
        dir == :n && return propagate!(passed, maze, pos .+ STEP[:w], :w)
    elseif c == '/'
        dir == :w && return propagate!(passed, maze, pos .+ STEP[:s], :s)
        dir == :e && return propagate!(passed, maze, pos .+ STEP[:n], :n)
        dir == :n && return propagate!(passed, maze, pos .+ STEP[:e], :e)
        dir == :s && return propagate!(passed, maze, pos .+ STEP[:w], :w)
    else # split
        push!(passed, (pos, :e))
        push!(passed, (pos, :w))
        push!(passed, (pos, :s))
        push!(passed, (pos, :n))
        if dir in (:e, :w) # vertical
            propagate!(passed, maze, pos .+ STEP[:s], :s)
            propagate!(passed, maze, pos .+ STEP[:n], :n)
        else # horizontal
            propagate!(passed, maze, pos .+ STEP[:e], :e)
            propagate!(passed, maze, pos .+ STEP[:w], :w)
        end
    end
end

function solve1(x)
    passed = Set{Tuple{Point, Symbol}}()
    propagate!(passed, x, (1, 1), :e)
    return length(Set([p[1] for p in passed]))
end

###
### Part 2
###

function solve2(x)
    space = Set{Tuple{Point, Symbol}}()
    for i in 1:size(x, 1)
        push!(space, ((i, 1), :e))
        push!(space, ((i, size(x, 2)), :w))
    end
    for i in 1:size(x, 2)
        push!(space, ((1, i), :s))
        push!(space, ((size(x, 1), i), :n))
    end
    sol = 0
    while !isempty(space)
        pos, dir = pop!(space)
        passed = Set{Tuple{Point, Symbol}}()
        propagate!(passed, x, pos, dir)
        n = length(Set([p[1] for p in passed]))
        sol = max(sol, n)
        space = setdiff(space, passed)
    end
    return sol
end

end  # module
