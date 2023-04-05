\documentclass[border=3mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    path C, L;
    numeric r; 
    r = 89;
    C = fullcircle scaled 2r;
    L = (up--down) scaled 138 shifted 180 right rotated 34;
    pair a, b, o;
    a = point 0 of L; b = point 1 of L;
    o = center C;

    pair P, Q, R, P', m;
    P = whatever[a, b]; o - P = whatever * (a - b) rotated 90;
    Q = C intersectionpoint halfcircle zscaled (P-o) shifted 1/2[P, o];
    R = Q reflectedabout(P, o);
    P' = whatever[o, P] = whatever [Q, R];

    draw fullcircle scaled abs(P' - o) shifted 1/2[o, P'] 
        dashed withdots scaled 1/4
        withpen pencircle scaled 1/4
        withcolor 1/3 blue;

    draw unitsquare scaled 5 rotated (270 + angle (P-Q)) shifted Q withcolor 3/4 white;
    draw unitsquare scaled 5 rotated (90 + angle (P-o)) shifted P withcolor 3/4 white;
    draw unitsquare scaled 5 rotated (90 + angle (P-o)) shifted P' withcolor 3/4 white;

    draw P -- Q -- o -- R -- cycle withcolor 1/2 white;
    draw Q--R; draw o -- P;
    draw L withcolor 2/3 blue;

    draw C dashed evenly scaled 1/2 withcolor 1/2[2/3 blue, white];

    dotlabel.top("$Q$", Q);
    dotlabel.lrt("$R$", R);
    dotlabel.urt("$P$", P);
    dotlabel.llft("$O$", o); fill fullcircle scaled 3/4 dotlabeldiam shifted o withcolor white;
    label.lft("$r$", 1/2[o, Q]);

    drawdot P' withpen pencircle scaled dotlabeldiam;
    label("$P'$", P' shifted 10 dir 68) withcolor 2/3 blue;

    drawoptions(withcolor 2/3 blue);
    label.bot("\textit{circle of inversion}", point 6 of C);
    label.urt("\textit{polar}", point 1/4 of L);
    z0 = P' + 20 dir -20; draw z0 -- P' cutafter fullcircle scaled 8 shifted P' 
        withpen pencircle scaled 1/4;
    label.rt("\textit{pole}", z0);
    drawoptions();

    label("$\displaystyle {r\over OP} = {OP' \over r}$", 1/2[point 0 of C, point 1 of L] + 12 down);
    label("$\displaystyle r^2 = OP \times OP'$",         1/2[point 0 of C, point 1 of L] + 36 down);

endfig;
\end{mplibcode}
\end{document}
