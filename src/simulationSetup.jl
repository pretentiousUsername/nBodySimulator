function randomFunk(dimensions)
    dims = 1:dimensions
    return [0.5 * rand(Float64) for i ∈ dims]
end

function randomGoop(dimensions)
    dims = 1:dimensions
    p = [if rand(Int64) == 0
             -rand(Float64)
         else
             rand(Float64)
         end
         for i ∈ dims]
    return p
end

dimensions = 1
function particleList(number::Int64 = 1, mass::Float64 = 100.0)
    return [Particle(randomFunk(dimensions), #=[0.0], 10 .* randomGoop(dimensions), zeros(dimensions), mass, i=#) for i in 1:number]
end
