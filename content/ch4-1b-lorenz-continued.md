---
title: "Lorenz Equations (Continued)"
weight: 42
math: true
---
## This notebook was almost entirely put together by Christopher Klausmeier of The Departments of Plant Biology & Integrative Biology Michigan State University (https://kl-lab.group/)

```mathematica
Quit[]
```

```mathematica
PacletInstall["EcoEvo","Site"->"http://raw.githubusercontent.com/cklausme/EcoEvo/master"]
```

```
(* Out: *) PacletObject[=FalseTypeset`embedState$$=ReadyDynamicModuleValues:>]
```

```mathematica
SetModel[{
Aux[x]->{Equation:>σ (y-x)},
Aux[y]->{Equation:>ρ x-y-x z},
Aux[z]->{Equation:>x y-β z},
Parameters:>{σ,ρ,β}
}]

σ=10;
ρ=20;
β=8/3;
```

```mathematica
eq=SolveEcoEq[]
```

```
(* Out: *) {{x→0,y→0,z→0},{x→-2 Sqrt[(38)/(3)],y→-2 Sqrt[(38)/(3)],z→19},{x→2 Sqrt[(38)/(3)],y→2 Sqrt[(38)/(3)],z→19}}
```

```mathematica
s=EcoSim[{x->0.1,y->0.25,z->0.1},10];
PlotDynamics[s]
```

![Figure 1](/images/part41b/output_001.png)

```mathematica
ec20=FindEcoCycle[Slice[s,1],Period->0.7,Method->"FindRoot"];
PlotDynamics[ec20]
```

![Figure 2](/images/part41b/output_002.png)

```mathematica
{InitialSlice[ec20],FinalSlice[ec20]}
```

```
(* Out: *) {{x→-1.6434143810404007`,y→-1.7058238981709455`,z→13.079406126679718`},{x→-1.6434143810404007`,y→-1.7058238981709455`,z→13.079406126679718`}}
```

```mathematica
EcoEigenvalues[ec20]
```

```
(* Out: *) {0.3855432733997412`,2.8567592770470945`*^-6,-14.05221281605378`}
```

```mathematica
xyz[Prime][Prime]=xyz[Prime]=FinalSlice[ec20];
per[Prime][Prime]=per[Prime]=FinalTime[ec20];
Clear[ρ];

Monitor[
res=Table[

xyz=RuleListSubtract[RuleListMultiply[xyz[Prime],2],xyz[Prime][Prime]];
per=2per[Prime]-per[Prime][Prime];

ec[ρ]=FindEcoCycle[xyz,Period->per,Method->"FindRoot"];

{xyz[Prime][Prime],per[Prime][Prime]}={xyz[Prime],per[Prime]};
{xyz[Prime],per[Prime]}={FinalSlice[ec[ρ]],FinalTime[ec[ρ]]};

{ρ,xyz[Prime],per[Prime]}
,{ρ,20,14.1,-0.01}];
,ρ]
```

```mathematica
RuleListPlot[{ec[20.0],ec[16.0],ec[14.1]},PlotRange->{{-15,15},{-15,15},{0,30}},AspectRatio->{1,1,1}]
```

![Figure 3](/images/part41b/output_003.png)

```mathematica
PlotDynamics[ec[14.1]]
```

![Figure 4](/images/part41b/output_004.png)

```mathematica
xyz[Prime][Prime]=xyz[Prime]=FinalSlice[ec20];
per[Prime][Prime]=per[Prime]=FinalTime[ec20];
Clear[ρ];

Monitor[
res2=Table[

xyz=RuleListSubtract[RuleListMultiply[xyz[Prime],2],xyz[Prime][Prime]];
per=2per[Prime]-per[Prime][Prime];

ec[ρ]=FindEcoCycle[xyz,Period->per,Method->"FindRoot"];

{xyz[Prime][Prime],per[Prime][Prime]}={xyz[Prime],per[Prime]};
{xyz[Prime],per[Prime]}={FinalSlice[ec[ρ]],FinalTime[ec[ρ]]};

{ρ,xyz[Prime],per[Prime]}
,{ρ,20,24.6,0.01}];
,ρ]
```

```mathematica
plotleft={x[t],y[t],z[t]}/.DeleteCases[ec[#]&/@rvals,ec[_]];
plotright={-x[t],-y[t],z[t]}/.DeleteCases[ec[#]&/@rvals,ec[_]];
```

```mathematica
colors=Flatten[Join[Table[Hue[(#)/(l-4)]&/@Range[l],{n,2}]]];
```

```mathematica
Show[ParametricPlot3D[Evaluate[Join[plotleft,plotright]],{t,0,2.24},PlotRange->All,AspectRatio->1,PlotStyle->Evaluate[{Opacity[0.5],#}&/@colors]],ParametricPlot3D[{#Sqrt[β(r-1)],#Sqrt[β(r-1)],r-1}&/@{1,-1},{r,1,24.6},PlotStyle->{Thick,Blue}]]
```

![Figure 5](/images/part41b/output_005.png)

```mathematica
b=(8)/(3);rspiral[b_,σ_]=Simplify[r/.Solve[((-2-6 b-6 b^2-2 b^3+9 b r+9 b^2 r-6 σ+51 b σ+3 b^2 σ-45 b r σ-6 σ^2+3 b σ^2-2 σ^3)^2+4 (-(1+b+σ)^2+3 (b r+b σ))^3)==0,r][[1]],b>0];
pl1=Show[Plot[0,{r,0,1},PlotStyle->{Black,Thick}],Plot[0,{r,1,30},PlotStyle->{Black,Thick, Dashed}],Plot[{-Sqrt[b(r-1)],Sqrt[b(r-1)]},{r,1,Chop[rspiral[b,σ]]},PlotStyle->{{Red, Thick}}],Plot[{-Sqrt[b(r-1)],Sqrt[b(r-1)]},{r,Chop[rspiral[b,σ]],σ((3+b+σ))/(σ-b-1)},PlotStyle->{{Black, Thick}}],Plot[{-Sqrt[b(r-1)],Sqrt[b(r-1)]},{r,σ((3+b+σ))/(σ-b-1),30},PlotStyle->{{Black, Thick,Dashed}}],Graphics[Text[Style["\!\(\*SuperscriptBox[\(C\), \(\(\\ \)\(+\)\)]\)",20],{15,7}]],Graphics[Text[Style["\!\(\*SuperscriptBox["C", StyleBox[RowBox[{" ",  "-"}],FontSize->10]]\)",20],{15,-5}]],PlotRange->All,AxesLabel->{Style["r",20],Style["x",20]},ImageSize->500];
mx=Interpolation[Partition[Riffle[DeleteCases[{#,ec[#]}&/@rvals,{_,ec[_]}][[;;,1]],Max[#]&/@(plotleft[[;;,1]]/.t->Range[0,2.24,0.01])],2]];
mn=Interpolation[Partition[Riffle[DeleteCases[{#,ec[#]}&/@rvals,{_,ec[_]}][[;;,1]],Min[#]&/@(plotleft[[;;,1]]/.t->Range[0,2.24,0.01])],2]];
Show[pl1,Plot[{mx[r],mn[r],-mx[r],-mn[r]},{r,14.1,24.6},PlotStyle->{{Dashed,Blue}}]]
```

```
(* Out: *) InterpolatingFunction[=FalseTypeset`embedState$$=ReadyDynamicModuleValues:>]
```

```
(* Out: *) InterpolatingFunction[=FalseTypeset`embedState$$=ReadyDynamicModuleValues:>]
```

![Figure 6](/images/part41b/output_006.png)