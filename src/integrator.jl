function positionStep(particle::Particle, dt::Float64)
    dx = particle.position + dt * particle.momentum / particle.mass   
    return dx
end

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

function timeStep(particles::Vector{Particle}, box::Container, dt::Float64)
    #=step::Vector{Particle} = []
    for particle in particles
        if outOfBounds(particle, box)
            x = positionStep(particle, dt) - particle.position
        else
            x = positionStep(particle, dt)
        end

        p = momentumStep(particle, particles, dt)
        #p = particle.momentum # temporary
        m = particle.mass
        i = particle.label
        newParticle = Particle(x, p, m, i)
        push!(step, newParticle)
    end=#
    step = [begin
                if outOfBounds(particle, box)
                    x = positionStep(particle, dt) - particle.position
                else
                    x = positionStep(particle, dt)
                end

                p = momentumStep(particle, particles, dt)
                m = particle.mass
                i = particle.label
                Particle(x, p, m, i)
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

    println(timeSteps)
    return timeSteps
end
