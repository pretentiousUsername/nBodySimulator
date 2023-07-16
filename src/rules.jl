function containerCoordinates(box::Container)
    dims = length(box.dimensions)
    coordinates = [box.dimensions[i] for i in 1:dims]

    return coordinates
end

function distanceBetweenParticles(q₁::Particle, q₂::Particle)
    dims = 1:length(q₁.position) # assumes q₁ and q₂ have the same length
    x₁ = q₁.position
    x₂ = q₂.position
    r = [x₁[i] - x₂[i] for i ∈ dims]
    return r
end

function outOfBounds(q::Particle, box::Container, cushion::Float64 = 0.1)
    x = q.position
    coordinates = containerCoordinates(box)
    origin = zeros(length(q.position))

    if origin .+ cushion < abs.(x) < coordinates .- cushion
        return false
    else
        return true
    end
end

function backInBounds(q::Particle, box::Container, cushion::Float64 = 0.1)
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
