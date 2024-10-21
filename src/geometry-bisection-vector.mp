\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\vbox{\openup 1pt \halign to 4in{#\cr
\mpexternal[firstline=21,lastline=24]{geometry-bisection.mp}
\cr\kern 64pt
\begin{mplibcode}
input geometry-bisection
beginfig(1);
z0 = vector_bisector(A,B,C,50);
drawarrow B--A  cutafter fullcircle scaled 5 shifted A;
drawarrow B--C  cutafter fullcircle scaled 5 shifted C;
drawarrow B--z0 cutafter fullcircle scaled 5 shifted z0 
withcolor .67 red;
dotlabel.top(btex $A$ etex, A);
dotlabel.lft(btex $B$ etex, B);
dotlabel.lrt(btex $C$ etex, C);
dotlabel.lrt(btex $E$ etex, z0);
undraw bbox currentpicture;
endfig;
\end{mplibcode}
\cr}}
\end{document}
