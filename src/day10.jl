module Day10
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = getgrid(x)


###
### Part 1
###

const Point = NTuple{2, Int}

const TILES = Dict(
    '|' => "ns",
    '-' => "ew",
    'L' => "ne",
    'F' => "se",
    '7' => "sw",
    'J' => "nw",
    'S' => "nesw",
)

const STEP = Dict(
    'n' => (-1, 0),
    's' => (1, 0),
    'e' => (0, 1),
    'w' => (0, -1),
)

const FROM = Dict(
    'n' => 's',
    's' => 'n',
    'e' => 'w',
    'w' => 'e',
)

function next(grid, pos, to)
    newpos = pos .+ STEP[to]
    from = FROM[to]
    tile = TILES[grid[newpos...]]
    @assert from in tile
    return newpos, setdiff(tile, from)[1]
end

function possible(grid, pos)
    dirs = Char[]
    for d in "nesw"
        r, c = pos .+ STEP[d]
        (1 <= r <= size(grid)[1] && 1 <= c <= size(grid)[2]) || continue
        grid[r, c] == '.' && continue
        FROM[d] in TILES[grid[r, c]] || continue
        push!(dirs, d)
    end
    @assert length(dirs) == 2
    return dirs
end

function getloop(x)
    start = findfirst(==('S'), x).I
    to = possible(x, start)[1]
    len, pos = 0, start
    loop = Set([start])
    while len==0 || pos != start
        len += 1
        pos, to = next(x, pos, to)
        push!(loop, pos)
    end
    return loop
end

solve1(x) = length(getloop(x)) ÷ 2

###
### Part 2
###

function double(grid, loop)
    newloop = Set{Point}()
    for p in loop
        np = 2 .* p
        push!(newloop, np)
        grid[p...] == 'S' && continue
        for d in TILES[grid[p...]]
            push!(newloop, np .+ STEP[d])
        end
    end
    return newloop
end

function propagate!(seen, outside, loop, pos, maxpos)
    pos in seen && return
    push!(seen, pos)
    pos in loop && return
    pos in outside && return
    any(pos .< 0) && return
    any(pos .> maxpos) && return
    push!(outside, pos)
    for d in "nswe"
        p = pos .+ STEP[d]
        propagate!(seen, outside, loop, p, maxpos)
    end
    return
end

function solve2(x)
    loop = getloop(x)
    dloop = double(x, loop)
    minr, maxr = extrema([p[1] for p in dloop])
    minc, maxc = extrema([p[2] for p in dloop])
    seen = Set{Point}()
    outside = Set{Point}()
    propagate!(seen, outside, dloop, (0,0), (maxr+1, maxc+1))
    n = 0
    for r in minr:2:maxr, c in minc:2:maxc
        p = (r, c)
        n += !(p in dloop) && !(p in outside)
    end
    return n
end

end  # module
