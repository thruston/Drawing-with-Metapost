\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input tangent-times

beginfig(1);
path C; pair p; numeric a, b;
C = fullcircle scaled 100;
p = 189 right rotated 30;
(a, b) = tangent_times(C, p);

draw C withpen pencircle scaled 2 withcolor 3/4[(.2, .2, .7), white];
draw p -- subpath (a, b) of C -- cycle dashed evenly;
label.llft("$C$", point 5 of C);
dotlabel.urt("$p$", p);
dotlabel.ulft("point $a$ of $C$", point a of C);
dotlabel.lrt("point $b$ of $C$", point b of C);

endfig;
\end{mplibcode}
\end{document}

