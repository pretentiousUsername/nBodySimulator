struct Particle
    number::Int16
    position::Array{Float64}
    momentum::Array{Float64}
    mass::Float64
end

struct Container # container that particles are trapped in
    length::Float64
    width::Float64

    # calculate coordinates
    x₀ = -width / 2.
    x₁ = width / 2.

    y₀ = -length / 2.
    y₁ = length / 2.
end
