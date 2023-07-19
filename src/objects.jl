struct Container # particles are trapped on circles
    radius::Vector{Float64} # radii
end

# stayOnCircle should *technically* be in rules.jl, but I need it here for the
# Particle struct. Also, stayOnCircle actually keeps particles on a semicircle,
# but no one needs to know that.
function stayOnCircle(position::Vector{Float64})
    return [atan(sin(θ - π/2) / cos(θ - π/2)) + π/2 for θ in position]
end

struct Particle
    position::Vector{Float64}
    velocity::Vector{Float64}
    acceleration::Vector{Float64}
    mass::Float64
    label::Int64
    
    Particle(position, velocity, acceleration, mass, label) = begin
        new(stayOnCircle(position), velocity, acceleration, mass, label) end
end
