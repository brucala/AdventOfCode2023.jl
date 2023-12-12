module test_day12

using Test
using AdventOfCode2023.Day12

nday = 12

data = parse_input(nday)

test = parse_input(
"""
???.### 1,1,3
.??..??...?##. 1,1,3
?#?#?#?#?#?#?#? 1,3,1,6
????.#...#... 4,1,1
????.######..#####. 1,6,5
?###???????? 3,2,1
""" |> rstrip
)

@testset "Day$nday tests" begin
    @test solve1(test) == 21
    @test solve2(test) == 525152
end

@testset "Day$nday solutions" begin
    @test solve1(data) == 7361
    @test solve2(data) == 83317216247365
end

end  # module
