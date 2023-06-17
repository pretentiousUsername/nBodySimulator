# An $n$-body simulator
This program isn't anything special, just an attempt at writing a generic
$n$-body simulation in Julia. The only thing I'm doing differently is
implementing Hamilton's equations of motion rather than Newton's equations of
motion.

I think it's worth noting this is a hobby project to improve my lackluster
programming skills—if you're looking for serious software, I would highly
suggest you check out [SciML's `NBodySimulator.jl`][sciml], or the excellent
[`DynamicalSystems.jl`][ds] package. This software is inefficient, it will
likely be buggy, and may go without decent documentation[^1]—I'm also writing
this program under a considerable creative restraint, using as little outside
code as possible. (It sucks being separated from all of those really nice SciML
packages.)

In the future, I *might* implement a routine for solving the Heisenberg
equations of motion for particles, rather than Hamilton's equations, but
that's a *big maybe*. There would be a lot of linear algebra involved, and
I don't see a point in getting that involved for a hobby project.

This program uses the [MIT license](LICENSE).


[^1]: I've always heard that maxim that "code should be self-documenting."
I think it's a noble goal—and for a modern, high-level language like Julia,
Python, or something else like that, it is *somewhat* achievable—but I still
believe programs should have actual documentation.
