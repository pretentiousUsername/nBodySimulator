include("objects.jl") # defines a particle and its environment
include("rules.jl") # rules that particles must follow
include("externalForces.jl") # forces acting on particles
include("particleInteractions.jl") # interactions between particles
include("simulationSetup.jl") # set up particles for the simulation 
include("equationsOfMotion.jl") # make particles move
include("simulator.jl") # simulate the system
include("postProcessing.jl") # extract readable information from the simulation

#println(particleList(2))
#particles = particleList(1)
particles = [Particle([-π + 0.5], [0.0], [0.0], 0.5, 1),
             Particle([π - 0.5], [0.0], [0.0], 0.5, 2)
            ]
box = Container([1.0])
#println(distanceBetweenParticles(particles[1], particles[2], box))
sim = simulation(particles, box, 0.01, 800)

include("visualization.jl") # make the results viewable to humans
