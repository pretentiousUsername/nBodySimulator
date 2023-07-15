include("environment.jl") # particle and container properties
include("basicEquations.jl") # equations and stuff like that
include("potentials.jl") # potentials for interactions between particles
include("simulationSetup.jl") # set up particles for the simulation 
include("integrator.jl")

#println(particleList(2))
particles = particleList(2)
box = Container([20.0])
simulation(particles, box)
