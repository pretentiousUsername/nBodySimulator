#=
# This is just a random function for testing purposes.
=#
function randomFunk()
    return [rand(Float64) for i in 1:2]
end

function particleList(number::Int64 = 1, mass::Float64 = 0.5)
    pos = [[-1., 0.], [1., 0.]]
    return [Particle(randomFunk(), randomFunk(), mass, i) for i in 1:number]
end

function containerCoordinates(box::Container)
    X = box.width / 2
    Y = box.length / 2

    return [X, Y]
end

function outOfBounds(q::Particle, coordinates)
    x = q.position
    dx = q.momentum ./ q.mass

    if abs(x) ≥ coordinates
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
