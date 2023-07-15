mutable struct Particle
    position::Vector{Float64}
    momentum::Vector{Float64}
    mass::Float64
    label::Int64
end

struct Container # rectangular container that particles are trapped in
    dimensions::Vector{Float64}
end

function containerCoordinates(box::Container)
    dims = length(box.dimensions)
    coordinates = [box.dimensions[i] / 2 for i in 1:dims]

    return coordinates
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
