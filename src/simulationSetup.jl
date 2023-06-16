function particleList(number::Int64 = 1, mass::Float64 = 0.5)
    pos = [[-1., 0.], [1., 0.]]
    return [Particle(pos[i], pos[i], mass, i) for i in 1:number]
end

function containerCoordinates(box::Container)
    X = box.width / 2
    Y = box.length / 2

    return [X, Y]
end

function outOfBounds(q::Particle, coordinates)
    x = q.position
    dx = q.momentum ./ q.mass

    if abs(x) ≥ coordinates || abs(x + dx) ≥ coordinates
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
