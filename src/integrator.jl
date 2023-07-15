# dx   p
# -- = -
# dt   m


function positionStep(particle::Particle, dt::Float64)
    # Euler method = BAD
    dx = particle.position + dt * particle.momentum / particle.mass
    #=xⱼ = particle.position
    p = particle.momentum
    m = particle.mass
    dx₀ = 0.5 * p / m

    k₁ = @. dx₀ * dt
    k₂ = @. xⱼ + k₁ * dt / 2 
    k₃ = @. xⱼ + k₂ * dt / 2
    k₄ = @. xⱼ + k₃ * dt
    xⱼ₊₁ = @. xⱼ + (k₁ + 2k₂ + 2k₃ + k₄) * dt / 6=#

    return dx
    #return xⱼ₊₁

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

    return mutualInteraction
end

function momentumStep(particle::Particle, list::Vector{Particle}, dt::Float64)
    dp = particle.momentum - dt * totalForce(particle, list)
    #=pⱼ = particle.momentum
    F = totalForce(particle, list)
    dp₀ = -F
    
    k₁ = @. dp₀ * dt
    k₂ = @. pⱼ + k₁ * dt / 2
    k₃ = @. pⱼ + k₂ * dt / 2
    k₄ = @. pⱼ + k₃ * dt
    pⱼ₊₁ = @. pⱼ + (k₁ + 2k₂ + 2k₃ + k₄) * dt / 6=#

    return dp
    #return pⱼ₊₁
end

function timeStep(particles::Vector{Particle}, box::Container, dt::Float64)
    step = [begin
                if outOfBounds(particle, box)
                    x₀ = particle.position #positionStep(particle, dt)
                    x = backInBounds(x₀, box)
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

    return timeSteps
end
