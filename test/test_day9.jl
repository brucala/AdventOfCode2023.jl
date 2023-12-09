module test_day9

using Test
using AdventOfCode2023.Day9

nday = 9

data = parse_input(nday)

test = parse_input(
"""
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 114
    @test solve2(test) == 2
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 1743490457
    @test solve2(data) == 1053
end

end  # module
