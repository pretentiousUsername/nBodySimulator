# This is the one file that uses an external library
using Plots

coords = getParticlePositions(sim)

animation = @animate for i in 1:length(coords)
    scatter(coords[i],
           legend = false)
end

gif(animation, "aaaa.gif", fps = 12)

#scatter(coords[1], label="aaaaa")
#savefig("aaaaa.png")
