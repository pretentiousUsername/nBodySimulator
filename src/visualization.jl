# This is the one file that uses an external library
using Plots

coords = getParticleXYZ(sim)
r = box.radius

dimensions = length(r)

if dimensions == 2
    animation = @animate for i in 1:length(coords)
        scatter(coords[i][1], coords[i][2],
        title = "The current state of this program",
        legend = false,
        xlims = (-boxCoords[1], boxCoords[1]),
        ylims = (-boxCoords[2], boxCoords[2]))
    end

elseif dimensions == 1

    yAxis = [0.5 for i ∈ 1:length(coords)]

    animation = @animate for i in 1:length(coords)
        scatter(coords[i], yAxis,
                title = "The current state of this program",
                legend = false,
                #xlims = (-boxCoords[1], boxCoords[1]),
                xlims = (-π / 2, π / 2),
                #xlims = (0, 2π),
                ylims = (0, 1.0))
    end
else
    println("Fuck off")
end

gif(animation, "aaaa.gif", fps = 30)

#scatter(coords[1][1], coords[1][2], label="aaaaa", legend=false)
#savefig("aaaaa.png")
