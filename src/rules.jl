

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

    #=if a₁ == a₂
        #=z = [begin
                x₁ = cos(θ₁[i])
                y₁ = sin(θ₁[i])

                x₂ = cos(θ₂[i])
                y₂ = sin(θ₂[i])

                X = x₁ - x₂
                Y = y₁ - y₂
                tanh(Y / X) #hypot(Y, X)
            end for i ∈ dims]
        return r .* z=#
        return r=#
    #elseif b₁ < b₂
    if b₁ ≤ b₂
        return r .* a₁
    else
        return r .* a₂
    end

    #=if b₁ < b₂
        #println(r .* a₁)
        return r .* a₁
    elseif b₁ == b₂
        return @. r * π
    else
        #println(r .*a₂)
        return r .* a₂
    end=#
end
