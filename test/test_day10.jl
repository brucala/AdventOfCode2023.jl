module test_day10

using Test
using AdventOfCode2023.Day10

nday = 10

data = parse_input(nday)

test1_1 = parse_input(
"""
-L|F7
7S-7|
L|7||
-L-J|
L|-JF
""" |> rstrip
)

test1_2 = parse_input(
"""
7-F7-
.FJ|7
SJLL7
|F--J
LJ.LJ
""" |> rstrip
)

test2_1 = parse_input(
"""
FF7FSF7F7F7F7F7F---7
L|LJ||||||||||||F--J
FL-7LJLJ||||||LJL-77
F--JF--7||LJLJ7F7FJ-
L---JF-JLJ.||-FJLJJ7
|F|F-JF---7F7-L7L|7|
|FFJF7L7F-JF7|JL---7
7-L-JL7||F7|L7F-7F7|
L.L7LFJ|||||FJL7||LJ
L7JLJL-JLJLJL--JLJ.L
""" |> rstrip
)


@testset "Day$nday tests" begin
    @test solve1(test1_1) == 4
    @test solve1(test1_2) == 8
    @test solve2(test2_1) == 10
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 6701
    @test solve2(data) == 303
end

end  # module
