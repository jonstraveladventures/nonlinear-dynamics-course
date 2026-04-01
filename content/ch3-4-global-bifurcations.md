---
title: "MAM2046W - Second year nonlinear dynamics"
weight: 34
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 3.4: Global bifurcations of cycles
We’ve now seen that while the normal types of bifurcations from 1d persist in 2d and don’t give us anything very different, the existence of limit cycles gives us something more interesting. So far we’ve looked at Supercritical Hopf bifurcations, by which a stable fixed point can explode out into a stable limit cycle and an unstable fixed point, or in the case of the subcritical Hopf bifurcation, an unstable limit cycle can engulf a stable fixed point to become an unstable fixed point. Finally we saw degenerate Hopf bifurcations where there are no limit cycles but only centers about the fixed point which changes from a stable to an unstable spiral across the bifurcation.
So, what else can happen beyond these bifurcations? For the first case we think about what can happen with a flow on the line, and in particular a saddlepoint bifurcation. This occurs when a stable and unstable fixed point appear out of the blue and move away from one another (generically). An example of this would be
$$
\overset{ \bullet{}}{x}=\Mu{} x+x^{3}-x^{5}
$$
Which has phase portraits:
![Figure 1](/images/part34/output_001.png)
Where we are interested in the red box in the bifurcation diagram:
![Figure 2](/images/part34/output_002.png)
What has this got to do with limit cycles? Well, how about the vector field:
$$
\overset{ \bullet{}}{r}=\Mu{} r+r^{3}-r^{5}
$$
$$
\overset{ \bullet{}}{\Theta{}}=\Omega{}+b r^{2}
$$
Well, this will have exactly the same appearance of a pair of fixed points appearing at finite $r \text{ at }$ a particular value of Μ, but we also see that the solutions will have angular velocity. In fact, this is exactly the same case that we illustrated for the subcritical Hopf bifurcation. That happens when $\Mu{}=0 $, as indeed happens in the one-dimensional system. The saddlenode Hopf bifurcation occurs at $\Mu{}=\frac{-1}{4}$
So this system exhibits both a subcritical and saddlenode Hopf bifurcation, we can see them both happening here
![Figure 3](/images/part34/output_003.png)
ok, so what else can happen? This one is a little more complicated. Let ’s look at the system (for $\Mu{}>=0$)
$$
\overset{ \bullet{}}{r}=r(1-r^{2})
$$
$$
\overset{ \bullet{}}{\Theta{}}=\Mu{}-\text{ sin }(\Theta{})
$$
We see that if you are on the line $r=1$ you will necessarily remain on it. But it’s not right in this case to say that it’s necessarily a closed orbit, or indeed a limit cycle. For $\Mu{}>1,$ the second equation has no zeroes, and so there is no angle for which there is no angular velocity. However, for $0<=\Mu{}<1$, the second equation has two zeroes. This means that for $\Mu{}>1$ there is a single, unstable fixed point at $r=0$, however for $0<=\Mu{}<1$ there are two extra fixed points at $r=0$ and the two solutions of
$$
\Theta{}=\text{ arcsin }(\Mu{}), 0<=\Theta{}<=2\Pi{}
$$
How about the stability of these? Well, we can plot the second equation as a simple flow on the one-dimensional line and see:
![Figure 4](/images/part34/output_004.png)
Now plotting this along with the nullclines in polar coordinates we have:
![Figure 5](/images/part34/output_005.png)
This is the case for $0<=\Mu{}<1$. For $\Mu{}>1$, we just have a regular limit cycle, but for $0<=\Mu{}<1$ we see that we are going to get attracting behaviour to the rightmost fixed point and repelling from the left. This looks like
![Figure 6](/images/part34/output_006.png)
So what happens as we get to $\Mu{}=1 \text{ from } $above? Well, just plotting the vector field we see:
![Figure 7](/images/part34/output_007.png)
which doesn’t look terribly interesting...however, for $\Mu{} \text{ just } \text{ above }$ 1, we see that while there isn’t a fixed point, there will be a point where $\Mu{}-\text{ sin }(\Theta{})$ gets very very small (just never hitting zero). That means that if we are on the limit cycle, as we get close to $\Theta{}=\frac{\Pi{}}{2}, $$\overset{ \bullet{}}{\Theta{}}$ will get very very small, and so we will slow down enormously as we get to this point. This looks like:
![Figure 8](/images/part34/output_008.png)
In fact we can plot the trajectory on the unit circle as a function of time for different values of Μ. Plotting $\text{ cos }(\Theta{})$ (the projection onto the x-axis) we get (red is 1.05, green is 1.2, blue is 1.5):
![Figure 9](/images/part34/output_009.png)
Can we calculate the period of the oscillation by integrating the differential equation:
$$
\overset{ \bullet{}}{\Theta{}}=\Mu{}-\text{ sin }(\Theta{})
$$
The period is how long Θ takes to get from 0 to 2Π, so we write:
$$
T={\int{}}_{0}^{2\Pi{}}\frac{1}{\Mu{}-\text{ sin }(\Theta{})}\mathrm{d}\Theta{}=\frac{2\Pi{}}{\sqrt{{\Mu{}}^{2}-1}}
$$
So as $\Mu{}->1, $the period goes to infinity. This therefore is called an **Infinite Period Bifurcation**.
What we see from the animation (and from the equation) is that at the top of the orbit it's very slow, but at the bottom it's very fast. Most of the $\frac{2\Pi{}}{\sqrt{{\Mu{}}^{2}-1}}$time is spent up at the top of the orbit
Deep breath...we have one more limit cycle bifurcation to go, and that is a Homoclinic (or saddle-loop) Bifurcation. The ingredients needed for this are a saddle, and a limit cycle. When the limit-cycle hits the saddle, the bifurcation occurs. It’s not easy to find simple examples of this, so the following simply illustrates what happens in the case of
$$
\overset{ \bullet{}}{x}=y
$$
$$
\overset{ \bullet{}}{y}=\Mu{} y+x-x^{2}+x y
$$
Here I show characteristic trajectories for $\Mu{}=-1, \Mu{}=-0.8645 \text{ and } \Mu{}=-0.8$. On the left you can see that there is a limit cycle in blue. As Μ increases the limit cycle moves closer to the saddle at $(0,0)$ and as it hits the saddle, it connects with the unstable manifold and disintegrates such that trajectories which previously were attracted to the limit cycle now necessarily hit the unstable manifold moving to the bottom left.
![Figure 10](/images/part34/output_010.png)
precisely at the bifurcation point (the middle point), we get a homoclinic orbit.
In the next section we’re going to talk about coupled oscillators and periodicity, and then we will start edging closer to chaos...