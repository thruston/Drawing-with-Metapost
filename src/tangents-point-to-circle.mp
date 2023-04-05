\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path C, C'; pair p, t, t';
C = fullcircle scaled 100;
p = 189 right rotated 30;

C' = fullcircle zscaled p shifted 1/2 p;
% t = C intersectionpoint C';
% t' = reverse C intersectionpoint C';
t  = C intersectionpoint halfcircle zscaled p shifted 1/2 p;
t' = C intersectionpoint halfcircle zscaled -p shifted 1/2 p; 

drawoptions(dashed withdots scaled 1/4 withcolor (.2, .2, .7));
draw C'; draw t -- center C -- p;

drawoptions(withcolor (.2, .2, .7));
dotlabel.lrt("$m$", 1/2 p);
dotlabel.llft("$o$", center C);

drawoptions(dashed evenly);
draw t -- p -- t';

drawoptions();
draw C;
label.llft("$C$", point 5 of C);

dotlabel.urt("$p$", p);
dotlabel.ulft("$t$", t);
dotlabel.bot("\strut $t'$", t');

endfig;
\end{mplibcode}
\end{document}

