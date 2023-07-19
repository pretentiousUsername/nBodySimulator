# I don't know why I deleted this function. Good thing git exists.
function totalForce(q::Particle, list::Vector{Particle}, box::Container)
    externForce = externalForce(q)
    mutualInteraction = [begin
                             if sameParticle(q, particle)
                                 zeros(length(q.position))
                             else
                                 interparticleForce(q, particle, box)
                             end
                         end for particle in list]
    mutualInteraction = sum(mutualInteraction)
    #println(mutualInteraction)
    force = externForce .+ mutualInteraction
    return force
end

function accelerationStep(q::Particle, list::Vector{Particle}, box::Container)
    F = totalForce(q, list, box)
    m = q.mass
    a = F ./ m
    return a
end

# I'll start with a basic Euler method and work from there
function velocityStep(a::Vector{Float64}, q::Particle, dt::Float64)
    vⱼ = q.velocity
    vⱼ₊₁ = @. vⱼ + a * dt
    return vⱼ₊₁
end

function positionStep(v::Vector{Float64}, q::Particle, dt::Float64)
    θⱼ = q.position
    θⱼ₊₁ = @. θⱼ + v * dt
    return θⱼ₊₁
end
