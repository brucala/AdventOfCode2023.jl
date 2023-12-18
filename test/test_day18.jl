module test_day18

using Test
using AdventOfCode2023.Day18

nday = 18

data = parse_input(nday)

test = parse_input(
"""
R 6 (#70c710)
D 5 (#0dc571)
L 2 (#5713f0)
D 2 (#d2c081)
R 2 (#59c680)
D 2 (#411b91)
L 5 (#8ceee2)
U 2 (#caa173)
L 1 (#1b58a2)
U 2 (#caa171)
R 2 (#7807d2)
U 3 (#a77fa3)
L 2 (#015232)
U 2 (#7a21e3)
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 62
    @test solve2(test) == 952408144115
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 46359
    @test solve2(data) == 59574883048274
end

end  # module
