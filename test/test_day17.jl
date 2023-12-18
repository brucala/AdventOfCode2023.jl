module test_day17

using Test
using AdventOfCode2023.Day17

nday = 17

data = parse_input(nday)

test = parse_input(
"""
2413432311323
3215453535623
3255245654254
3446585845452
4546657867536
1438598798454
4457876987766
3637877979653
4654967986887
4564679986453
1224686865563
2546548887735
4322674655533
""" |> rstrip
)

test2 = parse_input(
"""
111111111111
999999999991
999999999991
999999999991
999999999991
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 102
    @test solve2(test) == 94
    @test solve2(test2) == 71
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 956
    @test solve2(data) == 1106
end

end  # module
