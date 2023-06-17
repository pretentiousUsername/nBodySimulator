# dp/dt = - ∂H/∂q
# dq/dt = ∂H/∂p

# This is just a test function right now.
function motion(particle::Particle)
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


function simulation(N::Int64, dt::Float64 = 0.1, steps::Int64 = 20)
    particles = particleList(N)
    box = Container(20., 20.)
    #println( totalPotential(particles) )
    #totalPotential(particles)
    
    for i in 1:steps
        x = [motion(q) for q in particles]
        for particle in particles
            particle.position = x[particle.label]
            if outOfBounds(particle, box)
                particle.momentum = -particle.momentum
            else
            end
        end
        println(x) # we have motion!
    end

end
