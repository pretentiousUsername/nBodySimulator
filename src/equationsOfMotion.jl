# This uses an RK2 integration step, which isn't ideal---I'd prefer an RK4
# step---but it'll come in due time. (Verlet integration might also be pretty
# handy.)
#=function positionStep(particle::Particle, dt::Float64)
    xⱼ = particle.position
    v = particle.velocity
    m = particle.mass
    xᵢ = @. xⱼ + v * dt / 2
    xⱼ₊₁ = @. xⱼ + xᵢ * dt
    return xⱼ₊₁
end

function velocityStep(particle::Particle, dt::Float64)
    vⱼ = particle.velocity
    a = particle.acceleration
    #dp = particle.momentum - dt * totalForce(particle, list)
    vᵢ = @. vⱼ + a * dt / 2
    vⱼ₊₁ = @. vⱼ + vᵢ * dt
    return vⱼ₊₁
end=#

function halfStep(particles::Vector(Particles), dt::Float64) # y(t + dt/2)
    xᵢ = [particle.position for particle in particles]
    vᵢ = [particle.velocity for particle in particles]
    aᵢ = [particle.velocity for particle in particles]
end

#=function motionStep(particle::Particle, list::Vector{Particles}, dt::Float64)
    x = particle.position
    v = particle.velocity
    a = particle.acceleration
    m = particle.mass

    vᵢ = v + a * dt / 2 # v(t + dt/2) = v(t) + a(t) dt / 2
    xᵢ = x + vᵢ / 2 # x(t + dt/2) = x(t) + v(t) dt / 2

    # create a temporary list of particles with x(t + dt/2) and v(t + dt/2)
    # to get a(t + dt/2)---I know it's hacky.

    aᵢ
    vⱼ₊₁ = 
end=#

function totalForce(q::Particle, list::Vector{Particle})
    externForce = externalForce(q)
    mutualInteraction = [begin
                             if sameParticle(q, particle)
                                 zeros(length(q.position))
                             else
                                 interparticleForce(q, particle)
                             end
                         end for particle in list]
    mutualInteraction = sum(mutualInteraction)
    #println(mutualInteraction)

    return mutualInteraction
end

function accelerationStep(particle::Particle, list::Vector{Particle}, dt::Float64)
    m = particle.mass
    aⱼ = particle.acceleration
    F = totalForce(particle, list)
    aⱼ₊₁ = -totalForce(particle, list) ./ m
    return aⱼ₊₁
end
