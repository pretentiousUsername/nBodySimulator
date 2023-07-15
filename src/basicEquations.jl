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
    dims = length(q₁.position) # assumes q₁ and q₂ have the same length
    r = [q₁.position[i] - q₂.position[i] for i in 1:dims]
    return r
end

