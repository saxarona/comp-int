#= perceptron.jl
perceptron function for perceptron.jl
PA02 (CS5000)
01170065 - Xavier Sánchez Díaz
=#

include("hardlimit.jl")

"""
Perceptron function.
Calculates the outputs of a perceptron given an input `p`
and based on a weight matrix `W` and a bias vector `b`,
using the `f` activation function.
"""
function perceptron(W, p, b, f)

    n = W * p + b
    out = map(f, n)

    return out
end
