module Day5
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

struct MapRange
    range::UnitRange{Int}
    delta::Int
end
function MapRange(destination_start::Int, source_start::Int, length::Int)
    MapRange(source_start:(source_start + length - 1), destination_start - source_start)
end
MapRange() = MapRange(0:-1, 0)
Base.isempty(m::MapRange) = isempty(m.range)

struct Map
    source::String
    destination::String
    ranges::Vector{MapRange}
end
function Map(x::AbstractString)
    lines = splitlines(x)
    source, destination = split(lines[1][1:end-5], "-to-")
    m = Map(source, destination, [])
    for line in lines[2:end]
        push!(m.ranges, MapRange(toint.(split(line))...))
    end
    return m
end

struct Almanac
    seeds::Vector{Int}
    maps::Dict{String, Map}
end
function Almanac(seeds, maps::Vector{<:AbstractString})
    a = Almanac(seeds, Dict())
    for x in maps
        m = Map(x)
        a.maps[m.source] = m
    end
    return a
end

function parse_input(x::AbstractString)
    blocks = split(x, "\n\n")
    seeds = toint.(split(blocks[1])[2:end])
    return Almanac(seeds, blocks[2:end])
end

###
### Part 1
###

function Base.getindex(m::Map, i::Int)
    for r in m.ranges
        i in r.range && return i + r.delta
    end
    return i
end

function location(a::Almanac, n)
    source = "seed"
    while source != "location"
        m = a.maps[source]
        source = m.destination
        n = m[n]
    end
    return n
end
locations(a:: Almanac) = map(s -> location(a, s), a.seeds)

solve1(x) = minimum(locations(x))

###
### Part 2
###

function rangediff(r1::UnitRange{Int}, r2::UnitRange{Int})
    r2 = r1 ∩ r2
    r = UnitRange{Int}[]
    isempty(r1) && return r
    isempty(r2) && return [r1]
    r1.start < r2.start && push!(r, r1.start:(r2.start-1))
    r1.stop > r2.stop && push!(r, (r2.stop+1):r1.stop)
    return r
end

function Base.getindex(m::Map, ranges::Vector{UnitRange{Int}})
    result = UnitRange{Int}[]
    for r2 in m.ranges
        newranges = UnitRange{Int}[]
        for r1 in ranges
            intersection = r1 ∩ r2.range
            left = rangediff(r1, r2.range)
            !isempty(intersection) && push!(result, intersection .+ r2.delta)
            append!(newranges, left)
        end
        ranges = newranges
    end
    return append!(result, ranges)
end

function solve2(x)
    seeds = x.seeds
    ranges = UnitRange{Int}[]
    for i in 1:(length(seeds) ÷ 2)
        push!(ranges, range(seeds[2*i-1], length=seeds[2*i]))
    end
    return minimum(location(x, ranges)).start
end

end  # module
