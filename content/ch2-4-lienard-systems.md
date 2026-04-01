---
title: "Section 2.4: Liénard Systems"
weight: 24
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 2.4: Liénard Systems
In general within mathematics, we often like to be able to make general statements about classes of systems. As an example, one can say that for any dynamical system of the form
$$
\ddot{x}+b \dot{x}+c x=0
$$
for $b,c \in{} R$, given any two solutions $x_{1}$and $x_{2}$, any linear combination of $x_{1}\text{ and } x_{2} $will also be a solution. That’s a general statement about a whole class of problems, and such information can be very useful.
It turns out that there is a class of non-linear systems called Liénard Systems, which we can make some bold claims about.
Vector fields of the form:
$$
\ddot{x}+\dot{x} f(x)+g(x)=0
$$
equivalent to:
$$
\dot{y}=-\dot{x} f(x)-g(x)
$$
$$
\dot{x}=y
$$
Are known as Liénard Systems, and it turns out that if:
1. $f \text{ and } g$ are both continuously differentiable functions
2. $g \text{ is an } \text{ odd }$ function of $x$ and is positive for all $x>0$
3. $f$ is an even function of $x$
4. and finally where:
$$
F(x)={\int{}}_{0}^{x}f(u)\mathrm{d}u
$$
a) has exactly one zero for positive at $x=a (\text{ for positive } a)\to F(a)=0$
b) $F(x)<0 \text{ for } 0<x<a$
c) $F(x)>0 \text{ and } F'(x)\geq 0 \text{ for } x>a$
d) $F(x)\to \infty{} \text{ as } x\to \infty{}$
then the system is guaranteed to have a single stable limit cycle around the origin in the phase plane.
ok, there’s a lot to digest here! First of all let ’s look at the vector field itself:
$$
\ddot{x}+\dot{x} f(x)+g(x)=0
$$
Writing this as:
$$
\ddot{x}=-\dot{x} f(x)-g(x)
$$
we can see that the acceleration is a function of the velocity and position. This is what we should expect in a two dimensional phase space. Everything is decided by the position and velocity.
If we imagine $f(x)=0$ and we have that $g(x)=-g(-x), \text{ and positive } \text{ for positive } x$, then for positive $x$ we have:
$$
\ddot{x}<0
$$
and for negative $x$ we have
$$
\ddot{x}>0
$$
This is like a spring, where the system is always being accelerated back to the origin.
Now, $\text{ for } f \text{ non }$-zero, we have the situation where there is a force related to the velocity, which is like a damping force, but it’s a position dependent non-linear damping force.
What’s all this stuff about the integral formula $\text{ of } F?$
Well, the statement is that $F(x)<0 \text{ for } 0<x<a$, and $F(x)=0 \text{ for } x=a$. We know that $F(0) \text{ must equal } \text{ zero }$ by the definition of the integral. So this says that $f(x) \text{ must be } \text{ negative }$ for $x \text{ close to } \text{ zero }$ and must cross to positive at some point before $x=a$ so that the area below and above the x-axis are the same by the time we get to a. In fact it can cross multiple times before $x=a$, but again, the area above can never be greater than the area below the axis, and they have to exactly cancel out at $x=a.$ And for $x>0$, $f(x) \text{ must be } \text{ positive }$ for $F \text{ to be } \text{ increasing in } \text{ this region }$.
Here is a really contrived example of $f$ which fulfils all of the criteria.
![Figure 1](/images/part24/output_001.png)
What’s going on here? Well, we have to think about separate situations...where $\dot{x}$ is positive, ie. we are moving away from the centre, then when f(x) is positive, we are being decelerated, and when f(x) is negative we are being accelerated. The integral condition means that essentially the amount of positive and negative contributions to the accelerate and deceleration cancel out...so although we have damping, we have as much positive as negative damping and so overall it’s like not having damping at all. However, for $x>a$, all of our damping is going to be positive and so it’s going to bring us back towards these smaller values of $x.$
What does a limit cycle mean here? It means that there is some periodic behaviour of this system, and wherever you start, you will always end up asymptotically performing that motion. Note that really what is happening is that there is both some restoring force, as well as some damping which in some regions is positive and some negative, and together the two mean that the equilibrium behaviour is not what you would have in a regular damped system (everything eventually approaches 0). Without the negative damping you couldn’t have this.
Here is again a rather contrived example from the above $f$ with equation:
$$
\ddot{x}+\dot{x} (-\frac{\text{ cos } x}{10+x^{2}}+0.0001x^{2}-0.01)+0.01x^{3}=0
$$
![Figure 2](/images/part24/output_002.png)
Where the blue trajectory is very slowly moving in towards the limit cycle and the red trajectory is very slowly moving out towards it.
The return of the Van der Pol oscillator
Remember the Van der Pol oscillator?
$$
\ddot{x}+\mu{}(x^{2}-1)\dot{x} +x=0
$$
Check that this fulfils all of the above criteria. What is the value of $a$ in this case? Indeed we already know that this has a unique, stable limit cycle.
Looking at how the VdP oscillator behaves for μ=5, we see the following. Here we have also plotted $f(x) $on the same graph. See the way it is accelerated in the different regions:
This actually gives you quite a bit of flexibility for families of vector fields which have unique stable limit cycles about the origin.
Lienard Systems were originally designed to model the radio and vacuum tube technology. Vacuum tubes were used originally instead of transistors in computers.
Exercise:
Come up with your own Lienard system, plot the vector field and try and find a trajectory numerically.