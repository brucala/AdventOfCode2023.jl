module Day18
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

const Segment = UnitRange{Int}

struct Loop
    vertical::Dict{Int, Vector{Segment}}
    horizontal::Dict{Int, Vector{Segment}}
end
function Loop(x::Vector{Tuple{Symbol, Int}})
    r, c = 1, 1
    vertical = Dict{Int, Vector{Segment}}()
    horizontal = Dict{Int, Vector{Segment}}()
    for (dir, n) in x
        rr, cc = r, c
        if dir in (:R, :L)
            if dir == :R
                cc += n
                segment = c:cc
            else # left
                cc -= n
                segment = cc:c
            end
            haskey(horizontal, r) || (horizontal[r] = [])
            push!(horizontal[r], segment)
        else
            if dir == :U
                rr -= n
                segment = rr:r
            else  # down
                rr += n
                segment = r:rr
            end
            haskey(vertical, c) || (vertical[c] = [])
            push!(vertical[c], segment)
        end
        r, c = rr, cc
    end
    return Loop(vertical, horizontal)
end
Loop(x::Vector{String}) = Loop([ins(i) for i in x])
ins(x::String) = (DIR[x[end]], parse(Int, x[1:end-1], base=16))

const DIR = Dict('0' => :R, '1' => :D, '2' => :L, '3' => :U)

function parse_input(x::AbstractString)
    ins = Tuple{Symbol, Int}[]
    color = String[]
    for line in splitlines(x)
        d, n, c = split(line)
        push!(ins, (Symbol(d), toint(n)))
        push!(color, c[begin+2:end-1])
    end
    return Loop(ins), Loop(color)
end

###
### Part 1
###

Base.in(i::Int, s::Vector{Segment}) = any(x->i in x, s)


function crosses(l::Loop, s::Segment, r::Int)
    downward = 0
    for c in (s.start, s.stop)
        for v in l.vertical[c]
            if r == v.start
                downward += 1
                continue
            end
        end
    end
    return downward == 1
end

function solve1(x, i=1)
    x = x[i]
    sol = 0
    for r in range(extrema(keys(x.horizontal))...)
        crossed = 0
        c, cmax = extrema(keys(x.vertical))
        while c <= cmax
            if haskey(x.horizontal, r)
                found = false
                for s in x.horizontal[r]
                    if c == s.start
                        crosses(x, s, r) && (crossed += 1)
                        sol += length(s)
                        c = s.stop + 1
                        found = true
                        continue
                    end
                end
                found && continue
            end
            if haskey(x.vertical, c) && r in x.vertical[c]
                sol += 1
                crossed += 1
            else
                isodd(crossed) && (sol += 1)
            end
            c += 1
        end
    end
    return sol
end

###
### Part 2
###

function rangediff(r1::Segment, r2::Vector{Segment})
    # assumes ranges in r2 arent't overlapping
    r2 = sort(filter(x -> !isdisjoint(x, r1), r2))
    isempty(r2) && return [r1]
    r = Segment[]
    r1 < r2[begin] && push!(r, r1.start:(r2[begin].start-1))
    for i in 1:(length(r2)-1)
        push!(r, (r2[i].stop+1):(r2[i+1].start-1))
    end
    r1.stop > r2[end].stop && push!(r, (r2[end].stop+1):r1.stop)
    return r
end

function Base.length(l::Loop)
    len = 0
    for d in (l.vertical, l.horizontal)
        for v in values(d)
            len += sum(length.(v) .- 1)  # don't couble count corners
        end
    end
    return len
end

function solve(x, i)
    x = x[i]

    rows = sort(collect(keys(x.horizontal)))
    sol = length(x)

    nrows = length(rows)
    for i in 1:(nrows - 1)
        r1, r2 = rows[i], rows[i+1]
        r = r1+1
        @assert r < r2
        cols = sort([c for (c, segments) in x.vertical if r in segments])
        @assert iseven(length(cols))
        for j in 1:(length(cols) ÷ 2)
            c1, c2 = cols[2j - 1], cols[2j]
            # don't include box borders
            sol += (c2-c1-1) * (r2-r1-1)
            # count bottom borders that aren't part of the loop
            sol += sum(length.(rangediff((c1+1):(c2-1), x.horizontal[r2])))

        end
    end
    return sol
end

solve2(x) = solve(x, 2)

end  # module
