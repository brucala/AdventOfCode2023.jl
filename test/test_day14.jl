module test_day14

using Test
using AdventOfCode2023.Day14

nday = 14

data = parse_input(nday)

test = parse_input(
"""
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 136
    @test solve2(test) == 64
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 109098
    @test solve2(data) == 100064
end

end  # module
