---
title: "Section 3.2: Hopf bifurcations"
weight: 32
math: true
---
# MAM2046W - Second year nonlinear dynamics

## Section 3.2: Hopf bifurcations

So, it seems that everything is the same in two dimensions as it was in one dimension in terms of bifurcations...but actually, if we dig a little deeper we will see that there is more to understand here.

In one dimension, a single fixed point on its own can’t go from being stable to unstable. If it becomes unstable, then two other stable fixed points must have appeared from somewhere (a pitchfork bifurcation).

We will see now that in two dimensions, it’s limit cycles that bring in some novel, interesting behaviours. What we will show is that a fixed point can go from being stable to unstable essentially by the action of a limit cycle engulfing it, or moving away from it. This can happen in two ways.

We’re going to start off with an example and then explore what’s happening.

We start with the vector field in polar coordinates given by

$$
\dot{r}=\mu{} r+r^{3}-r^{5}
$$

$$
\dot{\theta{}}=\omega{}+b r^{2}
$$

We see here three parameters, but let’s set two of them to fixed values. Playing around, I found that $\omega{}=0.1 \text{ and } b=0.1$ were good for visualisation.

In the following animation, I let μ vary from -0.4 to 0.2. You will see circles appear. The dashed circle is an unstable limit cycle and the undashed circle is a stable limit cycle. We’ll explore this below.

![Figure 1](/images/part32/output_001.png)

What’s happening here?

Well, because of the rotational symmetry of the problem, the limit cycles will be circles of fixed radius about the origin, so to find them we just have to find when $4\to $

$$
\dot{r}=0    \to    \mu{} r+r^{3}-r^{5}=0
$$

which has solutions

$$
r={0,-\frac{\sqrt{1-\sqrt{1+4 \mu{}}}}{\sqrt{2}},\frac{\sqrt{1-\sqrt{1+4 \mu{}}}}{\sqrt{2}},-\frac{\sqrt{1+\sqrt{1+4 \mu{}}}}{\sqrt{2}},\frac{\sqrt{1+\sqrt{1+4 \mu{}}}}{\sqrt{2}}}
$$

We are only interested in positive values of r (r=0 is a fixed point) so we have:

$$
r_{\text{ limit cycle }}={\frac{\sqrt{1-\sqrt{1+4 \mu{}}}}{\sqrt{2}},\frac{\sqrt{1+\sqrt{1+4 \mu{}}}}{\sqrt{2}}}
$$

but in fact these are only real for certain values of μ. Plotting these along with the nature of the fixed point at zero we see:

![Figure 2](/images/part32/output_002.png)

Where as usual dashed lines correspond to instability, though we have to be careful here about the limit cycles (blue), for $r>0,\text{ and the } \text{ fixed point } \left(\text{ red }\right) \text{ at } r=0$.

Note that we have what is a bifurcation happening at $\mu{}=-\frac{1}{4}$, where suddenly the radius of the limit cycle becomes real and a stable and unstable limit cycle appear. Note that this point is NOT the Hopf bifurcation. That happens at μ=0. We also have a rather interesting thing happening as the unstable limit cycle collapses in to the origin and changes the nature of the fixed point from stable to unstable. We’ve never seen that before.

![Figure 3](/images/part32/output_003.png)

In the first we have no limit cycle and a stable fixed point at 0. In the second we have a stable and unstable limit cycle and a stable fixed point at 0, and in the third we have a stable limit cycle and an unstable fixed point.

The part of this where the unstable limit cycle shrinks to zero size and engulfs the stable fixed point, turning it into an unstable fixed point is called a **Hopf Bifurcation**. Actually, this is a **Subcritical Hopf bifurcation**. We will look at the supercritical one in a bit. Note again that the sudden appearance of the stable and unstable limit cycles is not the Hopf bifurcation. That is a saddle bifurcation of limit cycles.

Let’s look at some trajectories, not in phase space but just in terms of $x\left(t\right) \text{ for certain } \text{ initial conditions } \text{ in this } \text{ system at }$ different values of μ.

![Figure 4](/images/part32/output_004.png)

Taking some snapshots of this we have:

![Figure 5](/images/part32/output_005.png)

Notice how we start off with everything being attracted to the fixed point, then the outer solution start to get attracted to the outer limit cycle, and finally all solutions get attracted to the out limit cycle. The important thing though is that the large starting condition gets, in some sense, gradually attracted to the stable limit cycle, whereas the small start condition has a sudden jump.

For $\mu{}<{\mu{}}_{c}$ which in this case is 0, small oscillations decay. Large oscillations also decay for $\mu{}<-\frac{1}{4}$in this case, but for $-\frac{1}{4}<\mu{}<0$ large oscillations get attracted to the attractive limit cycle. Then for $\mu{}>0$ all oscillations get attracted to the limit cycle.

The important point here is that the small amplitude oscillation goes from being attracted to zero to quickly jumping to a large amplitude oscillation as we pass the critical value of μ. This is a so-called **Subcritical Hopf Bifurcation**.

To understand a bit more about what’s happening in terms of the fixed point, we will look at the Eigenvalues of the Jacobian at the fixed point at the origin.

To do this we will convert everything back to Cartesian coordinates. Writing $x=r \text{ cos } \theta{} \text{ and } y=r \text{ sin } \theta{} \text{ we have }:$

