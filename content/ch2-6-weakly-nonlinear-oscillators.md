---
title: "Section 2.6: Weakly nonlinear oscillators"
weight: 26
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 2.6: Weakly nonlinear oscillators
Not the Van der Pol oscillator again, I hear you cry!! Yep, I ’m afraid so...but this time in a different limit. Not the limit of very strong nonlinearities, but the opposite limit, where it ’s very close to linear:
$$
\ddot{x}+\epsilon{} (x^{2}-1)\dot{x} +x=0
$$
where now ε is going to be treated as a small value.
In fact we are going to be studying more general systems than this. We are going to me looking at systems of the form
$$
\ddot{x}+x+\epsilon{} h(x,\dot{x} )=0
$$
where $h(x,\dot{x} )$ is some smooth function, and $0\leq \epsilon{}\ll 1$.
We’re going to ask, in the same way that we did when this term was very large, what can we learn about such a system with this approximation?
In fact the answer seems kind of obvious...I hope. For the Van der Pol oscillator, if we treat the term proportional to ε as being small, and we start at some small value of $x, \text{ then we } \text{ are going } $to be approximately moving according to
$$
\ddot{x}=-x
$$
which gives circular motion, but we will have a term of the form:
$$
\ddot{x}=-x-\epsilon{} (\text{ small and } \text{ negative })\dot{x}
$$
which says that we will have an additional contribution of the acceleration in the direction of motion, which drives us slightly out from circular motion. As we get closer and closer to $x=1, \text{ this small } \text{ additional term } \text{ becomes }$ even smaller, and so we get a better and better approximation to
$$
\ddot{x}=-x
$$
as we approach $x=1$. For ε=0.1, we have:
![Figure 1](/images/part26/output_001.png)
We’ve gone from the complicated motion of the Van Der Pol oscillator, to a pretty simple version which is more or less circular motion with a slight movement out for $x<1$ and a slight movement in for $x>1$.
The same thing happens with the so-called Duffing equation, given by:
$$
\ddot{x}+\delta{} \dot{x}+\alpha{} x+\beta{} x^{3}=\gamma{} \text{ cos }(\omega{} t)
$$
This is of course a three dimensional system, but taking $\alpha{}=1, \delta{}=\gamma{}=0$, we have:
$$
\ddot{x}+x+\beta{} x^{3}=0
$$
which for $\beta{}=0.1 \text{ on the } \text{ left and } \beta{}=2 \text{ on the } \text{ right }$ look like:
![Figure 2](/images/part26/output_002.png)
The Duffing equation is itself very interesting, and we may discuss it more later.
**Exercise**: By taking the Duffing equation and multiplying by $\dot{x}$, and integrating, find a conserved quantity. Given that there is a fixed point at $(x,\dot{x})=(0,0)$, what does this tell you? Plot the energy surface.
Anyway, we’re going on tangents here, let’s get back to business...
As you get back to business, make sure that you have a pen and a pad of paper with you. Write all of what follows down and make sure that you can understand every step of the mathematics!
So, given an equation of the form:
$$
\ddot{x}+x+\epsilon{} h(x,\dot{x} )=0
$$
You might think that you could perform a perturbative analysis. This is often the case when you have a small parameter in the system. You set up the solution as a series expansion in the small parameter, plug in the series to the equation and solve order by order. Seems not implausible, so let ’s give it a go.
Let’s look at the particular example:
$$
\ddot{x}+x+2\epsilon{} \dot{x} =0
$$
A series solution would look like:
$$
x(t)=x_{0}(t)+\epsilon{} x_{1}(t)+{\epsilon{}}^{2}x_{2}(t)+...
$$
Sometimes you will see the left hand side written as $x(t,\epsilon{}), \text{ but we } $will miss out the ε here. Let’s see if we can find these different $x_{k}(t)$ for a given initial condition:
$$
x(0)=0, \dot{x}(0)=1
$$
This also means that we can set $x_{0}(0)=0, x_{0}'(0)=1$ and all other $x_{k}(0), x_{k}'(0)=0$. Why? Because the ε should not affect the first order term, so it can’t be ε dependent, therefore it must give us the initial condition. Note that we’re using ‘ rather than dots here for the time derivative. It’s just a notation convention, but you can use either.
Actually, the equation can be solved exactly to get:
But here we want to presume that we don’t know the analytical solution and find an approximation. Plugging in our perturbative solution to the equation we get:
$$
\frac{d^{2}}{d t^{2}}(x_{0}(t)+\epsilon{} x_{1}(t)+{\epsilon{}}^{2}x_{2}(t)+...)+(x_{0}(t)+\epsilon{} x_{1}(t)+{\epsilon{}}^{2}x_{2}(t)+...)+2\epsilon{} \frac{d}{d t}(x_{0}(t)+\epsilon{} x_{1}(t)+{\epsilon{}}^{2}x_{2}(t)+...)=0
$$
The idea at this point is that you collect together terms at each order in $\epsilon{}$:
$$
(x_{0}''(t)+x_{0}(t))+\epsilon{} (x_{1}''(t)+x_{1}(t)+2x_{0}'(t))+{\epsilon{}}^{2}(x_{2}''(t)+x_{2}(t)+2x_{1}'(t))+O({\epsilon{}}^{3})=0
$$
ok, so now we state that because the $x_{k}(t)$ solutions themselves don’t depend on ε, we should be able to solve order by order:
$$
(x_{0}''(t)+x_{0}(t))=0
$$
$$
(x_{1}''(t)+x_{1}(t)+2x_{0}'(t))=0
$$
$$
(x_{2}''(t)+x_{2}(t)+2x_{1}'(t))=0
$$
So if we solve the $x_{0}(t)$ we can then plug it into the second equation and solve for $x_{1}(t) \text{ etc }.$
The first equation has solution
$$
x_{0}(t)=c_{1}\text{ cos }(t)+c_{2}\text{ sin }(t)
$$
where $c_{2}=1 \text{ and } c_{1}=0 $by the initial conditions. Now going to the second equation we have:
$$
x_{1}''(t)+x_{1}(t)=-2\text{ cos }(t)
$$
hmmm...but this is a resonant driving force. We can solve this and it gives us:
$$
x_{1}(t)=-t \text{ sin }(t)
$$
But now we have a problem. We have said that $\epsilon{}$ is small, but in fact what we really need is that $\epsilon{} x_{1}(t) \text{ is small } \text{ compared }$ to $x_{0}(t)$, but now we have this $t \text{ term }$, so for large times, this second term is clearly not going to be smaller than the first term. In fact the second term is going to start to dominate when
$$
t \epsilon{}\gtrsim{}1
$$
because just going up to this second term our series expansion now looks like:
$$
x(t)=\text{ sin }(t)-\epsilon{} t \text{ sin }(t)+{\epsilon{}}^{2}x_{2}(t)+...
$$
So perhaps we can trust this series solution for small times, but not for times greater than of order $\frac{1}{\epsilon{}}.$
Plotting the true solution, and the first two terms of the series solution we see the following, for $\epsilon{}=0.1:$
![Figure 3](/images/part26/output_003.png)
Where the red is the true solution, and the blue is the series solution, which is a reasonable approximation up to around t=4, and then after that it diverges a lot.
In fact we see that while the fast oscillations seem to be in ‘rhythm’ between the two functions, over the longer timescale, the true solution exponentially converges, whereas the series solution diverges.
We say that the short timescale behaviours (the oscillations) agree, but the longer timescale behaviours disagree. The reason for this is quite simple. If we take the true solution, it is given by:
$$
x(t)=e^{-\epsilon{} t }\frac{\text{ sin }(\sqrt{1-{\epsilon{}}^{2}}t)}{\sqrt{1-{\epsilon{}}^{2}}}
$$
There is a fast timescale behaviour given by the sinusoidal motion, and there’s an exponential decay dominated by $e^{-t \epsilon{}}$. We can say that the fast timescale is O(1), and the slow timescale is O(1/ε).
On the other hand, the timescale of the incorrect blowup is O(1).
If we perform a series expansion of this last part it is given by:
$$
e^{-\epsilon{} t }=1-\epsilon{} t+\frac{{(\epsilon{} t)}^{2}}{2}-...
$$
we know that this is exact, for arbitrary $\epsilon{} t$, but if $\epsilon{} t$ is large, then you need to take a very large number of terms. This is the issue that has arisen. We stopped at the second term...and that wasn ’t unreasonable, as we wanted to do this for small ε...but it’s not the size of ε that is important, it’s the size of ε $t$.
What we see here is a general phenomenon. For any weakly nonlinear oscillator, we are going to have a timescale given by the purely linear approximation, then we’re going to have another timescale dictated by $\frac{1}{\epsilon{}}.$
So can we still use a perturbative method? It turns out that we can, but we have to do a bit of a change of variables.
Pause: We have mentioned timescales a bunch of times here, but what do we really mean. Well, it all feels a bit vague and hand-wavey, but what we really mean are the characteristic time over which there is a substantial change in some aspect of a system (an oscillator, a phase, an amplitude). If you have a periodic function of the form $f(t)=\text{ sin }(t)$, and let’s say that $t $is measured in seconds, then if you look at your system at time $t=0$ and time $t=0.01$, then your system isn’t going to have changed much. By timescale here we really mean, over what minimum order of magnitude of time will we see a noticeable change. There are lots of vague notions in here. What do we mean by “noticeable change ”? Also, what do we mean by order of magnitude. We really mean here not that we care about whether it’s 1 second, or 1.1 seconds, but whether it’s 1 second, or 0.1 seconds, or 10 seconds, etc. And in this case, because the frequency is $\frac{1}{2\pi{}}$, we can say that the timescale over which things change substantially is on the order of 1 second. After 1 second, you’ve completed 1/2π of the whole oscillation. After $\frac{4}{2\pi{}} \text{ seconds you }'\text{ ve gone } \text{ from } 0$ to the maximum of the oscillation, so this is a reasonable measure for the characteristic timescale.
For the exponential part, we are really again asking over which time period are you seeing a substantial change, and here after time of order 1/ε, the term $e^{\epsilon{} t}$ has changed by a factor of $e$. Of course we could say that it had already changed a reasonable amount after $\frac{1}{2\epsilon{}}$but we are just interested in the order of magnitude, and so we just care about the relative difference in timescales. One is of order 1 and one is of order $\frac{1}{\epsilon{}}.$
Such ideas come up in dynamical systems in the real world a lot. For instance, in the brain, there are multiple timescales:
Neurons fire over timescales of $O({10}^{-3}s)$
Sensory processing and short term memory occur over timescales of $O({10}^{0}-{10}^{2}s)$
Long-term potentiation and learning occur over timescales of $O({10}^{1}-{10}^{4}s)$
Long-term memory and synaptic pruning occur over timescales of $O({10}^{3}-{10}^{6}s)$
Neuroplasticity and aging occur over timescales of $O({10}^{5}-{10}^{8}s)$
These numbers are all up for debate, and you’ll find other figures floating around, but you get the general idea. The dynamics of such a system is very complex and there is dynamics happening at the millisecond, second, minute, hour, day, month, year timescale. They also overlap, which makes modelling such processes really hard, as you can’t really deal with any one of them alone.
OK, on to the problem at hand.
The solution depends on two timescales, which we will treat as independent variables. We let $\tau{}=t$ be the fast time, and $T=\epsilon{} t $be the slow time. Now we set up our series expansion as before but now with;
$$
x(t)=x_{0}(\tau{},T)+\epsilon{} x_{1}(\tau{},T)+{\epsilon{}}^{2}x_{2}(\tau{},T)+...
$$
Now the total derivative in t gives us:
$$
\frac{d}{d t}=\frac{\partial{}}{\partial{} \tau{}}+\frac{\partial{} T}{\partial{} t}\frac{\partial{}}{\partial{} T}=\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T}
$$
Plugging the series expansion into the equation using the new variables gives:
$$
(\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T})(\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T})(x_{0}(\tau{},T)+\epsilon{} x_{1}(\tau{},T)+{\epsilon{}}^{2}x_{2}(\tau{},T))+(x_{0}(\tau{},T)+\epsilon{} x_{1}(\tau{},T)+{\epsilon{}}^{2}x_{2}(\tau{},T))+2\epsilon{} (\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T})(x_{0}(\tau{},T)+\epsilon{} x_{1}(\tau{},T)+{\epsilon{}}^{2}x_{2}(\tau{},T))=0
$$
Taking the zeroth order terms we have:
$$
\frac{{\partial{}}^{2}}{\partial{} {\tau{}}^{2}}x_{0}(\tau{},T)+x_{0}(\tau{},T)=0
$$
Which has solutions
$$
x_{0}(\tau{},T)=A(T)\text{ cos }(\tau{})+B(T) \text{ sin }(\tau{})
$$
Where the functions $A \text{ and } B $are not fixed. This sounds kind of ridiculous! But actually if we now go to the next order in ε, we have the equation:
$$
\frac{{\partial{}}^{2}}{\partial{} {\tau{}}^{2}}x_{1}(\tau{},T)+2\frac{\partial{}}{\partial{} T}\frac{\partial{}}{\partial{} \tau{}}x_{0}(\tau{},T)+ x_{1}(\tau{},T)+2\frac{\partial{}}{\partial{} \tau{}}x_{0}(\tau{},T)=0
$$
and now we can plug our solution above in to get:
$$
\frac{{\partial{}}^{2}}{\partial{} {\tau{}}^{2}}x_{1}(\tau{},T)+2\frac{\partial{}}{\partial{} T}\frac{\partial{}}{\partial{} \tau{}}(A(T)\text{ cos }(\tau{})+B(T) \text{ sin }(\tau{}))+ x_{1}(\tau{},T)+2\frac{\partial{}}{\partial{} \tau{}}(A(T)\text{ cos }(\tau{})+B(T) \text{ sin }(\tau{}))=0
$$
$$
\frac{{\partial{}}^{2}}{\partial{} {\tau{}}^{2}}x_{1}(\tau{},T)+2(-A'(T)\text{ sin }(\tau{})+B'(T) \text{ cos }(\tau{}))+ x_{1}(\tau{},T)+2(-A(T)\text{ sin }(\tau{})+B(T) \text{ cos }(\tau{}))=0
$$
which we can rewrite as:
$$
\frac{{\partial{}}^{2}}{\partial{} {\tau{}}^{2}}x_{1}(\tau{},T)+ x_{1}(\tau{},T)=-2\text{ sin }(\tau{})(A(T)+A'(T))+2\text{ cos }(\tau{})(B(T)+B'(T))
$$
How could we ensure that we don’t have a resonant driving force here? Well, we can do this by setting:
$$
(A(T)+A'(T))=0
$$
$$
(B(T)+B'(T))=0
$$
which means that:
$$
A(T)=A_{0}e^{-T}
$$
$$
B(T)=B_{0}e^{-T}
$$
so our $x_{0}(\tau{},T) $solution is:
$$
x_{0}(\tau{},T)=A_{0}e^{-T}\text{ cos }(\tau{})+B_{0}e^{-T} \text{ sin }(\tau{})
$$
Why did we say that there can't be a resonant driving force? This is a bit subtle. If there was a driving force with timescale τ, we would end up with something where the τ would be not just the short-term time-scale but also the long-term timescale, which we know can’t be the case. The long-term dynamics is driven by T, not τ, so we can ’t have a driving force which makes the system explode on short time-scales.
We have to be a little careful to find our constant to match the initial conditions. Our initial conditions are:
$$
x(0)=0, \dot{x}(0)=1
$$
The first of these says that:
$$
x_{0}(0,0)+\epsilon{} x_{1}(0,0)+{\epsilon{}}^{2}x_{2}(0,0)+...=0
$$
We want to solve this for general small ε, which means that we must have
$$
x_{0}(0,0)=0
$$
For the second condition, we have to be a bit careful and write
$$
\dot{x}(0)=(\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T})(x_{0}(\tau{},T)+\epsilon{} x_{1}(\tau{},T)+{\epsilon{}}^{2}x_{2}(\tau{},T)+...)|_{\tau{}=0,T=0}=1
$$
which has zeroth order term:
$$
(\frac{\partial{}}{\partial{} \tau{}})(x_{0}(\tau{},T))|_{\tau{}=0,T=0}=1
$$
The reason we had to be careful here was because now there are two time-variables, so we have to be sure of what the derivative condition is with respect to.
Applying these two conditions gives:
$$
x_{0}(0,0)=A_{0}e^{-0}\text{ cos }(0)+B_{0}e^{-0} \text{ sin }(0)=A_{0}=0
$$
$$
(\frac{\partial{}}{\partial{} \tau{}})(x_{0}(\tau{},T))|_{\tau{}=0,T=0}=-A_{0}e^{-T}\text{ sin }(\tau{})+B_{0}e^{-T} \text{ cos }(\tau{})|_{\tau{}=0,T=0}=B_{0}e^{-0} \text{ cos }(0)=B_{0}=1
$$
So $A_{0}=0$, $B_{0}=1$ and we have
$$
x_{0}(\tau{},T)=e^{-T} \text{ sin }(\tau{})=e^{-t \epsilon{} }\text{ sin }(t)
$$
This is a very good approximation to the true solution, but doesn ’t take into account a THIRD timescale which is related to the $\sqrt{1-{\epsilon{}}^{2}} \text{ term }$...but that can be left for another day...
Actually, let’s just think about the corrections. We know that the true answer is:
$$
x(t)=e^{-\epsilon{} t }\frac{\text{ sin }(\sqrt{1-{\epsilon{}}^{2}}t)}{\sqrt{1-{\epsilon{}}^{2}}}
$$
Let’s expand the non-exponential term in ε to see where we are going wrong:
$$
x(t)=e^{-\epsilon{} t }(\text{ sin }(t)+\frac{1}{2} (-t \text{ cos }(t)+\text{ sin }(t)) {\epsilon{}}^{2})
$$
So we see that the error is:
$$
\text{ error }(t)=\frac{e^{-\epsilon{} t }}{2}(\text{ sin }(t)-t \text{ cos }(t)){\epsilon{}}^{2}
$$
Which is of order $1/{\epsilon{}}^{2}$.
Exercise: Now do the same thing with the Van der Pol oscillator.
In general...
Can we now come up with some methods based on the above “two-timing” method that work for general weakly nonlinear oscillations? Let’s see...
We are looking at:
$$
\ddot{x}+x+\epsilon{} h(x,\dot{x} )=0
$$
and again we will define $\tau{}=t, T=t \epsilon{}, \text{ which }$ gives us:
$$
(\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T})(\frac{\partial{}}{\partial{} \tau{}}+\epsilon{}\frac{\partial{}}{\partial{} T})x(\tau{},T)+x(\tau{},T)+\epsilon{} h(x,\dot{x} ) =0
$$
which we can write more compactly as:
$$
({\partial{}}_{\tau{}\tau{}}+2\epsilon{} {\partial{}}_{\tau{} T}+{\epsilon{}}^{2}{\partial{}}_{TT})x+x+\epsilon{} h =0
$$
subbing in the series expansion
$$
x(t)=x_{0}(\tau{},T)+\epsilon{} x_{1}(\tau{},T)+{\epsilon{}}^{2}x_{2}(\tau{},T)+...
$$
again we take order by order to give:
$$
\\{\partial{}}_{\tau{}\tau{}}x_{1}(\tau{},T)+x_{1}(\tau{},T)=-2 {\partial{}}_{\tau{} T}x_{0}(\tau{},T)-h
$$
where remember $h=h(x, \dot{x} )=h(x(\tau{}, T),({\partial{}}_{\tau{}}+\epsilon{} {\partial{}}_{T}) x(\tau{}, T))$ which to zeroth order in ε is $h(x_{0}(\tau{},T),{\partial{}}_{\tau{}}x_{0}(\tau{},T))$. So we have
$$
\\{\partial{}}_{\tau{}\tau{}}x_{1}(\tau{},T)+x_{1}(\tau{},T)=-2 {\partial{}}_{\tau{} T}x_{0}-h(x_{0}(\tau{},T),{\partial{}}_{\tau{}}x_{0}(\tau{},T))
$$
we can write the solution to the first equation as the sin+cos combination, or we can write it as
$$
x_{0}(\tau{},T)=r(T)\text{ cos }(\tau{}+\phi{}(T))
$$
(show that they are equivalent)
plugging this into the second equation we have:
$$
\\{\partial{}}_{\tau{}\tau{}}x_{1}(\tau{},T)+x_{1}(\tau{},T)=-2 {\partial{}}_{\tau{} T}r(T)\text{ cos }(\tau{}+\phi{}(T))-h(r(T)\text{ cos }(\tau{}+\phi{}(T)),{\partial{}}_{\tau{}}r(T)\text{ cos }(\tau{}+\phi{}(T)))
$$
which is:
$$
\\{\partial{}}_{\tau{}\tau{}}x_{1}(\tau{},T)+x_{1}(\tau{},T)=2 (r'(T)\text{ sin }(\tau{}+\phi{}(T))+r(T)\phi{}'(T)\text{ cos }(\tau{}+\phi{}(T)))-h(r(T)\text{ cos }(\tau{}+\phi{}(T)),-r(T)\text{ sin }(\tau{}+\phi{}(T)))
$$
We don’t want any driving terms on the right hand side, so there can’t be any terms proportional to sin(τ+φ(T)) or cos(τ+φ(T)).
For the first two terms that seems pretty easy...but for the h term...how do we pull out the terms proportional to sin and cos? Let’s just simplify notation a little bit here first. We’ll remember all the functional dependencies and write the right hand side as:
$$
\\2 (r'\text{ sin }(\tau{}+\phi{})+r \phi{}'\text{ cos }(\tau{}+\phi{}))-h(r \text{ cos }(\tau{}+\phi{} ),-r \text{ sin }(\tau{}+\phi{} ))
$$
and in fact we can also let τ+φ = θ to give
$$
\\2 r'\text{ sin }(\theta{})+2r \phi{}'\text{ cos }(\theta{})-h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))
$$
So $h \text{ is } a \text{ periodic } $function of θ...now we get our Fourier hats on, because we know that a function which is periodic in θ can be written as:
$$
\\h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))=\underset{k=0}{\overset{\infty{}}{\sum{}}}a_{k}\text{ cos }(k \theta{})+\underset{k=1}{\overset{\infty{}}{\sum{}}}b_{k}\text{ sin }(k \theta{})
$$
where the $b_{0} \text{ term }$ doesn’t appear as sin(0)=0. Here the $a_{k} \text{ and } b_{k} \text{ will be } \text{ functions of } r(T)$, but we can worry about that later.
To calculate the Fourier coefficients, you need to integrate h:
$$
\\a_{0}=\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))\mathrm{d}\theta{}
$$
$$
a_{k}=\frac{1}{\pi{}}{\int{}}_{0}^{2\pi{}}h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))\text{ cos } (k \theta{})\mathrm{d}\theta{}, k\geq 1
$$
$$
b_{k}=\frac{1}{\pi{}}{\int{}}_{0}^{2\pi{}}h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))\text{ sin } (k \theta{})\mathrm{d}\theta{}, k\geq 1
$$
This looks horrendous, but in fact when we look at a concrete example it will all become clear.
Now looking at the right hand side again we have:
$$
\\2 r'\text{ sin }(\theta{})+2r \phi{}'\text{ cos }(\theta{})-\underset{k=0}{\overset{\infty{}}{\sum{}}}a_{k}\text{ cos }(k \theta{})-\underset{k=1}{\overset{\infty{}}{\sum{}}}b_{k}\text{ sin }(k \theta{})
$$
The only contribution proportional to $\text{ sin }(\theta{}), \text{ cos }(\theta{})$ (see below regarding why we don’t care about the higher order $\text{ sin }(k \theta{}) \text{ and cos }(k \theta{})$) is:
$$
\\2 r'\text{ sin }(\theta{})+2r \phi{}'\text{ cos }(\theta{})-a_{1}\text{ cos }(\theta{})-b_{1}\text{ sin }(\theta{})=\text{ sin }(\theta{})(2r'-b_{1})+\text{ cos }(\theta{})(2r \phi{}'-a_{1})
$$
which must vanish, so we must have
$$
\\r'=\frac{b_{1}}{2}
$$
$$
r \phi{}'=\frac{a_{1}}{2}
$$
Which says that:
$$
\\r'=\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))\text{ sin } (\theta{})\mathrm{d}\theta{}
$$
$$
r \phi{}'=\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))\text{ cos } (\theta{})\mathrm{d}\theta{}
$$
which is enough information to give us our unknown functions which can then be plugged back into
$$
x_{0}(\tau{},T)=r(T)\text{ cos }(\tau{}+\phi{}(T))
$$
Let’s try this for the Van der Pol oscillator:
$$
\ddot{x}+\epsilon{} (x^{2}-1)\dot{x} +x=0
$$
this means that $h(x,\dot{x} )=(x^{2}-1)\dot{x} $and therefore
$$
h(r \text{ cos }(\theta{}),-r \text{ sin }(\theta{}))=(r^{2}{\text{ cos }}^{2}\theta{}-1)(-r \text{ sin } \theta{})
$$
So plugging this into the above:
$$
\\r'=\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}(r^{2}{\text{ cos }}^{2}\theta{}-1)(-r \text{ sin } \theta{})\text{ sin } (\theta{})\mathrm{d}\theta{}
$$
$$
r \phi{}'=\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}(r^{2}{\text{ cos }}^{2}\theta{}-1)(-r \text{ sin } \theta{})\text{ cos } (\theta{})\mathrm{d}\theta{}
$$
Taking the first of these we can write the integral as:
$$
\\\frac{r}{2\pi{}}{\int{}}_{0}^{2\pi{}}{\text{ sin }}^{2}\theta{}\mathrm{d}\theta{}-\frac{r^{3}}{2\pi{}}{\int{}}_{0}^{2\pi{}}{\text{ cos }}^{2}\theta{} {\text{ sin }}^{2}\theta{}\mathrm{d}\theta{}
$$
These integrals of the form:
$$
\\\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}f(\theta{})\mathrm{d}\theta{}
$$
Are the average of $f(\theta{}) \text{ over } $one wavelength which gives:
$$
\\\frac{r}{2}-\frac{r^{3}}{8}
$$
So we have
$$
\\r'=\frac{r}{2}-\frac{r^{3}}{8}
$$
Remember that $r=r(T)$. We can integrate this to get:
$$
\\r=\frac{\sqrt{k}2 e^{T/2}}{\sqrt{k e^{T}+1}}
$$
and for the second equation we have:
$$
r \phi{}'=\frac{1}{2\pi{}}{\int{}}_{0}^{2\pi{}}(r^{2}{\text{ cos }}^{2}\theta{}-1)(-r \text{ sin } \theta{})\text{ cos } (\theta{})\mathrm{d}\theta{}=0, \text{ which implies } \text{ that } \phi{}=\text{ constant }.
$$
with initial condition $x(0)=1, x'(0)=0$, we have, for the first of these:
$$
x_{0}(0,0)=r(0)\text{ cos }(0+\phi{}(0))=1
$$
and for the second
$$
(\frac{\partial{}}{\partial{} \tau{}})(r(T)\text{ cos }(\tau{}+\phi{}(T)))|_{\tau{}=0,T=0}=r(0)\text{ sin }(0+\phi{}(0))=0
$$
so squaring each of these equations and adding them gives us:
$$
{r(0)}^{2}{\text{ cos }}^{2}(\phi{}(0))+{r(0)}^{2}{\text{ sin }}^{2}(\phi{}(0))=1
$$
meaning that
$$
r(0)=1
$$
taking the positive root. This fixes:
$$
\\r=\frac{2 }{\sqrt{1+3e^{-T}}}
$$
and finally
$$
\text{ cos }(\phi{}(0))=1
$$
$$
\phi{}(0)=0
$$
which because we know that φ is constant, means that it’s identically zero. Now, the overall solution is:
$$
x_{0}(\tau{},T)=\frac{2 }{\sqrt{1+3e^{-T}}}\text{ cos }(\tau{})
$$
and so:
$$
x(\tau{},T)=\frac{2 }{\sqrt{1+3e^{-T}}}\text{ cos }(\tau{})+O(\epsilon{})
$$
converting back into t and ε we have:
$$
x(t)=\frac{2 }{\sqrt{1+3e^{-t \epsilon{}}}}\text{ cos }(t)+O(\epsilon{})
$$
One thing that you might be a bit confused about is why we don ’t care about having contributions of $\text{ sin and } \text{ cos }(k \theta{}) \text{ for } k>1$ on the right hand side.
The point is that if we have a system of the form
$$
\ddot{x} +x=\text{ cos }(t)
$$
then the period of the system
$$
\ddot{x} +x=0
$$
is the same as the period of the system $\text{ cos }(t). $So the two will synch up and you will get exponential growth on timescales of O(1). Imagine having a swing which swings every second, and then push on that in synch with it. You will always be adding to the oscillations and the swing will quickly diverge from any small oscillation you may have started with.
On the other hand if you force it with twice the frequency, then half the time you will be pushing in the direction that it’s going, and half the time you will be pushing it against its motion. Looking at plots of
$$
\ddot{x} +x=\text{ cos }(t) \text{ and }   \ddot{x} +x=\text{ cos }(2t)
$$
we see:
![Figure 4](/images/part26/output_004.png)
where the blue line is being driven at the natural frequency of the system, and the red line is being driven at twice the natural frequency and is thus only perturbed slightly away from the natural rhythm (in green).
**How could we have known from the start that**$ \epsilon{} t \text{ was } $**the right combination?**
Could we have known that the right second time quantity was $\epsilon{} t$? Let’s look again at the original equation:
$$
\ddot{x}+x+2\epsilon{} \dot{x} =0
$$
Let’s write it out like:
$$
\frac{d^{2}x}{d t^{2}}+x+2\epsilon{} \frac{dx}{\text{ dt }}=0
$$
If we let $\epsilon{} t=T$ and $\tau{}=t$, then we can get rid of the ε completely by writing:
$$
\frac{d^{2}x}{d {\tau{}}^{2}}+x+2 \frac{dx}{\text{ dT }}=0
$$
This is how we could see from the start that $\epsilon{} t$ would be the right second time variable.