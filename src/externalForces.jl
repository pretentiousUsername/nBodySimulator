function stochastic(q::Particle, a::Float64)
    dims = 1:length(q.position)
    F = [begin
             if rand(Float64) ≤ 0.5
                 -a * rand(Float64)
             else
                 a * rand(Float64)
             end
         end for i ∈ dims]
    return F
end

function spring(q::Particle, k::Float64, θ₀::Float64)
    dims = 1:length(q.position)
    θ = q.position
    F = [-k * (θ[i] - θ₀) for i ∈ dims]
    return F
end

function stinky(q::Particle, θ₀::Float64)
    dims = 1:length(q.position)
    θ = q.position
    F = [1 / (θ[i] - θ₀) for i ∈ dims]
    return F
end

function noForce(q::Particle)
    dims = length(q.position)
    return zeros(dims)
end

function externalForce(q::Particle, param::Float64 = 1.0)
    #return noForce(q)
    #return stochastic(q, param * 5)
    return spring(q, 10 * param, param * π / 2)
    #return stinky(q, param)
end
