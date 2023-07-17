struct Container # rectangular container that particles are trapped in
    dimensions::Vector{Float64} # radii
end

mutable struct Particle # eventually I want to modify this for lattice stuff
    position::Vector{Float64}
    velocity::Vector{Float64}
    acceleration::Vector{Float64}
    mass::Float64
    label::Int64
    
    #=function stayOnCircle(coordinates) # I'll hope this works
        θ = [begin
                 if 0 < ψ < 2π
                     ψ
                 elseif ψ ≥ 2π
                    ψ * (1 - ψ / 2π)
                 else
                    ψ * (1 + ψ / 2π)
                 end
             end for ψ ∈ coordinates]
        new(θ, velocity, acceleration, mass, label)
    end=#
end
