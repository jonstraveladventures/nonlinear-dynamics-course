---
title: "Section 1.1: Phase portraits in two dimensions"
weight: 11
math: true
---
## Section 1.1: Phase portraits in two dimensions

Before we start, I will use phase portrait, phase diagram and phase plane somewhat interchangably.

As discussed in section 0, the last thing that we studied in MAM1043H was two-dimensional linear systems. We found that there were a number of different possible behaviours (essentially different kinds of fixed points), depending on the trace and determinant of the matrix $A$. This is all well and good, but most systems are not linear. However, will use some of the same techniques that we used for non-linear one-dimensional systems to see what happens when we can make some linear approximation of a non-linear system. Don't worry about it at the moment, this will all become clear soon!

Let’s remind ourselves now of what we mean by a two-dimensional non-linear system. We will be looking at dynamical systems of the form

$$
{\dot{x}}_{1}=f_{1}\left(x_{1},x_{2}\right)
$$

$$
{\dot{x}}_{2}=f_{2}\left(x_{1},x_{2}\right)
$$

where $f_{1}$ and $f_{2}$ can be any nonlinear function and we remember that the dot is a derivative with respect to time...we are dealing with **dynamical** systems here. We can follow on from the notation that we used before for the linear system, but we can’t write the function as a matrix. Instead we write:

$$
\dot{x}=f\left(x\right)
$$

where $x=\left(x_{1},x_{2}\right)$ and $f=\left(f_{1},f_{2}\right)$. Make sure that you can see how to go between the two forms of notation.

Let’s remind ourselves quickly about how we can represent the different types of solution for a dynamical system. In one dimensional we had a flow on the line. Where the whole of ‘space ’ was depicted as a line, and we represented the dynamics of the system as arrows along the line pointing towards or away from fixed points. We could encapsulate all of the dynamics of the system in that case by plotting $ \dot{x}$ versus$ x$ in a two-dimensional plot. We could then plot$ x\left(t\right)$ for a given solution, or set of solutions.

In the case now of a two-dimensional system we are mostly going to be interested in the phase portrait. In this case we will be plotting curves in the$ \left(x_{1},x_{2}\right)$ plane (the phase plane). We did this already for linear systems in two dimensions, and as mentioned before, we got various types of fixed points, and behaviour of the solution around the fixed points. Remember that specifying a single point in the phase plane will uniquely (up to some cases similar to the non-unique one-dimensional cases) determine all future behaviour.

Solutions will then be curves in the phase plane. What information you miss from the phase portrait, remember, is how fast you are going along these lines in time. In order to see that, it’s then easiest to simply plot separately $x_{1}\left(t\right)$ and $x_{2}\left(t\right).$

Here I just give an example of a phase portrait for a particular two dimensional non-linear system

$$
{\dot{x}}_{1}=x_{2}
$$

$$
{\dot{x}}_{2}=x_{1}-{x_{1}}^{3}
$$

Note that it’s only non-linear because of the ${x_{1}}^{3} $term.

I’m just plotting the full phase portrait here. You aren ’t expected to be able to do this, but we will use it for illustrative purposes.

![Figure 1](/images/part11/output_001.png)

We will study this example in more detail later, but already we can see a number of different features. We can see cycles going around two fixed points, we see cycles going around both fixed points (the green and red lines), and we can see a type of fixed point in the middle. All of this to be discussed later.

In the previous course, as we will in this one, we tried to get general features of a system, without actually having to solve the equations explicitly, as this is often either impossible, or if not impossible, the solutions are so complicated that they don’t help us to understand what’s going on. We want to be as lazy as possible, but no lazier.

So, what sort of features will be able to find the easy way? Well, for fixed points, these are the solutions for which nothing changes over time, so we must have

$$
{\dot{x}}_{1}=0
$$

$$
{\dot{x}}_{2}=0
$$

In the case of the plot above, this is equivalent to:

$$
0=x_{2}
$$

$$
0=x_{1}-{x_{1}}^{3}
$$

which is solved by $\left(x_{1},x_{2}\right)=\left(-1,0\right), \left(1,0\right) \text{ and } \left(0,0\right). $And indeed this does correspond to the fixed points.

How about the closed cycles? Well, these ones must be periodic - ie. $\left(x_{1}\left(t+T\right),x_{2}\left(t+T\right)\right)=\left(x_{1}\left(t\right),x_{2}\left(t\right)\right) $for some period $T$. This means that a time $T$ after any given time $t$ you will find yourself back where you were at time $t$.

We are also going to want to study about what is happening close to the fixed points. Are the lines flowing in or out? In what direction are they headed, or are you purely orbiting the fixed points? And in a similar vein, what are the types of fixed points that we can have?

We are going to have a new feature as well - closed cycles, which are kind of like fixed points, but they aren’t points - they are periodic orbits...we can either have stable, or unstable, or indeed semi-stable ones.

The dynamics as a vector field

You will often see the dynamical equations

$$
\dot{x}=f\left(x\right)
$$

