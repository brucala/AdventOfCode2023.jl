module test_day13

using Test
using AdventOfCode2023.Day13

nday = 13

data = parse_input(nday)

test = parse_input(
"""
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 405
    @test solve2(test) == 400
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 39939
    @test solve2(data) == 32069
end

end  # module
