include("environment.jl") # particle and container properties
include("basicEquations.jl") # equations and stuff like that
include("externalForces.jl") # forces acting on particles
include("particleInteractions.jl") # interactions between particles
include("simulationSetup.jl") # set up particles for the simulation 
include("equationsOfMotion.jl") # make particles move
include("simulator.jl") # simulate the system
include("postProcessing.jl") # extract readable information from the simulation

#println(particleList(2))
particles = particleList(8)
box = Container([1.0])
sim = simulation(particles, box, 0.01, 800)

include("visualization.jl") # make the results viewable to humans
