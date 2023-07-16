function timeStep(particles::Vector{Particle}, box::Container, dt::Float64)
    step = [begin
                #=if outOfBounds(particle, box)
                    println(outOfBounds(particle, box))
                    x = backInBounds(particle, box)
                else=#
                    x = positionStep(particle, dt)
                #end
                v = velocityStep(particle, dt)
                a = accelerationStep(particle, particles, dt)
                println(v)
                m = particle.mass
                i = particle.label
                Particle(x, v, a, m, i)
            end for particle in particles]
    return step
end



#=
# I need to find a way to make the positions actually update consistently
=#
function simulation(particles::Vector{Particle}, box::Container, dt::Float64 = 0.001, steps::Int64 = 200)
    timeSteps = [begin
                 particles = timeStep(particles, box, dt)
                 end for step in 1:steps]
    return timeSteps
end
