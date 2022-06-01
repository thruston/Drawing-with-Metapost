\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
secondarydef a through b = 
    begingroup; save d; numeric d; d = abs(a-b); (1+12/d)[b,a]--(1+12/d)[a,b] endgroup
enddef;
beginfig(1);
path ellipse; ellipse = fullcircle scaled 300 yscaled 5/8 rotated 13;
z0 = 1/2[point 4 of ellipse, point 0 of ellipse];
numeric a, b, e; 
2a = abs (point 4 of ellipse - point 0 of ellipse);
2b = abs (point 6 of ellipse - point 2 of ellipse);
e = 1 +-+ b/a;
z1 = e[z0, point 0 of ellipse];
z2 = e[z0, point 4 of ellipse];
z3 = 240 dir 25;
path pp, qq;
pp = fullcircle scaled 2 abs (z1 - z3) shifted z3;
qq = fullcircle scaled 4a shifted z2;
z4 = pp intersectionpoint qq;
z5 = reverse pp intersectionpoint qq;
numeric t, u;
(t, whatever) = ellipse intersectiontimes (z2 -- z4);
(u, whatever) = ellipse intersectiontimes (z2 -- z5);

vardef f(expr x) = 
    angle (z3 - point x of ellipse) + 90 > angle direction x of ellipse
enddef;
drawarrow z3 -- point solve f(0, t) of ellipse withcolor 2/3 blue;

drawoptions(dashed evenly withcolor 7/8);
draw point 0 of ellipse through point 4 of ellipse;
draw point 2 of ellipse through point 6 of ellipse;
drawoptions(withcolor 3/4);
draw z4 -- z1 -- z5;
draw z2 -- z4 -- z3 -- z5 -- cycle;
draw point t of ellipse -- z1 -- point u of ellipse;
drawoptions();
draw point t of ellipse -- z3 -- point u of ellipse withcolor 2/3 red;
dotlabel.llft("$F_1$", z1); dotlabel.llft("$F_2$", z2);
dotlabel.urt("$A$", z3);
dotlabel.ulft("$P$", z4); dotlabel.lrt ("$Q$", z5);
dotlabel.ulft("$T$", point t of ellipse);
dotlabel.lrt("$T'$", point u of ellipse);
draw ellipse;
picture P; P = currentpicture; currentpicture := nullpicture;
draw pp dashed withdots scaled 1/2;
draw qq dashed withdots scaled 1/2;
bboxmargin := 24; clip currentpicture to bbox P;
draw P;
endfig;
\end{mplibcode}
\end{document}

