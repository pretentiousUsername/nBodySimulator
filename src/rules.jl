# Hopefully stayOnCircle makes forces work how I intend them to.
function distanceBetweenParticles(q₁::Particle, q₂::Particle, box::Container)
    dims = 1:length(q₁.position) # assumes q₁, q₂, and box have the same dims
    x₁ = q₁.position
    x₂ = q₂.position
    r = box.radius
    θ = stayOnCircle([x₁[i] - x₂[i] for i ∈ dims])
    s = r .* θ
    return s
end

function sameParticle(q₁::Particle, q₂::Particle)
    if q₁.label == q₂.label
        return true
    else
        return false
    end
end

# Use a Gaussian distribution to check if particles are next to each other
#function particleCollision(q₁::Particle, q₂::Particle, σ::Float64)
