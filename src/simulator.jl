function timeStep(particles::Vector{Particle}, box::Container, dt::Float64)
    step = [begin
                #a = accelerationStep(particle, particles, box, dt)
                #=a = accelerationStep(particle, particles, box)
                v = velocityStep(a, particle, dt)
                x = positionStep(v, particle, dt)=#
                x, v, a = rungeKuttaStep(particle, particles, box, dt)
                m = particle.mass
                i = particle.label
                Particle(x, v, a, m, i)
                #Particle(particle.position .+ 0.1)

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
