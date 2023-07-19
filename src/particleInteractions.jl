# Potentials to play around with
function noInteractions(q₁::Particle, q₂::Particle, box::Container)
    dims = length(q₁.position)
    return zeros(dims)
end

function normalizeDirection(q₁::Particle, q₂::Particle, box::Container)
    r = distanceBetweenParticles(q₁, q₂, box)
    R = [begin
             if r == 0
                 0
             else
                 x / abs(x)
             end
         end
         for x ∈ r]
    return R
end

function coulombForce(q₁::Particle, q₂::Particle, box::Container)
    g₀::Float64 = 1. #/ (4π)
    d₀::Float64 = 0.00001
    r = distanceBetweenParticles(q₁, q₂, box)
    F = @. g₀ / r^2
    return F
end

function yukawaForce(q₁::Particle, q₂::Particle, box::Container, ℓ₀::Float64)
    g₀::Float64 = 1. / (4π)
    r = distanceBetweenParticles(q₁, q₂, box)
    F = @. g₀ * exp(-r / ℓ₀) * (ℓ₀ + r)/ (ℓ₀ * r^2)
    return F
end

function gaussianForce(q₁::Particle, q₂::Particle, box::Container, ε::Float64)
    r = distanceBetweenParticles(q₁, q₂, box)
    F = @. 10 * real(exp(-r^2 / ε))
    return F
end

# This assumes a single value of k, so this potential is best suited for 1-, and
# 2d systems.
function harmonicOscillator(q₁::Particle, q₂::Particle, box::Container, k::Float64)
    x = distanceBetweenParticles(q₁, q₂, box)
    F = k .* x
    return F
end

function interparticleForce(q₁::Particle, q₂::Particle, box::Container, param::Float64 = 0.5)
    #force = noInteractions(q₁, q₂, box)
    direction = normalizeDirection(q₁, q₂, box)
    force = coulombForce(q₁, q₂, box) .* direction
    #force = yukawaForce(q₁, q₂, box, 10. * param) * direction
    #force = harmonicOscillator(q₁, q₂, box, 10 * param)
    #force = gaussianForce(q₁, q₂, box, param/200)
    #force = hardSphereScattering(q₁, q₂, box, param)
    return force
end
