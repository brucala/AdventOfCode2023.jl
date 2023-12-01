module Day1
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

parse_input(x::AbstractString) = splitlines(x)

getdigits(line) = filter(isdigit, line)
calibration_value(digits) = toint(digits[1] * digits[end])

###
### Part 1
###

solve1(x) = sum(calibration_value.(getdigits.(x)))

###
### Part 2
###

const DIGITS = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
const DIGITMAP = Dict(
    [x => i for (i, x) in enumerate(DIGITS)]...,
    [string(x) => x for x in 1:9]...
)

function calibration_value2(line)
    ifirst, ilast = 10000, -1
    d, u = 0, 0
    for (k, v) in DIGITMAP
        occursin(k, line) || continue
        i = findfirst(k, line)[1]
        if ifirst >= i
            ifirst = i
            d = v
        end
        i = findlast(k, line)[1]
        if ilast <= i
            ilast = i
            u = v
        end
    end
    return 10d + u
end

solve2(x) = sum(calibration_value2.(x))

end  # module
