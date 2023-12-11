module test_day11

using Test
using AdventOfCode2023.Day11

nday = 11

data = parse_input(nday)

test = parse_input(
"""
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 374
    @test solve1(test, 10) == 1030
    @test solve1(test, 100) == 8410
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 9418609
    @test solve2(data) == 593821230983
end

end  # module
