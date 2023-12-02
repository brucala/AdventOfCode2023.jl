module test_day2

using Test
using AdventOfCode2023.Day2

nday = 2

data = parse_input(nday)

test = parse_input(
"""
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 8
    @test solve2(test) == 2286
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 2164
    @test solve2(data) == 69929
end

end  # module
