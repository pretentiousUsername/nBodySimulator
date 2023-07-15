function randomFunk()
    return [rand(Float64) for i in 1:1]
end

function particleList(number::Int64 = 1, mass::Float64 = 0.5)
    pos = [[-1.], [1.], [0.]]
    return [Particle(randomFunk(), randomFunk(), mass, i) for i in 1:number]
end
