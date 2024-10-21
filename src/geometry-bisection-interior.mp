\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\vbox{\openup 1pt \halign to 4in{#\cr
\begin{code}
vardef interior_bisector(expr a,b,c) =
  (1/(1+abs(c-b)/abs(a-b)))[a,c]
enddef;
\end{code}
\cr\kern 64pt
\begin{mplibcode}
input bisection
beginfig(1);
z0 = interior_bisector(A,B,C);
draw A--B--C--cycle;
draw B -- 1.2[B,z0] withcolor .67 red;
dotlabel.top(btex $A$ etex, A);
dotlabel.lft(btex $B$ etex, B);
dotlabel.lrt(btex $C$ etex, C);
draw z0 withpen pencircle scaled dotlabeldiam;
label(btex $E$ etex, z0 + (3,9));
undraw bbox currentpicture;
endfig;
\end{mplibcode}
\cr}}
\end{document}
