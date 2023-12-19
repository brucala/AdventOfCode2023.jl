module Day17
include("utils.jl")
using DataStructures
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = getgrid(x, fmap=toint)

###
### Part 1
###

const STEP = Dict(
    :n => (-1, 0),
    :s => (1, 0),
    :e => (0, 1),
    :w => (0, -1),
)

function solve1(x)
    sol = typemax(Int)

    #q = PriorityQueue(
    #    (1, 2, :e, 1) => 0,
    #    (2, 1, :s, 1) => 0
    #)
    q = heapify([(0, 1, 2, :e, 1), (0, 2, 1, :s, 1)])

    seen = Dict{Tuple{Int, Int, Symbol, Int}, Int}()

    while !isempty(q)
        loss, k... = heappop!(q)
        #k, loss = dequeue_pair!(q)
        r, c, d, n = k

        checkbounds(Bool, x, r, c) || continue

        loss += x[r, c]
        loss >= sol && continue

        k = (r, c, d, n)
        haskey(seen, k) && seen[k] <= loss && continue
        seen[k] = loss

        if size(x) == (r, c)
            sol = min(sol, loss)
            continue
        end

        if n < 3
            rr, cc = (r, c) .+ STEP[d]
            heappush!(q, (loss, rr, cc, d, n+1))
            #haskey(q, (rr, cc, d, n+1)) && q[(rr, cc, d, n+1)] <= loss && continue
            #q[(rr, cc, d, n+1)] = loss
        end

        dirs = d in (:e, :w) ? (:s, :n) : (:e, :w)
        for newdir in dirs
            rr, cc = (r, c) .+ STEP[newdir]
            heappush!(q, (loss, rr, cc, newdir, 1))
            #haskey(q, (rr, cc, newdir, 1)) && q[(rr, cc, newdir, 1)] <= loss && continue
            #q[(rr, cc, newdir, 1)] = loss
        end
    end
    return sol
end


###
### Part 2
###

function solve2(x)
    sol = typemax(Int)

    # a binary heap seems slightly more efficient than a priority queue
    #q = PriorityQueue(
    #    (1, 2, :e, 1) => 0,
    #    (2, 1, :s, 1) => 0
    #)
    q = heapify([(0, 1, 2, :e, 1), (0, 2, 1, :s, 1)])

    seen = Dict{Tuple{Int, Int, Symbol, Int}, Int}()

    while !isempty(q)
        loss, k... = heappop!(q)
        #k, loss = dequeue_pair!(q)
        r, c, d, n = k

        checkbounds(Bool, x, r, c) || continue

        loss += x[r, c]
        loss >= sol && continue

        k = (r, c, d, n)
        haskey(seen, k) && seen[k] <= loss && continue
        seen[k] = loss

        if size(x) == (r, c)
            sol = min(sol, loss)
            continue
        end

        if n < 10
            rr, cc = (r, c) .+ STEP[d]
            heappush!(q, (loss, rr, cc, d, n+1))
            #haskey(q, (rr, cc, d, n+1)) && q[(rr, cc, d, n+1)] <= loss && continue
            #q[(rr, cc, d, n+1)] = loss
        end

        dirs = d in (:e, :w) ? (:s, :n) : (:e, :w)
        for newdir in dirs
            rr, cc = (r, c) .+ 4 .* STEP[newdir]
            checkbounds(Bool, x, rr, cc) || continue
            newloss = loss + (
                if newdir in (:e, :w)
                    sum(x[r, range(min(c,cc)+1, length=3)])
                else
                    sum(x[range(min(r,rr)+1, length=3), c])
                end
            )
            heappush!(q, (newloss, rr, cc, newdir, 4))
            #haskey(q, (rr, cc, newdir, 4)) && q[(rr, cc, newdir, 4)] <= newloss && continue
            #q[(rr, cc, newdir, 4)] = newloss
        end
    end
    return sol
end

end  # module
