\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
secondarydef a through b = 
    begingroup; save d; numeric d; d = abs(a-b); (1+12/d)[b,a] -- (1+12/d)[a,b] endgroup
enddef;
beginfig(1);
    path ellipse; ellipse = fullcircle scaled 300 yscaled 5/8 rotated 13;
    numeric a, b, e;
    2a = abs (point 4 of ellipse - point 0 of ellipse);
    2b = abs (point 6 of ellipse - point 2 of ellipse);
    e = 1 +-+ b/a;

    z0 = 1/2[point 0 of ellipse, point 4 of ellipse];
    z1 = e[z0, point 0 of ellipse];
    z2 = e[z0, point 4 of ellipse];

    drawoptions(withcolor 3/4);
    draw point 0 of ellipse through point 4 of ellipse;
    draw point 2 of ellipse through point 6 of ellipse;
    drawoptions(withcolor 1/2);
    label.top("$a$", 1/2[z0, point 0 of ellipse]);
    label.bot("$ae$", 1/2[z0, z1]);
    label.rt("$b$", 1/2[z0, point 2 of ellipse]);
    drawoptions();

    numeric t; t = 1.732;
    draw z1 -- point t of ellipse -- z2; 
    drawoptions(withcolor 1/2);
    draw (left--right) scaled 21 
        rotated angle direction t of ellipse
        shifted point t of ellipse;
    draw (1/2 down--up) scaled 21 
        rotated angle direction t of ellipse
        shifted point t of ellipse;
    drawoptions();

    draw ellipse withcolor 3/4 red;

    dotlabel.urt("$T$", point t of ellipse);
    dotlabel.lrt("$F_1$", z1);
    dotlabel.lrt("$F_2$", z2);

endfig;
\end{mplibcode}
\end{document}

