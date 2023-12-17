module test_day16

using Test
using AdventOfCode2023.Day16

nday = 16

data = parse_input(nday)

test = parse_input(
raw"""
.|...\....
|.-.\.....
.....|-...
........|.
..........
.........\
..../.\\..
.-.-/..|..
.|....-|.\
..//.|....
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 46
    @test solve2(test) == 51
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 7185
    @test solve2(data) == 7616
end

end  # module
