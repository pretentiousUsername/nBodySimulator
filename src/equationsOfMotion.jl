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

# This function might create some errors since not all particle positions are
# getting updated at once.
function rungeKuttaStep(q::Particle, list::Vector{Particle}, box::Container, dt::Float64)

    #ak = q.acceleration
    ak = accelerationStep(q, list, box)
    vk₀ = q.velocity
    θk₀ = q.position

    vk₁ = ak * dt
    θk₁ = vk₀ * dt

    vk₂ = ak * dt / 2
    θk₂ = vk₂ * dt / 2

    vk₃ = vk₂ * dt / 2
    θk₃ = vk₃ * dt / 2

    vk₄ = ak * dt
    θk₄ = vk₄ * dt

    v = vk₀ + (vk₁ + 2vk₂ + 2vk₃ + vk₄) / 6
    θ = θk₀ + (θk₁ + 2θk₂ + 2θk₃ + θk₄) / 6

    return [θ, v, ak]
end
