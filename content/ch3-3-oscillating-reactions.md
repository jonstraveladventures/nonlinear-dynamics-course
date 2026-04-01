---
title: "MAM2046W - Second year nonlinear dynamics"
weight: 33
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 3.3: Oscillating chemical reactions
In this section we’re going to look at a model for a complex chemical reaction, which involves chlorine dioxide, iodine and malonic acid:
![Figure 1](/images/part33/output_001.png)
The chemical details don’t matter at all here, but it turns out that a dynamical model of the concentrations of iodine $(x)$ and chlorine dioxide $(y) \text{ can } \text{ be } \text{ given } $by
$$
\overset{ \bullet{}}{x}=a-x-\frac{4x y}{1+x^{2}}
$$
$$
\overset{  \bullet{}  }{y}=b x (1-\frac{y}{1+x^{2}})
$$
The parameters $a \text{ and } b$ are related to chemical properties set outside of the concentration of these two chemicals (ie. these are constants within this system), and are both greater than 0.
We might look at this and be at a bit of a loss to know how to analyse it. The first thing that would seem sensible to look at would be the fixed points, and the null-clines.
The fixed points are clearly given by
$$
0=a-x-\frac{4x y}{1+x^{2}}
$$
$$
0=b x (1-\frac{y}{1+x^{2}})
$$
we can see that the second equation has a zero when $x=0, \text{ but } \text{ plugging }$ that into the first gives $0=a$, and because we know that the constants are both positive, $x=0 $can’t be a fixed point. So we look at the second term in the second equation:
$$
(1-\frac{y}{1+x^{2}})=0    \text{\textbackslash[DoubleLongRightArrow]} y=1+x^{2}
$$
Plugging this into the first equation gives us
$$
0=a-x-\frac{4x (1+x^{2})}{(1+x^{2})}   \text{\textbackslash[DoubleLongRightArrow]} a-5x=0 \text{\textbackslash[DoubleLongRightArrow]} x^{*}=\frac{a}{5}, y^{*}=1+\frac{a^{2}}{25}
$$
So the fixed point is dependent on $a \text{ only }.$ Now finding the null-clines just means plotting for
$$
\overset{ \bullet{}}{x}=0 \text{ and }\overset{  \bullet{}  }{y}=0
$$
separately.
The first of these is given by:
$$
0=a-x-\frac{4x y}{1+x^{2}}  \text{\textbackslash[DoubleLongRightArrow]} y=\frac{(1+x^{2})(a-x)}{4x} \text{ for }  \overset{ \bullet{}}{x}=0
$$
and the second:
$$
0=b x (1-\frac{y}{1+x^{2}}) \text{\textbackslash[DoubleLongRightArrow]} x=0 \text{ or } y=1+x^{2} \text{ for }  \overset{ \bullet{}}{y}=0
$$
We can plot these curves and put on characteristic arrows corresponding to the lack of $x \text{ or } y $flow along them. Let’s choose a=5 so that the fixed point is at (1,2):
![Figure 2](/images/part33/output_002.png)
These arrows are not showing the magnitude of the flow, just the direction. Make sure that you can see why some are pointing left and some right, some up and some down.
ok, so we see something maybe a bit interesting here...it looks like we might have something like a cycle about the fixed point occurring here.
At this stage we should think about Poincaré-Bendixson, and for that we need to find a trapping region. Remember this is a region which can ’t contain a fixed point, but where all arrows on the boundary point into it. We don’t have quite enough yet to build this.
Let’s also add on the vectors on the axes (at least their direction, if not magnitude.
Well, along the x-axis, we have
$$
(\overset{ \bullet{}}{x},\overset{  \bullet{}  }{y})=(a-x,b x)
$$
So these are always pointing up for positive $x \text{ though }$ they will have a component pointing to the right or left depending on where $x \text{ is } $in relation to $a$. And along the y-axis we have:
$$
(\overset{ \bullet{}}{x},\overset{  \bullet{}  }{y})=(a,0)
$$
so always pointing right. Putting this together, with a bit of artistic license, we have:
![Figure 3](/images/part33/output_003.png)
How can we create a trapping region here? Well, we know that the y-axis has arrows with positive $\overset{ \bullet{} }{x}$, and the x-axis always has arrows with positive $\overset{ \bullet{} }{y}$. Can we create a box where from all sides, arrows are pointing in?
Well, let’s try and construct the right hand side of the box. We want some $x \text{ value }$ such that for all $y \text{ values } $on that vertical line, $\overset{ \bullet{} }{x}$ is always negative. So this says we want:
$$
\overset{ \bullet{}}{x}=a-x-\frac{4x y}{1+x^{2}}<0
$$
which gives
$$
a-x<\frac{4x y}{1+x^{2}}
$$
If we choose $x=a$ then this will necessarily be fulfilled for positive $x \text{ and } y$. So the right side of our trapping region is just the line $x=a$. How about the top? Well, we want some value of $y$ for which, for $0<x<a$, $\overset{ \bullet{} }{y}<0$:
$$
\overset{  \bullet{}  }{y}=b x (1-\frac{y}{1+x^{2}})<0
$$
which implies:
$$
1<\frac{y}{1+x^{2}}
$$
but because $0<x<a$, this will always be true for any
$$
y>1+a^{2}
$$
So we can choose the top of our box to be infinitesimally above this value of y:
Now we can form a trapping region as follows (with $b=1)$:
![Figure 4](/images/part33/output_004.png)
OK, so we have a trapping region apart from the fixed point. If we can excise the fixed point and show that it is a repeller, then we are done and we have a stable limit cycle. So when is this fixed point a repeller?
Well, let’s calculate the Jacobian at the fixed point. We could calculate it at $(x^{*},y^{*})=(\frac{a}{5},1+\frac{a^{2}}{25})$ but it’s actually easier to note that at the fixed point $y^{*}=1+x^{*2}$:
$$
A_{(x^{*},1+x^{*2})}=\frac{1}{1+x^{*2}}(\text{\textbackslash[NoBreak]}\begin{pmatrix} 3x^{*2}-5 & -4 x^{*} \\ 2b x^{*^{2}} & -b x^{*} \end{pmatrix}\text{\textbackslash[NoBreak]})
$$
and plugging in $x^{*}=\frac{a}{5} \text{ we } \text{ have }:$
$$
A_{(\frac{a}{5},1+\frac{a^{2}}{25})}=\frac{1}{1+\frac{a^{2}}{25}}(\text{\textbackslash[NoBreak]}\begin{pmatrix} 3\frac{a^{2}}{25}-5 & -4 \frac{a}{5} \\ 2b \frac{a^{2}}{25} & -b \frac{a}{5} \end{pmatrix}\text{\textbackslash[NoBreak]})
$$
which has trace and determinant:
$$
\Delta{}=\frac{b a}{1+\frac{a^{2}}{25}}, \Tau{}=3-\frac{8+a \frac{b}{5}}{1+\frac{a^{2}}{25}}
$$
the determinant is clearly always positive. Now the question is the sign of the trace. If it is positive, then we have a repeller (spiral, star or node), and this occurs when:
$$
b<\frac{3a}{5}-\frac{25}{a}
$$
Which, given that a and b are positive gives:
![Figure 5](/images/part33/output_005.png)
What happens at the boundary in between? Well, a limit cycle appears from the fixed point, so this is a Hopf Bifurcation.
We should also just make sure that the fixed point is always inside the box bounded by $x=a \text{ and } y=1+a^{2}. $ Because the fixed point is at $(\frac{a}{5},1+\frac{a^{2}}{25})$, the answer is that yes, it will always be in the box.
Let’s step back and think about what we’ve found. Well, we have shown that in some region of $(a,b) $parameter space there is a fixed point for the reaction and that you will end up with a steady state with just the two concentrations sitting there in perfect equilibrium. On the other hand, for another region of the parameter space you will have a stable limit cycle where the concentrations keep altering in a cyclic fashion.
Let's just plot the trajectories on the vector field animated over changing $b, \text{ with } a=20.$ The transition happens when $b=$$\frac{3a}{5}-\frac{25}{a}=\frac{3 20}{5}-\frac{25}{20}=10.75.$
Here we have two starting points. For small $b \text{ we }$ see that both are attracted to the limit cycle, for which one starting point is inside, and the other is outside. Then as $b $increases, the limit cycle shrinks down to the fixed point:
![Figure 6](/images/part33/output_006.png)