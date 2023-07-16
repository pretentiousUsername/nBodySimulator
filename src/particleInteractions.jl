# Potentials to play around with
function noInteractions(q₁::Particle, q₂::Particle)
    dims = length(q₁.position)
    return zeros(dims)
end

function normalizeDirection(q₁::Particle, q₂::Particle)
    r = distanceBetweenParticles(q₁, q₂)
    R = @. r / abs(r)
    return R
end

function coulombForce(q₁::Particle, q₂::Particle)
    g₀::Float64 = 1. / (4π)
    r = distanceBetweenParticles(q₁, q₂)
    F = @. -g₀ * r / abs(r)^3
    return F
end

function yukawaForce(q₁::Particle, q₂::Particle, ℓ₀::Float64)
    g₀::Float64 = 1. / (4π)
    r = distanceBetweenParticles(q₁, q₂)
    F = @. g₀ * exp(-r / ℓ₀) * (ℓ₀ - r) * r/ (ℓ₀ * abs(r)^3)
    return F
end

function gaussianForce(q₁::Particle, q₂::Particle, ε::Float64)
    r = distanceBetweenParticles(q₁, q₂)
    F = @. 2 * r * real(exp(-r^2 / ε))
    return F
end

# This assumes a single value of k, so this potential is best suited for 1-, and
# 2d systems.
function harmonicOscillator(q₁::Particle, q₂::Particle, k::Float64)
    x = distanceBetweenParticles(q₁, q₂)
    F = k .* x
    return F
end


function interparticleForce(q₁::Particle, q₂::Particle, param::Float64 = 0.5)
    #return noInteractions(q₁, q₂)
    #return coulombForce(q₁, q₂)
    #return yukawaForce(q₁, q₂, 100. * param)
    return harmonicOscillator(q₁, q₂, 100. * param)
    #return gaussianForce(q₁, q₂, 0.00000001 * param)
    #return 0.1 * yukawaForce(q₁, q₂, 0.125 * param) + harmonicOscillator(q₁, q₂, 100. * param)
end
