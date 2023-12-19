module Day19
include("utils.jl")
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

struct Part
    x::Int
    m::Int
    a::Int
    s::Int
end
Part(x::AbstractString) = Part(eval(Meta.parse('('*x[2:end-1]*')'))...)
Part(; x, m, a, s) = Part(x, m, a, seek)
Base.getindex(p::Part, c::Symbol) = getproperty(p, c)

struct Rule
    cat::Symbol
    op::Function
    threshold::Int
    iftrue::String
end
function Rule(x::AbstractString)
    rule, iftrue = split(x, ":")
    cat, op, threshold = Symbol(rule[1]), rule[2], toint(rule[3:end])
    @assert op in ('<', '>')
    op = op == '<' ? (<) : (>)
    return Rule(cat, op, threshold, iftrue)
end

struct Workflow
    rules::Vector{Rule}
    otherwise::String
end
function Workflow(x::AbstractString)
    rules..., otherwise = split(x, ',')
    return Workflow(Rule.(rules), otherwise)
end

struct Factory
    workflows::Dict{String, Workflow}
    parts::Vector{Part}
end
function Factory(x::AbstractString)
    lines, parts = split(x, "\n\n")
    parts = Part.(splitlines(parts))
    workflows = Dict{String, Workflow}()
    for line in splitlines(lines)
        name, wf = split(line, '{')
        workflows[name] = Workflow(wf[1:end-1])
    end
    return Factory(workflows, parts)
end

parse_input(x::AbstractString) = Factory(x)

###
### Part 1
###

accept(r::Rule, p::Part) = r.op(p[r.cat], r.threshold)
function accept(w::Workflow, p::Part)
    for rule in w.rules
        accept(rule, p) && return rule.iftrue
    end
    return w.otherwise
end
function accept(f::Factory, part::Part)
    wf = "in"
    while true
        wf === "A" && return true
        wf === "R" && return false
        wf = accept(f.workflows[wf], part)
    end
end

rating(p::Part) = p.x + p.m + p.a + p.s

function solve1(x)
    sol = 0
    for part in x.parts
        accept(x, part) && (sol += rating(part))
    end
    return sol
end

###
### Part 2
###

const MAX = 4000
const Segment = UnitRange{Int}

struct Leaf
    x::Segment
    m::Segment
    a::Segment
    s::Segment
end
Leaf(; x=1:MAX, m=1:MAX, a=1:MAX, s=1:MAX) = Leaf(x, m, a, s)
Leaf(cat::Symbol, s::Segment) = Leaf(
    x = cat === :x ? s : 1:MAX,
    m = cat === :m ? s : 1:MAX,
    a = cat === :a ? s : 1:MAX,
    s = cat === :s ? s : 1:MAX,
)

segment(rule::Rule) = rule.op == (<) ? range(1, rule.threshold - 1) : range(rule.threshold + 1, MAX)
antisegment(rule::Rule) = rule.op == (>) ? range(1, rule.threshold) : range(rule.threshold, MAX)
getleaf(rule::Rule) = Leaf(rule.cat, segment(rule))
getantileaf(rule::Rule) = Leaf(rule.cat, antisegment(rule))


function merge(a::Leaf, b::Leaf)
    Leaf(intersect(a.x, b.x), intersect(a.m, b.m), intersect(a.a, b.a), intersect(a.s, b.s))
end
merge(leafs::Vector{Leaf}, leaf::Leaf) = [merge(l, leaf) for l in leafs]

naccepted(l::Leaf) = prod(length, (l.x, l.m, l.a, l.s))
naccepted(f::Factory, w="in") = sum(naccepted.(accepted(f, w)))

function accepted(f::Factory, w::String)
    sol = Leaf[]
    elses = Leaf()
    wf = f.workflows[w]
    for rule in wf.rules
        if rule.iftrue == "A"
            leaf = merge(elses, getleaf(rule))
            push!(sol, leaf)
        elseif rule.iftrue != "R"
            leaf = merge(elses, getleaf(rule))
            leafs = merge(accepted(f, rule.iftrue), leaf)
            append!(sol, leafs)
        end
        elses = merge(elses, getantileaf(rule))
    end
    if wf.otherwise == "A"
        push!(sol, elses)
    elseif wf.otherwise != "R"
        leafs = merge(accepted(f, wf.otherwise), elses)
        append!(sol, leafs)
    end
    return sol
end

solve2(x) = naccepted(x)

end  # module
