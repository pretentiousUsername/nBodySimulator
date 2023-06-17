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

