##
# Problem 1
abstract type NewtonCotesRule end

struct Midpoint <: NewtonCotesRule end

function (::Midpoint)(f::Function, a::T, b::T) where {T}
    return (b-a) * f((a+b)/2)
end
##
# Problem 3
struct CompositeNewtonCotes <: IntegrationRule
    nsubintervales::Int
    rule::NewtonCotesRule
end

function (intrule::CompositeNewtonCotes)(f::Function, a::T, b::T) where {T}
    h = (b-a) / intrule.nsubintervales
    F = 0.0
    for i in 0:(intrule.nsubintervales-1)
        F += intrule.rule(f, a+i*h, a + (i+1)*h)
    end
    return F
end
##
