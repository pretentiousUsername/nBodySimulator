include("objects.jl") # defines a particle and its environment
include("rules.jl") # rules that particles must follow
include("externalForces.jl") # forces acting on particles
include("particleInteractions.jl") # interactions between particles
include("simulationSetup.jl") # set up particles for the simulation 
include("equationsOfMotion.jl") # make particles move
include("simulator.jl") # simulate the system
#include("postProcessing.jl") # extract readable information from the simulation

#println(particleList(2))
particles = particleList(1)
box = Container([1.0])
sim = simulation(particles, box, 0.25, 800)

#include("visualization.jl") # make the results viewable to humans
