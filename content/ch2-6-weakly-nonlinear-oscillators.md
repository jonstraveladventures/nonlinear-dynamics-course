---
title: "MAM2046W - Second year nonlinear dynamics"
weight: 26
math: true
---
# MAM2046W - Second year nonlinear dynamics
## Section 2.6: Weakly nonlinear oscillators
Not the Van der Pol oscillator again, I hear you cry!! Yep, I ’m afraid so...but this time in a different limit. Not the limit of very strong nonlinearities, but the opposite limit, where it ’s very close to linear:
$$
\overset{\bullet{} \bullet{}}{x}+\Epsilon{} (x^{2}-1)\dot{x} +x=0
$$
where now Ε is going to be treated as a small value.
In fact we are going to be studying more general systems than this. We are going to me looking at systems of the form
$$
\overset{\bullet{} \bullet{}}{x}+x+\Epsilon{} h(x,\dot{x} )=0
$$
where $h(x,\dot{x} )$ is some smooth function, and $0<=\Epsilon{}<<1$.
We’re going to ask, in the same way that we did when this term was very large, what can we learn about such a system with this approximation?
In fact the answer seems kind of obvious...I hope. For the Van der Pol oscillator, if we treat the term proportional to Ε as being small, and we start at some small value of $x, \text{ then we } \text{ are going } $to be approximately moving according to
$$
\overset{\bullet{} \bullet{}}{x}=-x
$$
which gives circular motion, but we will have a term of the form:
$$
\overset{\bullet{} \bullet{}}{x}=-x-\Epsilon{} (\text{ small and } \text{ negative })\dot{x}
$$
which says that we will have an additional contribution of the acceleration in the direction of motion, which drives us slightly out from circular motion. As we get closer and closer to $x=1, \text{ this small } \text{ additional term } \text{ becomes }$ even smaller, and so we get a better and better approximation to
$$
\overset{\bullet{} \bullet{}}{x}=-x
$$
as we approach $x=1$. For Ε=0.1, we have:
![Figure 1](/images/part26/output_001.png)
We’ve gone from the complicated motion of the Van Der Pol oscillator, to a pretty simple version which is more or less circular motion with a slight movement out for $x<1$ and a slight movement in for $x>1$.
The same thing happens with the so-called Duffing equation, given by:
$$
\overset{\bullet{} \bullet{}}{x}+\Delta{} \dot{x}+\Alpha{} x+\Beta{} x^{3}=\Gamma{} \text{ cos }(\Omega{} t)
$$
This is of course a three dimensional system, but taking $\Alpha{}=1, \Delta{}=\Gamma{}=0$, we have:
$$
\overset{\bullet{} \bullet{}}{x}+x+\Beta{} x^{3}=0
$$
which for $\Beta{}=0.1 \text{ on the } \text{ left and } \Beta{}=2 \text{ on the } \text{ right }$ look like:
![Figure 2](/images/part26/output_002.png)
The Duffing equation is itself very interesting, and we may discuss it more later.
**Exercise**: By taking the Duffing equation and multiplying by $\dot{x}$, and integrating, find a conserved quantity. Given that there is a fixed point at $(x,\dot{x})=(0,0)$, what does this tell you? Plot the energy surface.
Anyway, we’re going on tangents here, let’s get back to business...
As you get back to business, make sure that you have a pen and a pad of paper with you. Write all of what follows down and make sure that you can understand every step of the mathematics!
So, given an equation of the form:
$$
\overset{\bullet{} \bullet{}}{x}+x+\Epsilon{} h(x,\dot{x} )=0
$$
You might think that you could perform a perturbative analysis. This is often the case when you have a small parameter in the system. You set up the solution as a series expansion in the small parameter, plug in the series to the equation and solve order by order. Seems not implausible, so let ’s give it a go.
Let’s look at the particular example:
$$
\overset{\bullet{} \bullet{}}{x}+x+2\Epsilon{} \dot{x} =0
$$
A series solution would look like:
$$
x(t)=x_{0}(t)+\Epsilon{} x_{1}(t)+{\Epsilon{}}^{2}x_{2}(t)+...
$$
Sometimes you will see the left hand side written as $x(t,\Epsilon{}), \text{ but we } $will miss out the Ε here. Let’s see if we can find these different $x_{k}(t)$ for a given initial condition:
$$
x(0)=0, \dot{x}(0)=1
$$
This also means that we can set $x_{0}(0)=0, x_{0}'(0)=1$ and all other $x_{k}(0), x_{k}'(0)=0$. Why? Because the Ε should not affect the first order term, so it can’t be Ε dependent, therefore it must give us the initial condition. Note that we’re using ‘ rather than dots here for the time derivative. It’s just a notation convention, but you can use either.
Actually, the equation can be solved exactly to get:
But here we want to presume that we don’t know the analytical solution and find an approximation. Plugging in our perturbative solution to the equation we get:
$$
\frac{d^{2}}{d t^{2}}(x_{0}(t)+\Epsilon{} x_{1}(t)+{\Epsilon{}}^{2}x_{2}(t)+...)+(x_{0}(t)+\Epsilon{} x_{1}(t)+{\Epsilon{}}^{2}x_{2}(t)+...)+2\Epsilon{} \frac{d}{d t}(x_{0}(t)+\Epsilon{} x_{1}(t)+{\Epsilon{}}^{2}x_{2}(t)+...)=0
$$
The idea at this point is that you collect together terms at each order in $\Epsilon{}$:
$$
(x_{0}''(t)+x_{0}(t))+\Epsilon{} (x_{1}''(t)+x_{1}(t)+2x_{0}'(t))+{\Epsilon{}}^{2}(x_{2}''(t)+x_{2}(t)+2x_{1}'(t))+O({\Epsilon{}}^{3})=0
$$
ok, so now we state that because the $x_{k}(t)$ solutions themselves don’t depend on Ε, we should be able to solve order by order:
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
But now we have a problem. We have said that $\Epsilon{}$ is small, but in fact what we really need is that $\Epsilon{} x_{1}(t) \text{ is small } \text{ compared }$ to $x_{0}(t)$, but now we have this $t \text{ term }$, so for large times, this second term is clearly not going to be smaller than the first term. In fact the second term is going to start to dominate when
$$
t \Epsilon{}\gtrsim{}1
$$
because just going up to this second term our series expansion now looks like:
$$
x(t)=\text{ sin }(t)-\Epsilon{} t \text{ sin }(t)+{\Epsilon{}}^{2}x_{2}(t)+...
$$
So perhaps we can trust this series solution for small times, but not for times greater than of order $\frac{1}{\Epsilon{}}.$
Plotting the true solution, and the first two terms of the series solution we see the following, for $\Epsilon{}=0.1:$
![Figure 3](/images/part26/output_003.png)
Where the red is the true solution, and the blue is the series solution, which is a reasonable approximation up to around t=4, and then after that it diverges a lot.
In fact we see that while the fast oscillations seem to be in ‘rhythm’ between the two functions, over the longer timescale, the true solution exponentially converges, whereas the series solution diverges.
We say that the short timescale behaviours (the oscillations) agree, but the longer timescale behaviours disagree. The reason for this is quite simple. If we take the true solution, it is given by:
$$
x(t)=e^{-\Epsilon{} t }\frac{\text{ sin }(\sqrt{1-{\Epsilon{}}^{2}}t)}{\sqrt{1-{\Epsilon{}}^{2}}}
$$
There is a fast timescale behaviour given by the sinusoidal motion, and there’s an exponential decay dominated by $e^{-t \Epsilon{}}$. We can say that the fast timescale is O(1), and the slow timescale is O(1/Ε).
On the other hand, the timescale of the incorrect blowup is O(1).
If we perform a series expansion of this last part it is given by:
$$
e^{-\Epsilon{} t }=1-\Epsilon{} t+\frac{{(\Epsilon{} t)}^{2}}{2}-...
$$
we know that this is exact, for arbitrary $\Epsilon{} t$, but if $\Epsilon{} t$ is large, then you need to take a very large number of terms. This is the issue that has arisen. We stopped at the second term...and that wasn ’t unreasonable, as we wanted to do this for small Ε...but it’s not the size of Ε that is important, it’s the size of Ε $t$.
What we see here is a general phenomenon. For any weakly nonlinear oscillator, we are going to have a timescale given by the purely linear approximation, then we’re going to have another timescale dictated by $\frac{1}{\Epsilon{}}.$
So can we still use a perturbative method? It turns out that we can, but we have to do a bit of a change of variables.
Pause: We have mentioned timescales a bunch of times here, but what do we really mean. Well, it all feels a bit vague and hand-wavey, but what we really mean are the characteristic time over which there is a substantial change in some aspect of a system (an oscillator, a phase, an amplitude). If you have a periodic function of the form $f(t)=\text{ sin }(t)$, and let’s say that $t $is measured in seconds, then if you look at your system at time $t=0$ and time $t=0.01$, then your system isn’t going to have changed much. By timescale here we really mean, over what minimum order of magnitude of time will we see a noticeable change. There are lots of vague notions in here. What do we mean by “noticeable change ”? Also, what do we mean by order of magnitude. We really mean here not that we care about whether it’s 1 second, or 1.1 seconds, but whether it’s 1 second, or 0.1 seconds, or 10 seconds, etc. And in this case, because the frequency is $\frac{1}{2\Pi{}}$, we can say that the timescale over which things change substantially is on the order of 1 second. After 1 second, you’ve completed 1/2Π of the whole oscillation. After $\frac{4}{2\Pi{}} \text{ seconds you }'\text{ ve gone } \text{ from } 0$ to the maximum of the oscillation, so this is a reasonable measure for the characteristic timescale.
For the exponential part, we are really again asking over which time period are you seeing a substantial change, and here after time of order 1/Ε, the term $e^{\Epsilon{} t}$ has changed by a factor of $e$. Of course we could say that it had already changed a reasonable amount after $\frac{1}{2\Epsilon{}}$but we are just interested in the order of magnitude, and so we just care about the relative difference in timescales. One is of order 1 and one is of order $\frac{1}{\Epsilon{}}.$
Such ideas come up in dynamical systems in the real world a lot. For instance, in the brain, there are multiple timescales:
Neurons fire over timescales of $O({10}^{-3}s)$
Sensory processing and short term memory occur over timescales of $O({10}^{0}-{10}^{2}s)$
Long-term potentiation and learning occur over timescales of $O({10}^{1}-{10}^{4}s)$
Long-term memory and synaptic pruning occur over timescales of $O({10}^{3}-{10}^{6}s)$
Neuroplasticity and aging occur over timescales of $O({10}^{5}-{10}^{8}s)$
These numbers are all up for debate, and you’ll find other figures floating around, but you get the general idea. The dynamics of such a system is very complex and there is dynamics happening at the millisecond, second, minute, hour, day, month, year timescale. They also overlap, which makes modelling such processes really hard, as you can’t really deal with any one of them alone.
OK, on to the problem at hand.
The solution depends on two timescales, which we will treat as independent variables. We let $\Tau{}=t$ be the fast time, and $T=\Epsilon{} t $be the slow time. Now we set up our series expansion as before but now with;
$$
x(t)=x_{0}(\Tau{},T)+\Epsilon{} x_{1}(\Tau{},T)+{\Epsilon{}}^{2}x_{2}(\Tau{},T)+...
$$
Now the total derivative in t gives us:
$$
\frac{d}{d t}=\frac{\partial{}}{\partial{} \Tau{}}+\frac{\partial{} T}{\partial{} t}\frac{\partial{}}{\partial{} T}=\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T}
$$
Plugging the series expansion into the equation using the new variables gives:
$$
(\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T})(\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T})(x_{0}(\Tau{},T)+\Epsilon{} x_{1}(\Tau{},T)+{\Epsilon{}}^{2}x_{2}(\Tau{},T))+(x_{0}(\Tau{},T)+\Epsilon{} x_{1}(\Tau{},T)+{\Epsilon{}}^{2}x_{2}(\Tau{},T))+2\Epsilon{} (\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T})(x_{0}(\Tau{},T)+\Epsilon{} x_{1}(\Tau{},T)+{\Epsilon{}}^{2}x_{2}(\Tau{},T))=0
$$
Taking the zeroth order terms we have:
$$
\frac{{\partial{}}^{2}}{\partial{} {\Tau{}}^{2}}x_{0}(\Tau{},T)+x_{0}(\Tau{},T)=0
$$
Which has solutions
$$
x_{0}(\Tau{},T)=A(T)\text{ cos }(\Tau{})+B(T) \text{ sin }(\Tau{})
$$
Where the functions $A \text{ and } B $are not fixed. This sounds kind of ridiculous! But actually if we now go to the next order in Ε, we have the equation:
$$
\frac{{\partial{}}^{2}}{\partial{} {\Tau{}}^{2}}x_{1}(\Tau{},T)+2\frac{\partial{}}{\partial{} T}\frac{\partial{}}{\partial{} \Tau{}}x_{0}(\Tau{},T)+ x_{1}(\Tau{},T)+2\frac{\partial{}}{\partial{} \Tau{}}x_{0}(\Tau{},T)=0
$$
and now we can plug our solution above in to get:
$$
\frac{{\partial{}}^{2}}{\partial{} {\Tau{}}^{2}}x_{1}(\Tau{},T)+2\frac{\partial{}}{\partial{} T}\frac{\partial{}}{\partial{} \Tau{}}(A(T)\text{ cos }(\Tau{})+B(T) \text{ sin }(\Tau{}))+ x_{1}(\Tau{},T)+2\frac{\partial{}}{\partial{} \Tau{}}(A(T)\text{ cos }(\Tau{})+B(T) \text{ sin }(\Tau{}))=0
$$
$$
\frac{{\partial{}}^{2}}{\partial{} {\Tau{}}^{2}}x_{1}(\Tau{},T)+2(-A'(T)\text{ sin }(\Tau{})+B'(T) \text{ cos }(\Tau{}))+ x_{1}(\Tau{},T)+2(-A(T)\text{ sin }(\Tau{})+B(T) \text{ cos }(\Tau{}))=0
$$
which we can rewrite as:
$$
\frac{{\partial{}}^{2}}{\partial{} {\Tau{}}^{2}}x_{1}(\Tau{},T)+ x_{1}(\Tau{},T)=-2\text{ sin }(\Tau{})(A(T)+A'(T))+2\text{ cos }(\Tau{})(B(T)+B'(T))
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
so our $x_{0}(\Tau{},T) $solution is:
$$
x_{0}(\Tau{},T)=A_{0}e^{-T}\text{ cos }(\Tau{})+B_{0}e^{-T} \text{ sin }(\Tau{})
$$
Why did we say that there can't be a resonant driving force? This is a bit subtle. If there was a driving force with timescale Τ, we would end up with something where the Τ would be not just the short-term time-scale but also the long-term timescale, which we know can’t be the case. The long-term dynamics is driven by T, not Τ, so we can ’t have a driving force which makes the system explode on short time-scales.
We have to be a little careful to find our constant to match the initial conditions. Our initial conditions are:
$$
x(0)=0, \dot{x}(0)=1
$$
The first of these says that:
$$
x_{0}(0,0)+\Epsilon{} x_{1}(0,0)+{\Epsilon{}}^{2}x_{2}(0,0)+...=0
$$
We want to solve this for general small Ε, which means that we must have
$$
x_{0}(0,0)=0
$$
For the second condition, we have to be a bit careful and write
$$
\dot{x}(0)=(\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T})(x_{0}(\Tau{},T)+\Epsilon{} x_{1}(\Tau{},T)+{\Epsilon{}}^{2}x_{2}(\Tau{},T)+...)|_{\Tau{}=0,T=0}=1
$$
which has zeroth order term:
$$
(\frac{\partial{}}{\partial{} \Tau{}})(x_{0}(\Tau{},T))|_{\Tau{}=0,T=0}=1
$$
The reason we had to be careful here was because now there are two time-variables, so we have to be sure of what the derivative condition is with respect to.
Applying these two conditions gives:
$$
x_{0}(0,0)=A_{0}e^{-0}\text{ cos }(0)+B_{0}e^{-0} \text{ sin }(0)=A_{0}=0
$$
$$
(\frac{\partial{}}{\partial{} \Tau{}})(x_{0}(\Tau{},T))|_{\Tau{}=0,T=0}=-A_{0}e^{-T}\text{ sin }(\Tau{})+B_{0}e^{-T} \text{ cos }(\Tau{})|_{\Tau{}=0,T=0}=B_{0}e^{-0} \text{ cos }(0)=B_{0}=1
$$
So $A_{0}=0$, $B_{0}=1$ and we have
$$
x_{0}(\Tau{},T)=e^{-T} \text{ sin }(\Tau{})=e^{-t \Epsilon{} }\text{ sin }(t)
$$
This is a very good approximation to the true solution, but doesn ’t take into account a THIRD timescale which is related to the $\sqrt{1-{\Epsilon{}}^{2}} \text{ term }$...but that can be left for another day...
Actually, let’s just think about the corrections. We know that the true answer is:
$$
x(t)=e^{-\Epsilon{} t }\frac{\text{ sin }(\sqrt{1-{\Epsilon{}}^{2}}t)}{\sqrt{1-{\Epsilon{}}^{2}}}
$$
Let’s expand the non-exponential term in Ε to see where we are going wrong:
$$
x(t)=e^{-\Epsilon{} t }(\text{ sin }(t)+\frac{1}{2} (-t \text{ cos }(t)+\text{ sin }(t)) {\Epsilon{}}^{2})
$$
So we see that the error is:
$$
\text{ error }(t)=\frac{e^{-\Epsilon{} t }}{2}(\text{ sin }(t)-t \text{ cos }(t)){\Epsilon{}}^{2}
$$
Which is of order $1/{\Epsilon{}}^{2}$.
Exercise: Now do the same thing with the Van der Pol oscillator.
In general...
Can we now come up with some methods based on the above “two-timing” method that work for general weakly nonlinear oscillations? Let’s see...
We are looking at:
$$
\overset{\bullet{} \bullet{}}{x}+x+\Epsilon{} h(x,\dot{x} )=0
$$
and again we will define $\Tau{}=t, T=t \Epsilon{}, \text{ which }$ gives us:
$$
(\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T})(\frac{\partial{}}{\partial{} \Tau{}}+\Epsilon{}\frac{\partial{}}{\partial{} T})x(\Tau{},T)+x(\Tau{},T)+\Epsilon{} h(x,\dot{x} ) =0
$$
which we can write more compactly as:
$$
({\partial{}}_{\Tau{}\Tau{}}+2\Epsilon{} {\partial{}}_{\Tau{} T}+{\Epsilon{}}^{2}{\partial{}}_{TT})x+x+\Epsilon{} h =0
$$
subbing in the series expansion
$$
x(t)=x_{0}(\Tau{},T)+\Epsilon{} x_{1}(\Tau{},T)+{\Epsilon{}}^{2}x_{2}(\Tau{},T)+...
$$
again we take order by order to give:
$$
\\{\partial{}}_{\Tau{}\Tau{}}x_{1}(\Tau{},T)+x_{1}(\Tau{},T)=-2 {\partial{}}_{\Tau{} T}x_{0}(\Tau{},T)-h
$$
where remember $h=h(x, \dot{x} )=h(x(\Tau{}, T),({\partial{}}_{\Tau{}}+\Epsilon{} {\partial{}}_{T}) x(\Tau{}, T))$ which to zeroth order in Ε is $h(x_{0}(\Tau{},T),{\partial{}}_{\Tau{}}x_{0}(\Tau{},T))$. So we have
$$
\\{\partial{}}_{\Tau{}\Tau{}}x_{1}(\Tau{},T)+x_{1}(\Tau{},T)=-2 {\partial{}}_{\Tau{} T}x_{0}-h(x_{0}(\Tau{},T),{\partial{}}_{\Tau{}}x_{0}(\Tau{},T))
$$
we can write the solution to the first equation as the sin+cos combination, or we can write it as
$$
x_{0}(\Tau{},T)=r(T)\text{ cos }(\Tau{}+\Phi{}(T))
$$
(show that they are equivalent)
plugging this into the second equation we have:
$$
\\{\partial{}}_{\Tau{}\Tau{}}x_{1}(\Tau{},T)+x_{1}(\Tau{},T)=-2 {\partial{}}_{\Tau{} T}r(T)\text{ cos }(\Tau{}+\Phi{}(T))-h(r(T)\text{ cos }(\Tau{}+\Phi{}(T)),{\partial{}}_{\Tau{}}r(T)\text{ cos }(\Tau{}+\Phi{}(T)))
$$
which is:
$$
\\{\partial{}}_{\Tau{}\Tau{}}x_{1}(\Tau{},T)+x_{1}(\Tau{},T)=2 (r'(T)\text{ sin }(\Tau{}+\Phi{}(T))+r(T)\Phi{}'(T)\text{ cos }(\Tau{}+\Phi{}(T)))-h(r(T)\text{ cos }(\Tau{}+\Phi{}(T)),-r(T)\text{ sin }(\Tau{}+\Phi{}(T)))
$$
We don’t want any driving terms on the right hand side, so there can’t be any terms proportional to sin(Τ+Φ(T)) or cos(Τ+Φ(T)).
For the first two terms that seems pretty easy...but for the h term...how do we pull out the terms proportional to sin and cos? Let’s just simplify notation a little bit here first. We’ll remember all the functional dependencies and write the right hand side as:
$$
\\2 (r'\text{ sin }(\Tau{}+\Phi{})+r \Phi{}'\text{ cos }(\Tau{}+\Phi{}))-h(r \text{ cos }(\Tau{}+\Phi{} ),-r \text{ sin }(\Tau{}+\Phi{} ))
$$
and in fact we can also let Τ+Φ = Θ to give
$$
\\2 r'\text{ sin }(\Theta{})+2r \Phi{}'\text{ cos }(\Theta{})-h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))
$$
So $h \text{ is } a \text{ periodic } $function of Θ...now we get our Fourier hats on, because we know that a function which is periodic in Θ can be written as:
$$
\\h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))=\underset{k=0}{\overset{\infty{}}{\sum{}}}a_{k}\text{ cos }(k \Theta{})+\underset{k=1}{\overset{\infty{}}{\sum{}}}b_{k}\text{ sin }(k \Theta{})
$$
where the $b_{0} \text{ term }$ doesn’t appear as sin(0)=0. Here the $a_{k} \text{ and } b_{k} \text{ will be } \text{ functions of } r(T)$, but we can worry about that later.
To calculate the Fourier coefficients, you need to integrate h:
$$
\\a_{0}=\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))\mathrm{d}\Theta{}
$$
$$
a_{k}=\frac{1}{\Pi{}}{\int{}}_{0}^{2\Pi{}}h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))\text{ cos } (k \Theta{})\mathrm{d}\Theta{}, k>=1
$$
$$
b_{k}=\frac{1}{\Pi{}}{\int{}}_{0}^{2\Pi{}}h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))\text{ sin } (k \Theta{})\mathrm{d}\Theta{}, k>=1
$$
This looks horrendous, but in fact when we look at a concrete example it will all become clear.
Now looking at the right hand side again we have:
$$
\\2 r'\text{ sin }(\Theta{})+2r \Phi{}'\text{ cos }(\Theta{})-\underset{k=0}{\overset{\infty{}}{\sum{}}}a_{k}\text{ cos }(k \Theta{})-\underset{k=1}{\overset{\infty{}}{\sum{}}}b_{k}\text{ sin }(k \Theta{})
$$
The only contribution proportional to $\text{ sin }(\Theta{}), \text{ cos }(\Theta{})$ (see below regarding why we don’t care about the higher order $\text{ sin }(k \Theta{}) \text{ and cos }(k \Theta{})$) is:
$$
\\2 r'\text{ sin }(\Theta{})+2r \Phi{}'\text{ cos }(\Theta{})-a_{1}\text{ cos }(\Theta{})-b_{1}\text{ sin }(\Theta{})=\text{ sin }(\Theta{})(2r'-b_{1})+\text{ cos }(\Theta{})(2r \Phi{}'-a_{1})
$$
which must vanish, so we must have
$$
\\r'=\frac{b_{1}}{2}
$$
$$
r \Phi{}'=\frac{a_{1}}{2}
$$
Which says that:
$$
\\r'=\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))\text{ sin } (\Theta{})\mathrm{d}\Theta{}
$$
$$
r \Phi{}'=\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))\text{ cos } (\Theta{})\mathrm{d}\Theta{}
$$
which is enough information to give us our unknown functions which can then be plugged back into
$$
x_{0}(\Tau{},T)=r(T)\text{ cos }(\Tau{}+\Phi{}(T))
$$
Let’s try this for the Van der Pol oscillator:
$$
\overset{\bullet{} \bullet{}}{x}+\Epsilon{} (x^{2}-1)\dot{x} +x=0
$$
this means that $h(x,\dot{x} )=(x^{2}-1)\dot{x} $and therefore
$$
h(r \text{ cos }(\Theta{}),-r \text{ sin }(\Theta{}))=(r^{2}{\text{ cos }}^{2}\Theta{}-1)(-r \text{ sin } \Theta{})
$$
So plugging this into the above:
$$
\\r'=\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}(r^{2}{\text{ cos }}^{2}\Theta{}-1)(-r \text{ sin } \Theta{})\text{ sin } (\Theta{})\mathrm{d}\Theta{}
$$
$$
r \Phi{}'=\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}(r^{2}{\text{ cos }}^{2}\Theta{}-1)(-r \text{ sin } \Theta{})\text{ cos } (\Theta{})\mathrm{d}\Theta{}
$$
Taking the first of these we can write the integral as:
$$
\\\frac{r}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}{\text{ sin }}^{2}\Theta{}\mathrm{d}\Theta{}-\frac{r^{3}}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}{\text{ cos }}^{2}\Theta{} {\text{ sin }}^{2}\Theta{}\mathrm{d}\Theta{}
$$
These integrals of the form:
$$
\\\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}f(\Theta{})\mathrm{d}\Theta{}
$$
Are the average of $f(\Theta{}) \text{ over } $one wavelength which gives:
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
r \Phi{}'=\frac{1}{2\Pi{}}{\int{}}_{0}^{2\Pi{}}(r^{2}{\text{ cos }}^{2}\Theta{}-1)(-r \text{ sin } \Theta{})\text{ cos } (\Theta{})\mathrm{d}\Theta{}=0, \text{ which implies } \text{ that } \Phi{}=\text{ constant }.
$$
with initial condition $x(0)=1, x'(0)=0$, we have, for the first of these:
$$
x_{0}(0,0)=r(0)\text{ cos }(0+\Phi{}(0))=1
$$
and for the second
$$
(\frac{\partial{}}{\partial{} \Tau{}})(r(T)\text{ cos }(\Tau{}+\Phi{}(T)))|_{\Tau{}=0,T=0}=r(0)\text{ sin }(0+\Phi{}(0))=0
$$
so squaring each of these equations and adding them gives us:
$$
{r(0)}^{2}{\text{ cos }}^{2}(\Phi{}(0))+{r(0)}^{2}{\text{ sin }}^{2}(\Phi{}(0))=1
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
\text{ cos }(\Phi{}(0))=1
$$
$$
\Phi{}(0)=0
$$
which because we know that Φ is constant, means that it’s identically zero. Now, the overall solution is:
$$
x_{0}(\Tau{},T)=\frac{2 }{\sqrt{1+3e^{-T}}}\text{ cos }(\Tau{})
$$
and so:
$$
x(\Tau{},T)=\frac{2 }{\sqrt{1+3e^{-T}}}\text{ cos }(\Tau{})+O(\Epsilon{})
$$
converting back into t and Ε we have:
$$
x(t)=\frac{2 }{\sqrt{1+3e^{-t \Epsilon{}}}}\text{ cos }(t)+O(\Epsilon{})
$$
One thing that you might be a bit confused about is why we don ’t care about having contributions of $\text{ sin and } \text{ cos }(k \Theta{}) \text{ for } k>1$ on the right hand side.
The point is that if we have a system of the form
$$
\overset{\bullet{} \bullet{}}{x} +x=\text{ cos }(t)
$$
then the period of the system
$$
\overset{\bullet{} \bullet{}}{x} +x=0
$$
is the same as the period of the system $\text{ cos }(t). $So the two will synch up and you will get exponential growth on timescales of O(1). Imagine having a swing which swings every second, and then push on that in synch with it. You will always be adding to the oscillations and the swing will quickly diverge from any small oscillation you may have started with.
On the other hand if you force it with twice the frequency, then half the time you will be pushing in the direction that it’s going, and half the time you will be pushing it against its motion. Looking at plots of
$$
\overset{\bullet{} \bullet{}}{x} +x=\text{ cos }(t) \text{ and }   \overset{\bullet{} \bullet{}}{x} +x=\text{ cos }(2t)
$$
we see:
![Figure 4](/images/part26/output_004.png)
where the blue line is being driven at the natural frequency of the system, and the red line is being driven at twice the natural frequency and is thus only perturbed slightly away from the natural rhythm (in green).
**How could we have known from the start that**$ \Epsilon{} t \text{ was } $**the right combination?**
Could we have known that the right second time quantity was $\Epsilon{} t$? Let’s look again at the original equation:
$$
\overset{\bullet{} \bullet{}}{x}+x+2\Epsilon{} \dot{x} =0
$$
Let’s write it out like:
$$
\frac{d^{2}x}{d t^{2}}+x+2\Epsilon{} \frac{dx}{\text{ dt }}=0
$$
If we let $\Epsilon{} t=T$ and $\Tau{}=t$, then we can get rid of the Ε completely by writing:
$$
\frac{d^{2}x}{d {\Tau{}}^{2}}+x+2 \frac{dx}{\text{ dT }}=0
$$
This is how we could see from the start that $\Epsilon{} t$ would be the right second time variable.