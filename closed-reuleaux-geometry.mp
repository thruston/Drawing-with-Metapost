\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef urp(expr n) =
    save a; numeric a; a = 90/n;
    for i=0 upto n-1:
        1/2 up rotated (a * 4i) {left rotated (a + a * 4i)} .. {left rotated (3a + a * 4i)}
    endfor cycle
enddef;
vardef through@#(expr a, b) = save d; numeric d; d = abs(a-b);
    (1+@#/d)[b, a] -- (1+@#/d)[a, b] enddef;
input colorbrewer-rgb
beginfig(1);
    path p, c; p = urp(5) scaled 320; c = fullcircle scaled 320;

    pair A, B, C; 
    A = point 0 of p;
    B = point 1 of p;
    C = point 3 of p;

    drawoptions(withcolor 7/8);
    draw c;
    draw through 42(origin, A);
    draw through 42(origin, B);
    draw through 42(C, A);
    draw through 42(C, B);
    draw through 42(B, B shifted 64 up);

    forsuffixes $=origin, B:
        draw (left--right) scaled 2 rotated 13 shifted $ shifted 42 up;
        draw (left--right) scaled 2 rotated 13 shifted $ shifted 41 up;
    endfor
    ahangle := 30;
    forsuffixes $=A, B:
        drawarrow (reverse unitsquare scaled 5 -- 48 up) rotated angle ($ - C) shifted $;
    endfor

    drawoptions();
    draw p withcolor Reds 8 7;
    numeric a; a = 18;
    label("$\alpha$", 32 dir 11/2 a shifted A);
    label("$\alpha$", 32 dir 31/2 a shifted A);
    label("$\alpha$", 32 dir 17/2 a shifted B);
    label("$\alpha$", 32 dir 37/2 a shifted B);
    label("$2\alpha$", 28 dir 14/2 a shifted C);
    label("$3\alpha$", 24 dir 13/2 a shifted B);
    label("$4\alpha$", 20 dir 7a);

    dotlabel.urt("$A$", A);
    dotlabel.lrt("$B$", B);
    dotlabel.lrt("$C$", C);
    dotlabel.urt("$O$", origin);

    label.lft("$r$", 1/2 A);

label.bot(btex \vbox{\hsize 4in \small\noindent
This proof only works for Reuleaux polygons with an odd number of sides, 
because otherwise the point $C$ does not (quite) lie on the circle.\strut} etex, 
point 1/2 of bbox currentpicture shifted 21 down);

endfig;
\end{mplibcode}
\end{document}

