\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path C; pair p;
C = fullcircle scaled 100;
p = 189 right rotated 30;

pair o, m, t, t'; o = center C; m = 1/2[o, p];
t  = C intersectionpoint halfcircle zscaled (p-o) shifted m;
t' = C intersectionpoint halfcircle zscaled (o-p) shifted m; 

drawoptions(dashed withdots scaled 1/4 withcolor (.2, .2, .7));
  draw fullcircle zscaled p shifted 1/2 p;
  draw t -- center C -- p;

drawoptions(withcolor (.2, .2, .7));
  dotlabel.lrt("$m$", 1/2 p);
  dotlabel.llft("$o$", center C);

drawoptions(dashed evenly);
  draw t -- p -- t';

drawoptions();

draw C; label.llft("$C$", point 5 of C);
dotlabel.urt("$p$", p);
dotlabel.ulft("$t$", t);
dotlabel.bot("\strut $t'$", t');

endfig;
\end{mplibcode}
\end{document}

