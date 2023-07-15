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

# This rat's nest took way too long to program
function getParticleXYZ(timeSteps::Vector{Vector{Particle}})
    steps = getParticlePositions(timeSteps)
    dims = length(steps[1][1])
    xyz = [[[position[i] for position in positions]
            for i ∈ 1:dims]
           for positions in steps]
    return xyz
end
