function positionStep(particle::Particle, dt::Float64)
    xⱼ = particle.position
    p = particle.momentum
    m = particle.mass

    k₁ = dt * p / m
    k₂ = (xⱼ + dt * k₁ / 2) / m # dt / 2
    k₃ = (xⱼ + dt * k₂ / 2) / m
    k₄ = (xⱼ + dt * k₃) / m

    xⱼ₊₁ = xⱼ + dt * (k₁ + 2k₂ + 2k₃ + k₄) / 6
    return xⱼ₊₁
end

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

function momentumStep(particle::Particle, list::Vector{Particle}, dt::Float64)
    pⱼ = particle.momentum
    #dp = particle.momentum - dt * totalForce(particle, list)
    F = totalForce(particle, list)

    k₁ = -F * dt
    k₂ = pⱼ + dt * k₁ / 2
    k₃ = pⱼ + dt * k₂ / 2
    k₄ = pⱼ + dt * k₃

    pⱼ₊₁ = pⱼ + dt * (k₁ + 2k₂ + 2k₃ + k₄) / 6
    return pⱼ₊₁
end
