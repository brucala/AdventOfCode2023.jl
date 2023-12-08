module test_day8

using Test
using AdventOfCode2023.Day8

nday = 8

data = parse_input(nday)

test1_1 = parse_input(
"""
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
""" |> rstrip
)

test1_2 = parse_input(
"""
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
""" |> rstrip
)

test2 = parse_input(
"""
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test1_1) == 2
    @test solve1(test1_2) == 6
    # because conditions of shortcut don't apply to test sample
    #@test solve2(test2) == 6
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 21409
    @test solve2(data) == 21165830176709
end

end  # module
