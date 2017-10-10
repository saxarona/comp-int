#= perceptron.jl
perceptron function for perceptron.jl
PA01 (CS5000)
01170065 - Xavier Sánchez Díaz
=#

include("hardlimit.jl")

"""
Perceptron function.
Calculates the outputs of a perceptron given an input `p`
and based on a weight matrix `W` and a bias vector `b`.
"""
function perceptron(W, p, b)

    n = W * p + b
    out = hardlimit(n)

    return out
end
