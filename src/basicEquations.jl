#=
# This file has all the basic stuff necessary for a simulation, such as the
# kinetic energy for particles, the interparticle potential, and more, but note
# that it does not handle the simulation proper.
=#


function kineticEnergy(q::Particle)
    T = 0.5 * q.momentum.^2 ./ q.mass
    return T
end

function distanceBetweenParticles(q₁::Particle, q₂::Particle)
    positions = [r₁ - r₂ for r₁ in q₁.position, r₂ in q₂.position]
    # println(q₁.position)
    return positions
end

