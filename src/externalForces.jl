function stochastic(q::Particle, a::Float64)
    dims = 1:length(q.position)
    F = [if rand(Int64) == 0
             -a * rand(Float64)
         else
             a * rand(Float64)
         end
         for i ∈ dims]
    return F
end

function noForce(q::Particle)
    dims = length(q.position)
    return zeros(dims)
end

function externalForce(q::Particle, param::Float64 = 1.0)
    return noForce(q)
    #return stochastic(q, param)
end
