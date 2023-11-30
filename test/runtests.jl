using Test
using AdventOfCode2023

@testset "AdventOfCode2023 tests" begin
     for day in solved_days
        @testset "Day $day" begin include("test_day$day.jl") end
     end
end
