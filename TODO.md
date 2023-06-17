# Stuff I need to work on
+ Make `outOfBounds` deflect particles *before* they get stuck out of bounds;
  look into making a periodic system too. (I'll need to factor in the time
  resolution $\delta t$.)
+ Make a more robust integrator that uses functions and the like, rather than
  a bunch of nested loops and if statements—I really wouldn't recommend you look
  at [`integrator.jl`](src/integrator.jl) if you value your sanity.
+ Make an easier way to set up a simulation with various potentials.