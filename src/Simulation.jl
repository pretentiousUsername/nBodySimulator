include("environment.jl") # particle and container properties
include("basicEquations.jl") # equations and stuff like that
include("simulationSetup.jl") # set up particles for the simulation 
include("integrator.jl")

simulation(2)
