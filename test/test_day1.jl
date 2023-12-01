module test_day1

using Test
using AdventOfCode2023.Day1

nday = 1

data = parse_input(nday)

test = parse_input(
"""
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
""" |> rstrip
)

test2 = parse_input(
"""
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
""" |> rstrip
)


@testset "Day$nday tests" begin
    @test solve1(test) == 142
    @test solve2(test2) == 281
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 55488
    @test solve2(data) == 55614
end

end  # module
