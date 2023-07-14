function positionStep(particle::Particle, dt::Float64)
    dx = particle.position + dt * particle.momentum / particle.mass   
    return dx
end

#=
Evenetually I'll implement something that works for forces acting on all
particles in a system---for now it's just forces between particles.
=#

function totalForce(q::Particle, list::Array{Particle})
    mutualInteraction = [begin
                             if sampeParticle(q, particle)
                                 zeros(length(q.position))
                             else
                                 interparticleForce(q, particle)
                             end
                         end for particle in list]

    return mutualInteraction
end

function momentumStep(particle::Particle, list::Array{Particle}, dt::Float64)
    dp = particle.momentum + dt * totalForce(particle, list)
    return dp
end

function timeStep(particles::Array{Particle}, dt::Float64)
end



#=
# I need to find a way to make the positions actually update consistently
=#
function simulation(N::Int64, dt::Float64 = 0.1, steps::Int64 = 20)
end
