function distanceBetweenParticles(q₁::Particle, q₂::Particle)
    dims = 1:length(q₁.position) # assumes q₁ and q₂ have the same length
    x₁ = q₁.position
    x₂ = q₂.position
    r = [x₁[i] - x₂[i] for i ∈ dims]
    return r
end

function sameParticle(q₁::Particle, q₂::Particle)
    if q₁.label == q₂.label
        return true
    else
        return false
    end
end
