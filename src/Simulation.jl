include("environment.jl") # particle and container properties
include("basicEquations.jl") # equations and stuff like that
include("potentials.jl") # potentials for interactions between particles
include("simulationSetup.jl") # set up particles for the simulation 
include("integrator.jl") # simulate the system
include("postProcessing.jl") # extract readable information from the simulation

#println(particleList(2))
particles = particleList(2)
box = Container([20.0])
sim = simulation(particles, box)

println(getParticlePositions(sim))


include("visualization.jl") # make the results viewable to humans
