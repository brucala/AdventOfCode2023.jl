module test_day7

using Test
using AdventOfCode2023.Day7

nday = 7

data = parse_input(nday)

test = parse_input(
"""
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 6440
    @test solve2(test) == 5905
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 248812215
    @test solve2(data) == 250057090
end

end  # module
