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

    ak₀ = q.acceleration
    vk₀ = q.velocity
    θk₀ = q.position

    ak₁ = accelerationStep(q, list, box)
    vk₁ = (ak₁ * dt) * dt
    θk₁ = (vk₁ * dt) * dt
    qk₁ = Particle(θk₁, vk₁, ak₁, q.mass, q.label) # a bit hacky, but it should
                                                   # hopefully work.
    ak₂ = accelerationStep(qk₁, list, box)
    vk₂ = (vk₀ + ak₂ * dt / 2) * dt #velocityStep(ak₂, qk₁, dt / 2)
    θk₂ = (θk₀ + vk₂ * dt / 2) * dt #positionStep(vk₂, qk₁, dt / 2)
    qk₂ = Particle(θk₂, vk₂, ak₂, q.mass, q.label)

    ak₃ = accelerationStep(qk₂, list, box)
    vk₃ = (vk₀ + ak₂ * dt / 2) * dt #velocityStep(ak₃, qk₂, dt / 2)
    θk₃ = (θk₀ + vk₃ * dt / 2) * dt #positionStep(vk₃, qk₂, dt / 2)
    qk₃ = Particle(θk₂, vk₂, ak₂, q.mass, q.label)

    ak₄ = accelerationStep(qk₃, list, box)
    vk₄ = (vk₀ + ak₄ * dt) * dt
    θk₄ = (θk₀ + vk₄ * dt) * dt

    a = ak₀ + (ak₁ + 2ak₂ + 2ak₃ + ak₄) * dt / 6
    v = vk₀ + (vk₁ + 2vk₂ + 2vk₃ + vk₄) * dt / 6
    θ = θk₀ + (θk₁ + 2θk₂ + 2θk₃ + θk₄) * dt / 6

    return [θ, v, a]
end
