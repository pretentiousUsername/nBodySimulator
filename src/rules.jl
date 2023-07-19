

function sameParticle(q₁::Particle, q₂::Particle)
    if q₁.label == q₂.label
        return true
    else
        return false
    end
end

# Hopefully stayOnCircle makes forces work how I intend them to.
function distanceBetweenParticles(q₁::Particle, q₂::Particle, box::Container)
    dims = 1:length(q₁.position) # assumes q₁, q₂, and box have the same dims
    x₁ = q₁.position
    x₂ = q₂.position
    r = box.radius

    a₁ = stayOnCircle([x₁[i] - x₂[i] for i ∈ dims])
    a₂ = stayOnCircle([x₁[i] + x₂[i] for i ∈ dims])

    σ::Float64 = 1 / 1000

    b₁ = sqrt(sum(a₁.^2))
    b₂ = sqrt(sum(a₂.^2))

    if b₁ < b₂
        #println(r .* a₁)
        return r .* a₁
    elseif b₁ == b₂
        return @. r * π
    else
        #println(r .*a₂)
        return r .* a₂
    end
end
