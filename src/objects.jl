mutable struct Particle # eventually I want to modify this for lattice stuff
    position::Vector{Float64}
    velocity::Vector{Float64}
    acceleration::Vector{Float64}
    mass::Float64
    label::Int64
end

struct Container # rectangular container that particles are trapped in
    dimensions::Vector{Float64}
end
