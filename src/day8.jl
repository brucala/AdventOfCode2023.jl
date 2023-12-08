module Day8
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

function parse_input(x::AbstractString)
    lines = splitlines(x)
    path = lines[1]
    nodes = Dict{String, NTuple{2, String}}()
    for line in lines[3:end]
        l, r = split(line, " = ")
        ll, rr = split(strip(r, collect("()")), ", ")
        nodes[l] = (ll, rr)
    end
    return path, nodes
end

###
### Part 1
###

function next(nodes, current, dir)
    dir == 'L' && return nodes[current][1]
    nodes[current][2]
end

function solve1(x)
    path, nodes = x
    N = length(path)
    step = 0
    current = "AAA"
    while current != "ZZZ"
        step += 1
        dir = path[mod1(step, N)]
        current = next(nodes, current, dir)
    end
    return step
end

###
### Part 2
###

struct Network
    path::Vector{Char}
    N::Int
    nodes::Dict{String, NTuple{2, String}}
    step::Vector{Int}
    current::Vector{String}
    seen::Dict{Tuple{Int, String}, Tuple{Int, String}}
end
function Network(path, nodes)
    path = collect(path)
    current = [node for node in keys(nodes) if endswith(node, 'A')]
    steps = fill(0, length(current))
    return Network(path, length(path), nodes, steps, current, Dict())
end

function nextz!(n::Network)
    _, i = findmin(n.step)
    delta, state = nextz!(n, n.current[i], n.step[i])
    n.step[i] += delta
    n.current[i] = state
    return n
end

function nextz!(n::Network, current::String, step::Int)
    m = mod1(step, n.N)
    k = (m, current)
    haskey(n.seen, k) && return n.seen[k]

    delta = 0
    state = current
    while delta==0 || !endswith(state, 'Z')
        delta += 1
        dir = n.path[mod1(step+delta, n.N)]
        state = next(n.nodes, state, dir)
    end
    n.seen[k] = (delta, state)
    return (delta, state)
end

solved(n::Network) = all(endswith('Z'), n.current)

# observations:
# M = length of path
# 1) from initial 'A' to next 'Z' takes n * M
# 2) 'Z' from above to next 'Z' is cyclical (goes to same 'Z') and it also takes n * M with same N
# 3) all n_i from different 'A's are coprimes
# => sol = prod(n_i) * N

solution(n) = prod([x[1] ÷ n.N for x in values(n.seen)]) * n.N

function solve2(x)
    net = Network(x...)
    while !solved(net)
        nextz!(net)
    end
    return solution(net)
end

end  # module