described as a vector field. The reason for this is that if you pick any points $\left(x,y\right)$ in the phase plane, then this equation will tell you the direction of the flow at that point, and you can think that over the whole phase plane are vectors pointing in different directions. We can’t plot all of them, but we can plot a selection.

Taking the example above:

$$
{\dot{x}}_{1}=x_{2}
$$

$$
{\dot{x}}_{2}=x_{1}-{x_{1}}^{3}
$$

We could ask what is happening at the point $\left(2,2\right) \text{ and we }$’d find that:

$$
{\dot{x}}_{1}=2
$$

$$
{\dot{x}}_{2}=2-8=-6
$$

So we would put an arrow pointing in the $\left(2,-6\right) \text{ direction }.$ Doing this over a region of the phase plane we would get:

![Figure 2](/images/part11/output_002.png)

Which, when we put the trajectories on top seem to match up nicely:

![Figure 3](/images/part11/output_003.png)

So when we refer to a set of equations as a vector field, this is why.

Numerical solutions

In addition to being able to get the general features, there are a number of ways of calculating flows in the phase space numerically (this means without finding the analytic - ie. exact - solutions). Here I’m going to give you the equations for a particular method of doing this and I ’m not going to tell you a lot more. Try and do this in Python, or, if you know it, Matlab. It doesn’t matter if you don’t get it. I mostly want you to experiment with it.

Let’s first think about how we might take a continuous differential equation and discretise it. Starting with:

$$
\dot{x}=f\left(x\right)
$$

We can try and approximate the derivative as:

$$
\dot{x}\approx{}\frac{x_{n+1}-x_{n}}{\Delta{}t}
$$

where we are splitting up time into discrete moments and $x_{n}$ corresponds to the value of $x$ at timestep n. When Δt is small, this should be a good approximation to the derivative. So we can write our first approximation as:

$$
\frac{x_{n+1}-x_{n}}{\Delta{}t}=f\left(x_{n}\right)
$$

the choice here to make the function be evaluated at $x_{n}$ is actually where we lose a bit of accuracy. In some senses, we could have chosen to evaluate it at $x_{n} \text{ or } x_{n+1}$ or perhaps an average of the two: $\frac{x_{n}+x_{n+1}}{2}$. We will see below how to improve this.

Taking the naive approach we can write:

$$
x_{n+1}=f\left(x_{n}\right)\Delta{}t+x_{n}
$$

Which says that given a value of $x_{n}$ we can work out where it is at the next timestep. Remember with all of this that $x_{n}$ is itself a vector.

There are many ways to improve the above method to make it a more accurate approximation of the continuous differential equation, and one of them is the Runge-Kutta method:

The equations for the **Runge-Kutta** method say that to find the position in the phase plane $x_{n+1}$ at step n+1, (in the same way that with Euler’s method we took steps last year), you can use the equation:

$$
x_{n+1}=x_{n}+\frac{\left(k_{1}+2k_{2}+2k_{3}+k_{4}\right)}{6}
$$

$$
k_{1}=f\left(x_{n}\right)\Delta{}t
$$

$$
k_{2}=f\left(x_{n}+\frac{1}{2}k_{1}\right)\Delta{}t
$$

$$
k_{3}=f\left(x_{n}+\frac{1}{2}k_{2}\right)\Delta{}t
$$

$$
k_{4}=f\left(x_{n}+k_{3}\right)\Delta{}t
$$

This may seem very very complicated, but basically this allows us to get a better approximation to the equation than the naive approach above.

Give this a go for the example plot above, using Δt=0.01 and try and start at $x_{0}=\left(0,0.5\right)$ and see what you get.

Exercise

Take the equations

$$
\dot{x}=x+e^{-y}
$$

$$
\dot{y}=-y
$$

(where here we have used $x \text{ and } y \text{ instead of } x_{1} \text{ and } x_{2}$).

0. Draw the $x$ and $y$ axes for (-2,2) in the $x$ direction and (-1,1) in the $y$ direction.

1) Find the fixed point of this system of equations. Plot this point in the phase diagram.

2. a) Find the general exact solution to the second equation and see what happens to $y$ as $t\to \infty{}$.

b) What happens to $e^{-y}?$

c) What does the first equation look like as $t\to \infty{}$?

d) What is the solution to the first equation in this limit?

e) What does the above information tell you about the flow in the phase diagram

3. Note that $y=0$ solves the second equation exactly. Find a solution with $y=0$ which solves both equations. What does this say about the stability of the fixed point? See how to notate this in the phase diagram.

4. **Null-clines** are defined as solutions for which either $\dot{x}=0$ or $\dot{y}=0$. That is, at those points, the flow is either completely vertical, or completely horizontal.

a) Find the general family of solutions for which $\dot{x}=0$.

b) Find the general family of solutions for which $\dot{y}=0$.

c) Plot some of these as short arrows in the phase diagram.

The above will give some information about the phase diagram. Now use the method of direction fields that we looked at in MAM1043H to fill in the rest of the diagram. If you’re feeling brave, try and find some flows in the phase diagram using the Runge-Kutta method.