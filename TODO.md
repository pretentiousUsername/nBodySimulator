# Stuff I need to work on
+ Add in functionality for defining custom simulations rather than making a
  random list of particles.
+ ~~Write a minimally working simulation.~~
+ Rewrite the simulation code to allow for RK4 and/or Verlet integrators.
    - In order to implement an RK4 integrator, I need to program in a way to
      do calculations that will do n-body calculations for every $k_n$ value.
+ ~~Add a way to keep particles bound to a periodic environment (e.g. make it
  so particles are incapable of escaping a container).~~[^1]

[^1]: ~~Perhaps making each axis (i.e. $x$, $y$, and $z$) a circle—rather than
a straight line—could help with this. That would make the boundary periodic,
and completely inescapable for a particle.~~
