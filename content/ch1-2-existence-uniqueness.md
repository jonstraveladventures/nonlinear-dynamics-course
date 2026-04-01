---
title: "Section 1.2: Existence and Uniqueness"
weight: 12
math: true
---
## Section 1.2: Existence and Uniqueness

We had a look at existence and uniqueness back in MAM1043H. If you don ’t remember this in detail (or at all), take a look here.

Thankfully the theorem that we gave (but didn't prove) for one-dimensional systems holds also for two-dimensional systems. Actually, we can do better than that: we can write a general theorem for all dimensions.

This is just saying that if we want to start at some point in the phase plane, then as long as there is some region around this point for which the function is continuous, and all of its partial derivatives are continuous, then at least for some time, there is a solution before and after this point, and the solution will be unique.

A very importance consequence of this theorem is that a given point can only be a part of a single trajectory (so long as the conditions for the E+U theorem hold, which they always will do in our cases of interest). This means that different trajectories cannot intersect at any point. This means that any flow inside a closed cycle must remain within the closed cycle.

The E+U theorem states that you couldn’t have a phase diagram that looked like this:

![Figure 1](/images/part12/output_001.png)

unless the intersection points themselves were fixed points. The point is that if the intersection points are fixed points, then the trajectories never actually cross, because you can never move passed a fixed point. You can potentially get to it, or move off it, but you can never cross it.

Take a look back at the first phase diagram that we plotted on the previous page. Doesn’t it look like there are trajectories which are intersecting? Why is this NOT the case?

Try and ponder for a while why this might be. Indeed if we have any trajectory which is in any closed bounded region and that region doesn't have any fixed points then that trajectory must eventually get close to, or be a closed cycle.

This theorem is known as the **Poincaré-Bendixson** theorem and we'll go through more of its details later.