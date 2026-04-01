---
title: "Section 2.3: The Poincaré-Bendixson theorem"
weight: 23
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 2.3: The Poincaré-Bendixson theorem
We actually already touched on this in section 1.2 but we are going to look at it in much more detail now. This will allow us to show that there exist closed orbits, as opposed to the previous section where we were finding methods to show that there were no closed orbits.
Note very importantly that when we say that there are no fixed points in $R$ this doesn’t mean that there can be no fixed points inside the closed orbit. This sounds very strange at first, but $R $could, for instance have a piece taken out of the middle of it, where the fixed point exists. For example:
![Figure 1](/images/part23/output_001.png)
Here we have a region $R$ (the blue shaded region) which is closed and bounded (think of it as being a finite region which has a border), where the vector field is continuously differentiable on an open subset of $R$ (ie. it doesn’t have to be differentiable on the boundary itself). We have a curve $C$ which is always within $R$. There are no fixed points in $R$. This means that we are guaranteed that there will be a closed orbit, and indeed the closed orbit is the one which $C$ tends to as $t\to \infty{}$.
In fact we will always have a hole in the middle, because if there is a closed orbit then there must be a fixed point within it, so we have to exclude that from $R$ by cutting a hole out of it.
There’s something that we should note about the vector field in the above example. On the boundary of the region $R$ the vector field is always pointing in. This means that once you are in, you’re in. You can’t escape the region, because any trajectory which left the region would have a vector pointing out of it.
This is the whole trick to finding the right region such that we have a trajectory which is always within that region. Such a region is called a**trapping region**.
So long as we can find a trapping region, and we can make sure that there are no fixed points within that region, then we are sorted.
Example
Here we will be able to find a trapping region by looking carefully at the vector field. The equation in question is similar to the previous one, but with an extra term, parameterised by a constant μ. Again we are looking at polar coordinates:
$$
\dot{r}=r \left(1-r^{2}\right)+r \mu{} \text{ cos } \theta{}
$$
$$
\dot{\theta{}}=1
$$
μ here is a constant and we will look at it for positive values only (negative values are the same as letting $\theta{}\to \theta{}+\pi{}$).
The question is whether we can find some region with an inner radius for which $\dot{r}$ is always positive, and an outer radius where $\dot{r}$ is always negative. Note that here we are just trying to find a perfect annulus. The bounding region doesn't have to be, but we will look for such a region here.
We want to find $r_{\text{ min }}$ for which:
$$
r_{\text{ min }} \left(1-{r_{\text{ min }}}^{2}\right)+r_{\text{ min }} \mu{} \text{ cos } \theta{}>0
$$
For all values of θ. Solving for $r_{\text{ min } }\text{ gives }$:
$$
r_{\text{ min }}<\sqrt{1+\mu{} \text{ cos } \theta{}}
$$
What is the lowest value that the right hand side can take? Well, the minimum value of cos θ is -1, so we can be sure that
$$
r_{\text{ min }}<\sqrt{1-\mu{}}
$$
So we can always be sure that on a circle of $r$=$r_{\text{ min }},$ $\dot{r}$ will be positive. To play it safe, let’s set
$$
r_{\text{ min }}=0.9\sqrt{1-\mu{}}
$$
We see here that with our stricter bound, we are constrained to $\mu{}\leq 1$, and in fact we have to exclude μ=1 as well because with μ=1, $r_{\text{ min }}=0$ and there is a fixed point there, so we can’t include it. So we are only looking at cases for which $\mu{}<1$.
Now running through the same argument for $r_{\text{ max }}$ for which we have to have $\dot{r}$ negative you should find
$$
r_{\text{ max }}>\sqrt{1+\mu{}}
$$
and again we can set
$$
r_{\text{ max }}=1.1\sqrt{1+\mu{}}
$$
In the following we animate over different values of μ from 0 to 1. You can see that the arrows don’t shift so much other than in the top right corner as μ changes. We look at a trajectory that starts just inside the region and note that it is always contained within our annulus of radius
$$
0.9\sqrt{1-\mu{}}< r<1.1\sqrt{1+\mu{}}
$$
![Figure 2](/images/part23/output_002.png)
Indeed we can see that the trajectory is always within the annulus that we have created, and that there does appear to be a limit cycle.
Example
Let’s look at another example, this time a bit more real-world inspired, and a little more complex.
We will look at a pair of equations which model a particular chemical reaction, called glycolisis. This is something which is found in biological systems and is related to the concentrations of ADP (Adenosine Diphosphate), $x$, and F6P (fructose-6-phosphate), $y$. This is related to the energy systems in the body. ADP is the molecule which supplies energy to the cells. One molecule gets turned into the other and vice versa. The question is if there are any closed orbits, where you will have a constant cycling between the two, or if none exists and you just end up with a fixed point, perhaps with only one of the molecules being there and the other not at all.
The equations modelling this system are:
$$
\dot{x}=-x+a y+x^{2}y
$$
$$
\dot{y}=b-a y-x^{2}y
$$
These are well and truly non-linearly coupled. $a \text{ and } b $are parameters related to the reaction and are both taken to be greater than 0. We are going to choose $a=\frac{1}{5},b=1$ for this example to see what happens with these values
We can also take $x \text{ and } y \text{ as both } \text{ being positive } \left(\text{ they are } \text{ chemical concentrations }, \text{ remember }\right).$
So, the question is whether we can find a trapping region in the phase space which does not contain any fixed point.
I’m actually just going to give you the outer trapping region, as the argument for why it is a reasonable trapping reason is a little naunced, and not very enlightening.
It turns out that the following region is a reasonable trapping region:
![Figure 3](/images/part23/output_003.png)
It might not look like the arrows along the bottom are all pointing into the region, but this is an artifact of where the vectors are sampled. If you look along the x-axis you see that
$$
\dot{y}=b
$$
and with positive $b$ these vectors are bound to point up from the axis, and into the trapping region.
So is that enough to prove that we have a closed orbit? Not yet, we have to have a trapping region with no fixed points, but there is a fixed point in this system at:
![Figure 4](/images/part23/output_004.png)
It looks like we might be in trouble. If this is an attractor then we are in trouble, and it looks in this example with $a=\frac{1}{5},b=1 \text{ that it } \text{ might be }$. If that’s the case, then we can’t form cut out a region around the fixed point with a boundary such that the arrows are pointing into the trapping region.
Can we figure out for which values of $a$ and $b$ this fixed point is an attractor and when it’s a repeller? Sure, we can use linearisation to do this.
We first have to find the Jacobian of our system:
$$
A=\left(\begin{matrix} -1+2 x y & a+x^{2} \\ -2 x y & -\left(a+x^{2}\right) \end{matrix}\right)
$$
The fixed point is at
$$
\left(x^{*},y^{*}\right)=\left(b,\frac{b}{a+b^{2}}\right)
$$
So the Jacobian at this point is:
$$
A=\left(\begin{matrix} -1+2 \frac{b^{2}}{a+b^{2}} & a+b^{2} \\ -2 \frac{b^{2}}{a+b^{2}} & -\left(a+b^{2}\right) \end{matrix}\right)
$$
The determinant and trace of this are:
$$
\Delta{}=a+b^{2},       \tau{}=-1+2\frac{b^{2}}{a+b^{2}}-\left(a+b^{2}\right)
$$
Let’s remind ourselves once more of the possible behaviours in 2d linear systems:
![Figure 5](/images/part23/output_005.png)
Well $\Delta{}>0$ in this case as $a \text{ and } b \text{ are both } \text{ positive }.$
It actually doesn’t matter whether the fixed point is a node or a spiral, just whether or not it’s stable or unstable, so we only need to know whether τ is greater than or less than 0. The dividing line between the two is going to be when
$$
-1+2\frac{b^{2}}{a+b^{2}}-\left(a+b^{2}\right)=0   \Longrightarrow{}   b=\sqrt{\frac{1}{2}\left(1-2a\pm{}\sqrt{1-8a}\right)}
$$
Which is given by
![Figure 6](/images/part23/output_006.png)
To see which is which, we let a=0, b=0.5 and see that τ=0.75, which implies that the region shaded in blue corresponds to unstable spirals/nodes. If we have an unstable node/spiral, we can excise this region from the trapping region, and will end up with arrows pointing into the trapping region, therefore the shaded region is the region of closed orbits:
![Figure 7](/images/part23/output_007.png)
Let’s look at the vector field for, for instance $a=0.04, b=0.5$ and show the region excised - we will discuss this more in a moment - this region is **not** quite correct:
![Figure 8](/images/part23/output_008.png)
We should have convinced ourselves earlier that all vectors are necessarily pointing vertically along the x-axis, but it doesn’t look like it in this plot. This again is an artifact of where the vectors are sitting. Zooming in on the x-axis we see:
![Figure 9](/images/part23/output_009.png)
which should convince ourselves that all is well.
However, excising a small disk around the fixed point, all is not well:
![Figure 10](/images/part23/output_010.png)
Not all vectors are pointing out. This is because this is an unstable spiral, so we would actually have to choose a differently shaped excising region in order to have all vectors pointing out of it. We will simply have to convince ourselves for now that because this is an unstable spiral, we could in theory find an appropriate region. It will be some sort of ellipse-like shape at a slight angle.
Now let’s look at two trajectories for this system, starting inside the trapping region:
![Figure 11](/images/part23/output_011.png)
and finally, numerically, I hope that we can believe that we do indeed have a closed orbit!
Lack of chaos in 2d
So, what we have found is that given a relatively simple constraint: trajectories bounded in some region, where there are no fixed points in the region, there is only one thing that can happen: all trajectories end up being attracted to a closed orbit. There’s no sensitivity to initial conditions, that if you change the initial conditions a little, you will end up somewhere completely differently.
And if it’s not confined to a closed bounded region? Well then it will go off to infinity - also not so interesting.
And if there is a fixed point that can’t be excised? Well then trajectories will all end up there.
In fact this statement shows that there can be no chaos in 2d. Given some dynamical system in some bounded region, there’s only a very limited number of things that can happen. This can be seen rather intuitively by the fact that trajectories can’t cross each other, so in 2d, everything is pretty constrained. In 3d however there is suddenly so much more space for the trajectories to move, and indeed in 3d (and above) you can have chaos. In 3d the Poincaré-Bendixson theory does not hold, and so you have behaviours which are much more complex than closed orbits there.
As a caveat, we have to be a little careful with the above statement, as it necessitates a smooth, continuous vector field. Throw singularities into the problem and all sorts of crazy stuff can happen. Similarly, if you are talking about difference equations, and not differential equations, you can have chaos even in 1D.
Other ways of finding limit cycles
This is an example taken from the exercises of section 7.3 of Strogatz, and it gives a nice alternative way of showing that there is a limit cycle.
Given the vector field given by
$$
\dot{x}=x \left(1-4x^{2}-y^{2}\right)-\frac{1}{2}y \left(1+x\right)
$$
$$
\dot{y}=y \left(1-4x^{2}-y^{2}\right)+2x \left(1+x\right)
$$
How can we show that there is a limit cycle here? Well, we can do this by constructing a function given by:
$$
V={\left(1-4x^{2}-y^{2}\right)}^{2}
$$
whose time derivative is:
$$
\dot{V}=-4V\left(4x^{2}+y^{2}\right)
$$
This helps us because it tells us that for trajectories of this system, this quantity $V $always decreases (or stays the same). It only ever stays the same though when $V=0$ and this only ever happens when
$$
{\left(1-4x^{2}-y^{2}\right)}^{2}=0
$$
Which is an ellipse in the $\left(x,y\right) $plane, or when $x=y=0$. So let’s take a look first of all at the origin.
We can easily linearise our system at the origin and it gives us:
$$
\dot{x}=x-\frac{1}{2}y
$$
$$
\dot{y}=y+2x
$$
Which you can show easily gives you an unstable spiral. So if we start anywhere, then we are going to move towards the ellipse given by
$$
4x^{2}+y^{2}=1
$$
Let’s look at the surface of $V$ along with the elliptical limit cycle and some characteristic trajectories:
![Figure 12](/images/part23/output_012.png)