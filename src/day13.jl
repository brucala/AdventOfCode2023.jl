module Day13
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = getgrid.(split(x, "\n\n"))

###
### Part 1
###

function find_symmetry(m, horizontal, func)
    horizontal || (m = permutedims(m))
    for i in 1:(size(m, 1)-1)
        func(m, i) && return i
    end
    return 0
end

function issymmetric(m, i)
    for j in 0:min(i-1, size(m, 1) - i - 1)
        m[i-j,:] == m[i+1+j,:] || return false
    end
    return true
end

function summarize(x, func=issymmetric)
    i = find_symmetry(x, true, func)
    i > 0 && return 100i
    i = find_symmetry(x, false, func)
    @assert i != 0
    return i
end

solve1(x, func=issymmetric) = sum(i->summarize(i, func), x)

###
### Part 2
###

function issmudge(m, i)
    n = 0
    for j in 0:min(i-1, size(m, 1) - i - 1)
        n += count(!=(0), m[i-j,:] .- m[i+1+j,:])  # 150mus
        n > 1 && return false
    end
    return n==1
end

solve2(x) = solve1(x, issmudge)

end  # module
