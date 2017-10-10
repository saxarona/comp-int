#= train.jl
training procedure for perceptron.jl
PA01 (CS5000)
01170065 - Xavier Sánchez Díaz
=#

include("perceptron.jl")

"""
Training procedure.
Trains the perceptron using a set of examples `P` and their expected outputs `T`, over `its` iterations. Returns a list of the form `[W, b]`.

`train(P, T, its)`
"""
function train(P, T, its)
    W = randn(size(T,2), size(P,2))
    b = randn(size(W,1), 1)
    i = 1

    for it in its
        p = P[i,:]
        t = T[i,:]
        a = perceptron(W, p, b)
        err = t - a
        W = W + err * p'
        b = b + err
        i += 1

        # start over
        if i > size(P,1)
            i = 1
        end
    end

    return [W, b]
end
