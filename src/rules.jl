function sameParticle(q₁::Particle, q₂::Particle)
    if q₁.label == q₂.label
        return true
    else
        return false
    end
end

# Hopefully stayOnCircle makes forces work how I intend them to.
function distanceBetweenParticles(q₁::Particle, q₂::Particle, box::Container)
    dims = 1:length(box.radius) # assumes q₁, q₂, and box have the same dims
    θ₁ = q₁.position
    θ₂ = q₂.position
    r = box.radius

    a₁ = [θ₁[i] - θ₂[i] for i ∈ dims]
    a₂ = [θ₁[i] + θ₂[i] for i ∈ dims]

    b₁ = @. sqrt(sum(a₁^2))
    b₂ = @. sqrt(sum(a₂^2))

    if b₁ ≤ b₂
        return r .* a₁
    else
        return r .* a₂
    end
end
