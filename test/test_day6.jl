module test_day6

using Test
using AdventOfCode2023.Day6

nday = 6

data = parse_input(nday)

test = parse_input(
"""
Time:      7  15   30
Distance:  9  40  200
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 288
    @test solve2(test) == 71503
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 393120
    @test solve2(data) == 36872656
end

end  # module
