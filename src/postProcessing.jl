function getParticlePositions(timeSteps::Vector{Vector{Particle}})
    position = [[particle.position for particle in particles]
                 for particles in timeSteps]
    return position
end

function getParticleMomentums(timeSteps::Vector{Vector{Particle}})
    momentum = [[particle.momentum for particle in particles]
                for particles in timeSteps]
    return momentum
end
