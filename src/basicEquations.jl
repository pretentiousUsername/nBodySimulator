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
    positions = [x₁ - x₂ for x₁ in q₁.position, x₂ in q₂.position]
    distance = sqrt.(sum(positions.^2))
    return distance
end

# Feel free to season this to taste---use any potential you feel like.
function interparticlePotential(q₁::Particle, q₂::Particle)
    g₀::Float64 = 1. / (4π)
    V = g₀ ./ distanceBetweenParticles(q₁, q₂)
    return V
end

function hamiltonian(T::Array{Float64}, V::Array{Float64})
    H = T + V # sum of kinetic and potential energies
    return H
end
