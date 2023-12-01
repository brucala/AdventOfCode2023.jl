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

function getdigit(c, i, line)
    isdigit(c) && return toint(c)
    for (j, d) in enumerate(DIGITS)
        startswith(line, d) && return j
    end
    return 0
end

function calibration_value2(line)
    value = 0
    # find first digit
    for (i, c) in enumerate(line)
        value = 10 * getdigit(c, i, line[i:end])
        value != 0 && break
    end
    # find last digit
    for (i, c) in enumerate(reverse(line))
        value += getdigit(c, i, line[end-i+1:end])
        value % 10 != 0 && return value
    end
end

solve2(x) = sum(calibration_value2.(x))

end  # module
