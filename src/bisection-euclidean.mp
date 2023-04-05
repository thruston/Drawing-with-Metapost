\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\vbox{\openup 1pt \halign to 4in{#\cr
\begin{code}
vardef euclidean_bisector(expr a,b,c,r) =
  save arc,p,q,e;
  path arc; pair p,q,e;
  arc = fullcircle scaled r shifted b;
  p = (a--b) intersectionpoint arc;
  q = (b--c) intersectionpoint arc ;
  e = equilateral_triangle_point(p,q);
  e
enddef;
\end{code}
\cr\kern 64pt
\begin{mplibcode}
input bisection
beginfig(1);
z0 = euclidean_bisector(A,B,C,100);
draw B -- 1.2[B,z0] withcolor .67 red;
draw A--B--C;
dotlabel.top(btex $A$ etex, A);
dotlabel.lft(btex $B$ etex, B);
dotlabel.lrt(btex $C$ etex, C);
dotlabel.lrt(btex $E$ etex, z0);
undraw bbox currentpicture;
endfig;
\end{mplibcode}
\cr}}
\end{document}
