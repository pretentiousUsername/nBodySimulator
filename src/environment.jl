mutable struct Particle
    position::Array{Float64}
    momentum::Array{Float64}
    mass::Float64
    label::Int64
end

struct Container # rectangular container that particles are trapped in
    length::Float64
    width::Float64
end

function containerCoordinates(box::Container)
    X = box.width / 2
    Y = box.length / 2

    return [X, Y]
end

function outOfBounds(q::Particle, box::Container)
    x = q.position
    coordinates = containerCoordinates(box)

    if abs.(x) ≥ coordinates
        return true
    else
        return false
    end
end

function sameParticle(q₁::Particle, q₂::Particle)
    if q₁.label == q₂.label
        return true
    else
        return false
    end
end
