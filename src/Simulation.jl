include("objects.jl") # defines a particle and its environment
include("rules.jl") # rules that particles must follow
include("externalForces.jl") # forces acting on particles
include("particleInteractions.jl") # interactions between particles
#include("simulationSetup.jl") # set up particles for the simulation 
include("equationsOfMotion.jl") # make particles move
include("simulator.jl") # simulate the system
include("postProcessing.jl") # extract readable information from the simulation

#println(particleList(2))
#particles = particleList(1)
particles = [Particle([-1.0], [0.0], [0.0], 0.5, 1),
             Particle([-0.5], [0.0], [0.0], 0.5, 2),
             #Particle([0.001], [0.0], [0.0], 0.5, 3),
             Particle([0.5], [0.0], [0.1], 0.5, 4),
             #Particle([1.0], [-0.1], [0.0], 0.5, 5),
            ]
box = Container([1.0])
#println(distanceBetweenParticles(particles[2], particles[3], box))
sim = simulation(particles, box, 0.01, 800)

include("visualization.jl") # make the results viewable to humans
