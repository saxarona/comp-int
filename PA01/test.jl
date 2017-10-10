#= test.jl
testing procedure for perceptron.jl
PA01 (CS5000)
01170065 - Xavier Sánchez Díaz
=#

include("perceptron.jl")

"""
Calculates and returns accuracy of a perceptron with weights `W`, bias `b` and inputs `P` and outputs `T`.

`test(W, b, P, T)`
"""
function test(W, b, P, T)
    correct = 0
    for i in 1:size(P,1)
        p = P[i,:]
        t = T[i,:]
        a = perceptron(W, p, b)
        if t == a
            correct += 1
        end
    end
    return correct / size(P,1)
end
