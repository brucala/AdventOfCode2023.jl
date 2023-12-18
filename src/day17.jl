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

#function solve1(x)
#    sol = typemax(Int)
#
#    q = [(1, 2, :e, 1, 0), (2, 1, :s, 1, 0)]
#    i = 0
#    seen = Dict{Tuple{Int, Int, Symbol}, Vector{Int}}()
#    while !isempty(q)
#        i += 1
#        r, c, d, n, loss = pop!(q)
#        if i % 10000 == 0
#            @show i, r, c, d, n, loss, sol
#            @show length(q)
#            #@show q
#        end
#        i > 100000 && return q
#        #length(q) > 40 && return
#        checkbounds(Bool, x, r, c) || continue
#        loss += x[r, c]
#        loss >= sol && continue
#
#        k = (r, c, d)
#        if haskey(seen, k)
#            skip = false
#            for i in n:3
#                skip = seen[k][i] < loss
#            end
#            skip && continue
#        else
#            seen[k] = fill(typemax(Int), 3)
#        end
#        seen[k][n] = loss
#
#        if size(x) == (r, c)
#            sol = min(sol, loss)
#            println("*** got to the end")
#            @show i, loss, sol
#            #@show q
#            continue
#        end
#        dirs = d in (:e, :w) ? (:n, :s) : (:w, :e)
#        for newdir in dirs
#            rr, cc = (r, c) .+ STEP[newdir]
#            push!(q, (rr, cc, newdir, 1, loss))
#        end
#        if n < 3
#            rr, cc = (r, c) .+ STEP[d]
#            push!(q, (rr, cc, d, n+1, loss))
#        end
#    end
#    return sol
#end

function solve1(x)
    sol = typemax(Int)

    q = PriorityQueue(
        (1, 2, :e, 1) => 0,
        (2, 1, :s, 1) => 0
    )

    seen = Dict{Tuple{Int, Int, Symbol, Int}, Int}()

    while !isempty(q)
        k, loss = dequeue_pair!(q)
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
            haskey(q, (rr, cc, d, n+1)) && q[(rr, cc, d, n+1)] <= loss && continue
            q[(rr, cc, d, n+1)] = loss
            #enqueue!(q, (rr, cc, d, n+1) => loss)
        end

        dirs = d in (:e, :w) ? (:s, :n) : (:e, :w)
        for newdir in dirs
            rr, cc = (r, c) .+ STEP[newdir]
            haskey(q, (rr, cc, newdir, 1)) && q[(rr, cc, newdir, 1)] <= loss && continue
            q[(rr, cc, newdir, 1)] = loss
            #enqueue!(q, (rr, cc, newdir, 1) => loss)
        end
    end
    return sol
end


###
### Part 2
###

function solve2(x)
    sol = typemax(Int)

    q = PriorityQueue(
        (1, 2, :e, 1) => 0,
        (2, 1, :s, 1) => 0
    )

    seen = Dict{Tuple{Int, Int, Symbol, Int}, Int}()

    while !isempty(q)
        k, loss = dequeue_pair!(q)
        r, c, d, n = k

        checkbounds(Bool, x, r, c) || continue

        loss += x[r, c]
        loss >= sol && continue

        k = (r, c, d, n)
        haskey(seen, k) && seen[k] <= loss && continue
        seen[k] = loss

        #if n < 4
        #    rr, cc = (r, c) .+ STEP[d]
        #    haskey(q, (rr, cc, d, n+1)) && q[(rr, cc, d, n+1)] <= loss && continue
        #    q[(rr, cc, d, n+1)] = loss
        #    continue
        #end

        if size(x) == (r, c)
            sol = min(sol, loss)
            continue
        end

        if n < 10
            rr, cc = (r, c) .+ STEP[d]
            haskey(q, (rr, cc, d, n+1)) && q[(rr, cc, d, n+1)] <= loss && continue
            q[(rr, cc, d, n+1)] = loss
        end

        dirs = d in (:e, :w) ? (:s, :n) : (:e, :w)
        #for newdir in dirs
        #    rr, cc = (r, c) .+ STEP[newdir]
        #    haskey(q, (rr, cc, newdir, 1)) && q[(rr, cc, newdir, 1)] <= loss && continue
        #    q[(rr, cc, newdir, 1)] = loss
        #end
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
            haskey(q, (rr, cc, newdir, 4)) && q[(rr, cc, newdir, 4)] <= newloss && continue
            q[(rr, cc, newdir, 4)] = newloss
        end
    end
    return sol
end

end  # module
