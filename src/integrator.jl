function positionStep(particle::Particle, dt::Float64)
    dx = particle.position + dt * particle.momentum / particle.mass   
    return dx
end

# I need to rewrite this function to give the total force between all
# particles in an an n-dimensional array
function totalForce(q::Particle, list::Vector{Particle})
    mutualInteraction = [begin
                             if sameParticle(q, particle)
                                 [0. for i in 1:length(q.position)] # I could just use zeros()
                             else
                                 interparticleForce(q, particle)
                             end
                         end for particle in list]
    mutualInteraction = sum(mutualInteraction)
    #println(mutualInteraction)

    return mutualInteraction
end

function momentumStep(particle::Particle, list::Vector{Particle}, dt::Float64)
    dp = particle.momentum + dt * totalForce(particle, list)
    return dp
end

function timeStep(particles::Vector{Particle}, dt::Float64)
    step::Vector{Particle} = []
    for particle in particles
        x = positionStep(particle, dt)
        p = momentumStep(particle, particles, dt)
        #p = particle.momentum # temporary
        m = particle.mass
        i = particle.label
        newParticle = Particle(x, p, m, i)
        push!(step, newParticle)
    end
        
    return step
end



#=
# I need to find a way to make the positions actually update consistently
=#
function simulation(N::Int64, dt::Float64 = 0.01, steps::Int64 = 20)
    particles = particleList(N)
    #timeSteps = timeStep(particles, dt)
    timeSteps = [begin
                 particles = timeStep(particles, dt)
             end for step in 1:steps]

    #timeSteps = totalForce(particles[1], particles)
    println(timeSteps)
    return timeSteps
end
