module test_day3

using Test
using AdventOfCode2023.Day3

nday = 3

data = parse_input(nday)

test = parse_input(
raw"""
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 4361
    @test solve2(test) == 467835
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 498559
    #@test solve2(data) == ?
end

end  # module
