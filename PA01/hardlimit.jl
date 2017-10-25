#= hardlimit.jl
Hardlimit function for perceptron.jl
PA01 (CS5000)
01170065 - Xavier Sánchez Díaz
=#

"""
Hard limit activation function.
Maps a number `n` to 1 if positive, or 0 otherwise.
"""
function hardlimit(n::Float64)
    if n < 0
        a = 0
    else
        a = 1
    end
    return a
end

function hardlimit(n::Float32)
    if n < 0
        a = 0
    else
        a = 1
    end
    return a
end


"""
Vector version of `hardlimit`.
Maps numbers in `n` to 1 if positive, or 0 otherwise.
"""
function hardlimit(n::Array{Float64,2})
    # I'm pretty sure this approach may not be optimal
    av = Float64[]

    for i in n
        if i < 0
            push!(av,0)
        else
            push!(av,1)
        end
    end
    return av
end

function hardlimit(n::Array{Float32,2})
    # I'm pretty sure this approach may not be optimal
    av = Float32[]

    for i in n
        if i < 0
            push!(av,0)
        else
            push!(av,1)
        end
    end
    return av
end