$$
\dot{x}=\dot{r} \text{ cos } \theta{}-r \text{ sin } \theta{} \dot{\theta{}}
$$

$$
\dot{y}=\dot{r} \text{ sin } \theta{}+r \text{ cos } \theta{} \dot{\theta{}}
$$

Plugging in the equations of motion for this system we get:

$$
\dot{x}=\left(\mu{} r+r^{3}-r^{5}\right) \text{ cos } \theta{}-r \text{ sin } \theta{} \left(\omega{}+b r^{2}\right)=\left(\mu{} +r^{2}-r^{4}\right)r \text{ cos } \theta{}-r \text{ sin } \theta{} \left(\omega{}+b r^{2}\right)
$$

$$
\dot{y}=\left(\mu{} r+r^{3}-r^{5}\right) \text{ sin } \theta{}+r \text{ cos } \theta{} \left(\omega{}+b r^{2}\right)=\left(\mu{} +r^{2}-r^{4}\right) r \text{ sin } \theta{}+r \text{ cos } \theta{} \left(\omega{}+b r^{2}\right)
$$

and converting the right hand side back to Cartesian coordinates we have:

$$
\dot{x}=\left(\mu{} +\left(x^{2}+y^{2}\right)-{\left(x^{2}+y^{2}\right)}^{2}\right)x-y \left(\omega{}+b \left(x^{2}+y^{2}\right)\right)
$$

$$
\dot{y}=\left(\mu{} +\left(x^{2}+y^{2}\right)-{\left(x^{2}+y^{2}\right)}^{2}\right) y+x \left(\omega{}+b \left(x^{2}+y^{2}\right)\right)
$$

This is a fairly unpleasant expression, but note that at the fixed point at 0, we are not going to need any more than the linear terms here. All other terms, when we take the derivative and plug in $x=0, y=0$ will vanish. So linearising the above we get:

$$
\dot{x}=\mu{} x-y \omega{}+ \text{ higher order } \text{ terms }
$$

$$
\dot{y}=\mu{}  y+x \omega{}+ \text{ higher order } \text{ terms }
$$

The Jacobian for this is

$$
A=\left(\begin{matrix} \mu{} & -\omega{} \\ \omega{} & \mu{} \end{matrix}\right)
$$

Rather than studying this in terms of the determinant and trace, let ’s actually find the eigenvalues. Well, you should be able to show that these are:

$$
\lambda{}=\mu{}\pm{}i \omega{}
$$

Remember, the imaginary part just says that we have periodic behaviour. The real part tells us whether we will grow or shrink (in the phase plane) starting with some initial condition. When $\lambda{}<0$ oscillations will shrink (ie. we will be periodic, but moving into the fixed point at the origin) and for $\lambda{}>0, \text{ oscillations }$ will grow. We see that the nature of the fixed point therefore changes as we go from negative to positive values of μ.

Supercritical Hopf Bifurcations

We’ve focused here in subcritical Hopf Bifurcations, which in some sense are the more ‘violent’ type. Where there is a sudden jump of the fixed point in the centre from stable to unstable, with the nearest stable point being some way away.

A prototypical example of a supercritical Hopf Bifurcation is:

$$
\dot{r}=\mu{} r-r^{3}
$$

$$
\dot{\theta{}}=\omega{}+b r^{2}
$$

All of the eigenvalue calculations go through as before, we we have

$$
\lambda{}=\mu{}\pm{}i \omega{}
$$

and so we know that at μ=0 we will go from having a stable fixed point at 0 to an unstable one. However, it is the nature of the limit cycle that is different. Here there is only a limit cycle at

$$
r_{\text{ limit cycle }}=\sqrt{\mu{}}
$$

So now our diagram looks like:

![Figure 6](/images/part32/output_006.png)

There is no value for which there is an unstable limit cycle, and so here, when you have small oscillations, as you increase μ they will go gradually from decaying, to having periodicity in a smooth way.

![Figure 7](/images/part32/output_007.png)

Here everything happens smoothly, and is reversible. That is that as you increase and decrease μ, you can smoothly go from the limit cycle to the fixed point limit. In the subcritical case there is a sudden change which can ’t be reversed. This is hysteresis, and essentially corresponds to following the following trajectory:

![Figure 8](/images/part32/output_008.png)

|The subcritical Hopf bifurcation is a dangerous thing to find, and can occur in engineering situations where vibrations suddenly occur, and are very hard to get rid of without a large change in the parameters of your system. They also occur in neurons.

In fact there is a third type of Hopf Bifurcation which can occur called a **Degenerate Hopf Bifurcation**, though in this case there is no limit cycle at all.

Looking an example of this

$$
\dot{x}=y
$$

$$
\dot{y}=-\mu{} y-\text{ sin } x
$$

We have the following:

![Figure 9](/images/part32/output_009.png)

For $\mu{}<0 \text{ we have } \text{ an } $unstable spiral, and for $\mu{}>0 \text{ we have }$ a stable spiral. There’s no limit cycle to be found, but the nature of the fixed point is changing. Instead, at $\mu{}=0$, we have not a limit cycle, but that there are whole bands of periodic solutions. These are not limit cycles as limit cycles have to be isolated:

![Figure 10](/images/part32/output_010.png)