# dp/dt = - ∂H/∂q
# dq/dt = ∂H/∂p

function motion(particles::Array{Particle})
end

function totalPotential(particles::Array{Particle})
    potential = [begin
                     if sameParticle(q₁, q₂)
                         [0., 0.]
                     else
                         interparticlePotential(q₁, q₂)
                     end
                 end for q₁ in particles, q₂ in particles]
end

function simulation(N::Int64, dt::Float64 = 0.1, steps::Int64 = 20)
    particles = particleList(N)
    println( totalPotential(particles) )

end
