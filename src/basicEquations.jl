#=
# This file has all the basic stuff necessary for a simulation, such as the
# kinetic energy for particles, the interparticle potential, and more, but note
# that it does not handle the simulation proper.
=#


function kineticEnergy(q::Particle)
    T = 0.5 * q.momentum^2 ./ q.mass
    return T
end

# Feel free to season this to taste---use any potential you feel like.
function interparticlePotential(q₁::Particle, q₂::Particle)
    g₀::Float64 = 1. / (4π)
    v = abs(q₁.position - q₂.position)
    V = g₀ / v
    return V
end

function hamiltonianMatrixElement(T, V)
    H = T + V # sum of kinetic and potential energies
    return H
end
