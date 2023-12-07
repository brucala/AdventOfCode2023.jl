module Day7
include("utils.jl")
using StatsBase
using .Utils
import .Utils: parse_input

export solve1, solve2, parse_input

###
### Parse
###

CARDS = Dict(zip(['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'], 13:-1:1))
TYPES = Dict(zip([:five, :four, :full, :three, :two, :one, :high], 7:-1:1))

struct Hand
    cards::Vector{Char}
    bid::Int
    type::Symbol
    order::NTuple{6, Int}
end
Hand(s::AbstractString) = Hand(split(s)...)
function Hand(cards::AbstractString, bid::AbstractString)
    cards = collect(cards)
    bid = toint(bid)
    type = gettype(cards)
    Hand(cards, bid, type, getorder(cards, type))
end

Base.isless(h1::Hand, h2::Hand) = h1.order < h2.order

function gettype(cards)
    cm = countmap(cards)
    len = length(cm)
    len == 1 && return :five
    len == 5 && return :high
    len == 4 && return :one
    if len == 2
        4 in values(cm) && return :four
        return :full
    end
    3 in values(cm) && return :three
    return :two
end

strenght(card::Char) = CARDS[card]
strenght(type::Symbol) = TYPES[type]
getorder(cards, type) = (strenght(type), strenght.(cards)...)

parse_input(x::AbstractString) = Hand.(splitlines(x))

###
### Part 1
###

function solve1(x)
    x = sort(x)
    sol = 0
    for (i, hand) in enumerate(x)
        sol += i * hand.bid
    end
    return sol
end

###
### Part 2
###

function hand2(h::Hand)
    type2 = gettype2(h.cards)
    Hand(h.cards, h.bid, type2, getorder2(type2, h.cards))
end

strenght2(card::Char) = card == 'J' ? 0 : CARDS[card]
getorder2(type, cards) = (strenght(type), strenght2.(cards)...)

function gettype2(cards)
    'J' ∉ cards && return gettype(cards)
    length(Set(cards)) <= 2 && return :five  # all J, or only one other kind

    # should be faster, but i'm missing something
    #cm = countmap([c for c in cards if c != 'J'])
    #collect(values(cm)) == [2, 2] && println(cards)
    #collect(values(cm)) == [2, 2] && return :full
    #n = maximum(values(cm)) + count(==('J'), cards)
    #return Dict(5 => :five, 4 => :four, 3 => :three, 2 => :two)[n]

    other_cards = setdiff(cards, 'J')
    ij = findfirst(==('J'), cards)
    types = Symbol[]
    for card in other_cards
        newcards = [i == ij ? card : c for (i,c) in enumerate(cards)]
        push!(types, gettype2(newcards))
    end
    imax = findmax(strenght, types)[2]
    return types[imax]
end

solve2(x) = solve1(hand2.(x))

end  # module
