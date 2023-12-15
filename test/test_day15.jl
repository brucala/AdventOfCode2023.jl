module test_day15

using Test
using AdventOfCode2023.Day15

nday = 15

data = parse_input(nday)

test = parse_input(
"""
rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 1320
    @test solve2(test) == 145
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 503154
    @test solve2(data) == 251353
end

end  # module
