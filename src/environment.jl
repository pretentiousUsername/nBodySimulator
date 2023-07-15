mutable struct Particle # eventually I want to modify this for lattice stuff
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

function outOfBounds(q::Particle, box::Container, cushion::Float64 = 0.01)
    x = q.position
    coordinates = containerCoordinates(box)
    origin = zeros(length(q.position))

    if origin .+ cushion < abs.(x) < coordinates .- cushion
        return false
    else
        return true
    end
end

function backInBounds(q::Particle, box::Container, cushion::Float64 = 0.01)
    x = q.position
    boxCoords = containerCoordinates(box)
    dims = 1:length(x)

    #newPosition = x

    newPosition = [if x[i] ≥ boxCoords[i]
                       cushion
                   elseif x[i] ≤ 0
                       boxCoords[i] - cushion
                   else
                       x[i]
                   end for i ∈ dims]
    
    return newPosition
end

function sameParticle(q₁::Particle, q₂::Particle)
    if q₁.label == q₂.label
        return true
    else
        return false
    end
end


# pmax = m * (container perimeter) / dt

#=function maximumMomentum(q::Particle, box::Container, dt::Float64)
    m = q.mass
    P = containerCoordinates(box)
    return m * P / dt
end=#
