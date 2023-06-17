# dp/dt = - ∂H/∂q
# dq/dt = ∂H/∂p

#=
# I'm going to assume that
#     p²
# H = -- + V(x).
#     2m
# Hamilton's equations of motion are then
# dp
# -- = -V'(x) ,
# dt
# and
# dx   p
# -- = - .
# dt   m
# Therefore, using a basic finite-difference scheme
# pᵢ = pᵢ₋₁ - (Vᵢ - Vᵢ₋₁) δt / xᵢ₋₁
# xᵢ = xᵢ₋₁ + pᵢ₋₁ δt / m
=#

# This is just a test function right now.
function transform(particle::Particle)
    dx = particle.momentum / particle.mass + particle.position
    return dx
end


function totalPotential(particles::Array{Particle})
    potential = [begin
                     if sameParticle(q₁, q₂)
                         zeros(length(q₁.position))
                     else
                         interparticlePotential(q₁, q₂)
                     end
                 end for q₁ in particles, q₂ in particles]
end


function timeStep(particles::Array{Particle}, δt::Float64)
end

#=
# I need to find a way to make the positions actually update consistently
=#
function simulation(N::Int64, δt::Float64 = 0.1, steps::Int64 = 20)
    particles = particleList(N)
    box = Container(20., 20.)
    #println( totalPotential(particles) )
    #totalPotential(particles)
    timeEvolution = []
    for i in 1:steps
        x = [motion(q) for q in particles]
        updatedPositions = [begin
            if outOfBounds(particle, box)
                particle.momentum = -particle.momentum
            else
                particle.position = x[particle.label]
            end
            println(particle)
        end for particle in particles]
        #println(updatedPositions)
        push!(timeEvolution, updatedPositions)
    end
end
