include("environment.jl") # particle and container properties
include("basicEquations.jl") # equations and stuff like that
include("potentials.jl") # potentials for interactions between particles
include("simulationSetup.jl") # set up particles for the simulation 
include("integrator.jl") # simulate the system
include("postProcessing.jl") # extract readable information from the simulation

#println(particleList(2))
particles = particleList(4)
box = Container([1.0])
sim = simulation(particles, box)

include("visualization.jl") # make the results viewable to humans
