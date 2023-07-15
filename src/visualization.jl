# This is the one file that uses an external library
using Plots

coords = getParticleXYZ(sim)


boxCoords = containerCoordinates(box)
animation = @animate for i in 1:length(coords)
    scatter(coords[i][1], coords[i][2],
           title = "The current state of this program",
           legend = false,
           xlims = (0, boxCoords[1]),
           ylims = (0, boxCoords[2]))
end

gif(animation, "aaaa.gif", fps = 24)

#scatter(coords[1][1], coords[1][2], label="aaaaa", legend=false)
#savefig("aaaaa.png")
