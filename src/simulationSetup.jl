function randomFunk()
    return [0.5 * rand(Float64) for i in 1:2]
end

function particleList(number::Int64 = 1, mass::Float64 = 1.0)
    pos = [[-1.], [1.], [0.]]
    return [Particle(randomFunk(), randomFunk(), mass, i) for i in 1:number]
end
