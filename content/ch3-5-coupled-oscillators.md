---
title: "MAM2046W - Second year nonlinear dynamics"
weight: 35
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 3.5: Coupled oscillators and quasiperiodicity
When we discussed the phase space of the pendulum in first year, we said that we were free to choose $\Theta{}(0)$ and $\dot{\Theta{}}(0)$, which is indeed true, but we ended up plotting trajectories in phase space like:
![Figure 1](/images/part35/output_001.png)
(where here $x_{1} \text{ is } \Theta{}$ and $x_{2} \text{ is }$ $\dot{\Theta{}}$). We never took into account the fact that Θ is periodic (though $\dot{\Theta{}}$ is of course not) - ie $\Theta{}+2\Pi{} \text{ is identified } \text{ with } \Theta{}$. The way we should do this is to acknowledge that the phase plane shouldn ’t be ${\mathbb{R}}^{2}$ but it should be ${\mathbb{R}}^{1}\times{}S^{1}$ - ie a cylinder.
![Figure 2](/images/part35/output_002.png)
Imagine taking the first plot and pasting it around a cylinder of circumference 2Π.
OK, so here we have an example when a phase plane is most naturally described as a phase cylinder. Are there other systems for which we might have a different description?
We know that in a one dimensional system we can’t have any oscillations in terms of a back and forth motion, but of course we can have a flow on the line, where there is an identification on the line meaning that it’s really on a circle. Such a flow would be given by:
$$
\dot{\Theta{}}=f(\Theta{}) \text{ with identification } \Theta{}+2\Pi{}\sim{}\Theta{}
$$
where the [Tilde] symbol means “is identified with ”. This is really a flow on a circle.
We can do the same thing in two dimensions, and think about having two coupled oscillators (flows on a circle), given by, for instance
$$
\dot{{\Theta{}}_{1}}={\Omega{}}_{1}+K_{1}\text{ sin }({\Theta{}}_{2}-{\Theta{}}_{1})
$$
$$
\dot{{\Theta{}}_{2}}={\Omega{}}_{2}+K_{2}\text{ sin }({\Theta{}}_{1}-{\Theta{}}_{2})
$$
Where ${\Omega{}}_{1}\text{ and } {\Omega{}}_{2} \text{ are } $the natural frequencies of the motion (ie. without the $K_{i} \text{ terms }$ we would just have ${\Theta{}}_{i} \text{ going }$ around a circle at frequency ${\Omega{}}_{i}$), and $K_{i} \text{ are }$ coupling constants. We see then that when ${\Theta{}}_{1} \text{ and } {\Theta{}}_{2}$ are very close to each other, or differ by Π, the couplings are small, and when they differ by $\frac{\Pi{}}{2} \text{ or } \frac{3\Pi{}}{2}$ the couplings are large. This system wants to keep the ${\Theta{}}_{i} \text{ close to } $each other, or exactly out of phase. Both the ${\Theta{}}_{i} \text{ live }$ on a circle. We can plot them on the same circle and see their trajectory. For instance if we start with ${\Omega{}}_{1}=1$, ${\Omega{}}_{2}=5$ and both $K_{i}=1 $we get:
![Figure 3](/images/part35/output_003.png)
Is there a simpler way that we could illustrate this? We normally like to think about the state of a system as a single point in phase space. The problem with the above is that we have a single state as being given by two points on the circle. The issue is that we have a two dimensional phase space and we are trying to represent it on a one dimensional space. So what we really need is a space with two compact directions. Such a space is the torus. In the above, we have a state given by two points $({\Theta{}}_{1}(t),{\Theta{}}_{2}(t)).$ The torus is a surface which is parameterised by $({\Theta{}}_{1}(t),{\Theta{}}_{2}(t)). $So for two points on the circle corresponds to a single point on the surface of the torus.
The torus is actually given by the product space $S^{1}\times{}S^{1}$, which is like having two independent circles. One way to see this is to take a piece of paper and first identify the left and right opposite sides. You’ve now got one circular direction. Now do the same thing with the top and bottom (actually, this will be hard with paper as it ’s not stretchable) and you have two circular directions.
Taking the above system of two positions on the circle $({\Theta{}}_{1},{\Theta{}}_{2}) \text{ and }$ converting them to one position on the torus, we get the following trajectory:
![Figure 4](/images/part35/output_004.png)
Where the trajectory through phase space maps out a line on the surface of the torus. One could imagine unfolding the square, and just plotting positions in the $({\Theta{}}_{1},{\Theta{}}_{2})$ square. Try it for yourself...
This particular case is an example of a general form of a vector field which lives on a torus. That of
$$
\dot{{\Theta{}}_{1}}=f_{1}({\Theta{}}_{1},{\Theta{}}_{2})
$$
$$
\dot{{\Theta{}}_{2}}=f_{2}({\Theta{}}_{1},{\Theta{}}_{2})
$$
with a natural identification of ${\Theta{}}_{i}+2\Pi{}\sim{}{\Theta{}}_{i}$.
Going back to the coupled oscillator, there are a couple of interesting limits we can look in.
The first is to ask what happens if the system is not coupled at all. Well, then we get two particles moving around the circle at their own rate, say 1:
$$
\dot{{\Theta{}}_{1}}=1
$$
$$
\dot{{\Theta{}}_{2}}=1
$$
Clearly if they are both moving at the same rate, then not only is each particle's trajectory periodic with period 2Π, but in fact after 2Π, the whole system is back to where it started. How about where we have
$$
\dot{{\Theta{}}_{1}}=2
$$
$$
\dot{{\Theta{}}_{2}}=1
$$
well, here, although the first has period Π and the second has period 2 Π, it takes 2Π for the whole system to get back to where it started, although the first oscillator has been around twice by this point. What about if we had
$$
\dot{{\Theta{}}_{1}}=2
$$
$$
\dot{{\Theta{}}_{2}}=3
$$
Well, in this case the first has period $\frac{2\Pi{}}{2}=\Pi{}$ and the second has period $\frac{2\Pi{}}{3}.$ After the first has been around once, the second has been around one and a half times, and by the time the second one has been around once, the first has only been around 2/3 of a time. So in fact here we have to wait for a time of 2 Π, after which the first oscillator has travelled round exactly twice, and the second has travelled round exactly three times in order to get back to where we started. Plotting these two together, and choosing that they both start off at ${\Theta{}}_{i}(0)=0$ we have:
![Figure 5](/images/part35/output_005.png)
We have to be very careful with what is going on in this plot. ${\Theta{}}_{1} \text{ and } {\Theta{}}_{2}$ are both increasing at constant rates with $t.$ When they reach 2Π, they come back to 0 and continue. We are interested in the point that they are both at ${\Theta{}}_{1}={\Theta{}}_{2}=2\Pi{} $or equivalently 0. This happens after 6Π.
Plotting this on the $({\Theta{}}_{1},{\Theta{}}_{2}) \text{ plane we } \text{ have }$:
![Figure 6](/images/part35/output_006.png)
Plotting this on the torus we see:
![Figure 7](/images/part35/output_007.png)
The path that the trajectory makes on the torus is the so-called trefoil knot, which, if we turn the trajectory into a tube to make it easier to visualise, looks like:
![Figure 8](/images/part35/output_008.png)
In fact we can make a more general statement. If we have two frequencies
$$
\dot{{\Theta{}}_{1}}={\Omega{}}_{1}
$$
$$
\dot{{\Theta{}}_{2}}={\Omega{}}_{2}
$$
where $\frac{{\Omega{}}_{1}}{{\Omega{}}_{2}}=\frac{p}{q}\in{}\mathbb{Q}, $where $p\perp{}q$, then the system will be periodic. What will the period be? Well, the period of the first cycle is $\frac{2\Pi{}}{{\Omega{}}_{1}} $and that of the second is $\frac{2\Pi{}}{{\Omega{}}_{2}}$. We want to find the lowest positive T such that T=$\frac{2 \Pi{}}{{\Omega{}}_{1}}p=\frac{2\Pi{}}{{\Omega{}}_{2}}q$ for $q,p\in{}$ ℤ. In the example above, we had:
$$
T=\frac{2\Pi{}}{2}p=\frac{2\Pi{}}{3}q \text{ for } p=2,q=3, \text{ therefore } T=2\Pi{}.
$$
If $\frac{{\Omega{}}_{1}}{{\Omega{}}_{2}}$is not rational, then the system will be **quasiperiodic.** This is a bit of a strange name because overall the system will **never** return to its starting position, but the rotation around each cycle of the torus independently is periodic. This means that you will just keep going around the torus forever and never get back to where you started. More than this we can say that the trajectories are dense on the torus. This means that if you pick any point on the torus and any finite number $0<l$, $l\in{}\mathbb{R}$ then the trajectory will always pass within a distance $l$ of the point, wherever the point is and however small $l \text{ is }.$
Now let’s extend this very very simple system and allow for a coupling between the two oscillators. We can still talk about the phase space on the torus, but now the trajectories are not just going to wind around each cycle in a way dictated purely by ${\Omega{}}_{i}.$ Reminding ourselves of the system, we have:
$$
\dot{{\Theta{}}_{1}}={\Omega{}}_{1}+K_{1}\text{ sin }({\Theta{}}_{2}-{\Theta{}}_{1})
$$
$$
\dot{{\Theta{}}_{2}}={\Omega{}}_{2}+K_{2}\text{ sin }({\Theta{}}_{1}-{\Theta{}}_{2})
$$
We see here that the coupling is only dependent on the distance between the ${\Theta{}}_{i}.$ Let’s subtract the equations from one another:
$$
\dot{{\Theta{}}_{1}}-\dot{{\Theta{}}_{2}}={\Omega{}}_{1}-{\Omega{}}_{2}+K_{1}\text{ sin }({\Theta{}}_{2}-{\Theta{}}_{1})-K_{2}\text{ sin }({\Theta{}}_{1}-{\Theta{}}_{2})
$$
So now we can define a new variable $\Phi{}={\Theta{}}_{1}-{\Theta{}}_{2}$ and rewrite this equation as:
$$
\dot{\Phi{}}=({\Omega{}}_{1}-{\Omega{}}_{2})+K_{1}\text{ sin }(-\Phi{})-K_{2}\text{ sin }(\Phi{})=({\Omega{}}_{1}-{\Omega{}}_{2})-(K_{1}+K_{2})\text{ sin }(\Phi{})
$$
$$
\dot{\Phi{}}=({\Omega{}}_{1}-{\Omega{}}_{2})-(K_{1}+K_{2})\text{ sin }(\Phi{})
$$
Somehow we have a system where the natural frequency is given by the difference between the original frequencies, and the new “coupling” is additive in the old couplings.
This system is known as the non-uniform oscillator. Remember, given that Φ is the difference between the ${\Theta{}}_{i}$ and the coupling only becomes important when the ${\Theta{}}_{i} \text{ are far } \text{ apart } $(difference far away from 0 or Π), this equation makes sense.
What do we do when we are looking at dynamical systems? We ask about the fixed points! The fixed points are clearly given by
$$
0=({\Omega{}}_{1}-{\Omega{}}_{2})-(K_{1}+K_{2})\text{ sin }(\Phi{})  \Longrightarrow{} \text{ sin }(\Phi{}) =\frac{({\Omega{}}_{1}-{\Omega{}}_{2})}{(K_{1}+K_{2})}
$$
Well, this only has solutions when
$$
-1<=|\frac{({\Omega{}}_{1}-{\Omega{}}_{2})}{(K_{1}+K_{2})}|<=1
$$
and given that $K_{i}$ are positive integers, we have:
$$
|({\Omega{}}_{1}-{\Omega{}}_{2})|<=K_{1}+K_{2}
$$
In fact there will be exactly two fixed points for
$$
|({\Omega{}}_{1}-{\Omega{}}_{2})|<K_{1}+K_{2}
$$
and only one when
$$
|({\Omega{}}_{1}-{\Omega{}}_{2})|=K_{1}+K_{2}
$$
Fixing $K_{1}+K_{2}=1$, and letting ${\Omega{}}_{1}-{\Omega{}}_{2}=\Delta{}\Omega{}$ we have the phase portraits (excluding the arrows):
![Figure 9](/images/part35/output_009.png)
Which looks very much look a saddlenode bifurcation...I rephrase...it is a saddlenode bifurcation.
What does this mean for the case where there are two fixed points? Well, it means that over time $\Phi{}->{\Phi{}}^{*}$ which is some constant given by:
$$
\text{ sin }({\Phi{}}^{*})=\frac{{\Omega{}}_{1}-{\Omega{}}_{2}}{K_{1}+K_{2}}
$$
which says that ${\Theta{}}_{1}-{\Theta{}}_{2}$ tends to this constant. Which means that the two oscillators lock in sync. It doesn’t mean that the two ${\Theta{}}_{i}$ are the same, but that their difference becomes constant...they follow each other around the loop at a constant distance. The frequency with which they go around the loop is found by just plugging the above into the original equations:
$$
\dot{{\Theta{}}_{1}}={\Omega{}}_{1}-K_{1}\text{ sin }({\Phi{}}^{*})={\Omega{}}_{1}-K_{1}\frac{{\Omega{}}_{1}-{\Omega{}}_{2}}{K_{1}+K_{2}}=\frac{K_{2}{\Omega{}}_{1}+K_{1}{\Omega{}}_{2}}{K_{1}+K_{2}}
$$
$$
\dot{{\Theta{}}_{2}}={\Omega{}}_{2}+K_{2}\text{ sin }({\Phi{}}^{*})={\Omega{}}_{2}-K_{2}\frac{{\Omega{}}_{1}-{\Omega{}}_{2}}{K_{1}+K_{2}}=\frac{K_{2}{\Omega{}}_{1}+K_{1}{\Omega{}}_{2}}{K_{1}+K_{2}}
$$
Thankfully both give the same frequency of
$$
{\Omega{}}^{*}=\frac{K_{2}{\Omega{}}_{1}+K_{1}{\Omega{}}_{2}}{K_{1}+K_{2}}=\frac{K_{2}}{K_{1}+K_{2}}{\Omega{}}_{1}+\frac{K_{1}}{K_{1}+K_{2}}{\Omega{}}_{2}
$$
this frequency is known as the **compromise frequency** and is like a weighted average of the two frequencies, in a weighting related to the relative strengths of the couplings. If $K_{2}$ is much larger, then the frequency of the first oscillator will dominate, and vice versa. Take the case of very large $K_{2}$, very small $K_{1}$, then our equations are approximated by
$$
\dot{{\Theta{}}_{1}}={\Omega{}}_{1}
$$
$$
\dot{{\Theta{}}_{2}}=K_{2}\text{ sin }({\Theta{}}_{1}-{\Theta{}}_{2})
$$
Then the first oscillator will have its frequency fixed, and the second oscillator will move towards the point where ${\Theta{}}_{2}$ is close to ${\Theta{}}_{1}$which means that its frequency is also fixed. With
$$
\dot{{\Theta{}}_{1}}=1+0.1\text{ sin }({\Theta{}}_{2}-{\Theta{}}_{1}), {\Theta{}}_{1}(0)=0
$$
$$
\dot{{\Theta{}}_{2}}=3+10\text{ sin }({\Theta{}}_{1}-{\Theta{}}_{2}), {\Theta{}}_{2}(0)=2
$$
we have the following trajectories
![Figure 10](/images/part35/output_010.png)
If we have
$$
|({\Omega{}}_{1}-{\Omega{}}_{2})| >K_{1}+K_{2}
$$
then there is no fixed point, and no phase locking. You can see here that the lines keep crossing each other.
![Figure 11](/images/part35/output_011.png)
The boundary between the phase locked dynamics and the non phased locked dynamics is a **saddlenode bifurcation of cycles**.
Explore what sort of behaviour you can get within the $({\Omega{}}_{1},{\Omega{}}_{2},k_{1},k_{2})$ parameter space.