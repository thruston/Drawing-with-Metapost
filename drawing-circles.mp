\documentclass[border=0mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
color TR, TB, TG;
TB = (.2,.2,.7);
TR = (0.54,0,0);
TG = (0, 0.44, 0);

path xx, yy;
xx = (left--right) scaled 144;
yy = (down--up) scaled 89;

ahangle := 30;
picture P[];
P0 = image(drawarrow xx withcolor 1/2; drawarrow yy withcolor 1/2);
P1 = image(draw P0; 
    path c, a;
    c = fullcircle scaled 4cm shifted (34, 21);
    a = point 1 of c -- center c;
    draw c withcolor TR;
    draw fullcircle scaled 3 shifted (34,21); label.lrt("$(34,21)$", (34,21));
    drawdblarrow a; label.ulft("2 cm", point 1/2 of a);
);

vardef circle_through(expr A, B, C) = 
    save o; pair o; 
    o = whatever * (A-B) rotated 90 shifted 1/2[A,B]
      = whatever * (B-C) rotated 90 shifted 1/2[B,C];
    fullcircle scaled 2 abs (A-o) shifted o
enddef;

P2 = image(draw P0;
    pair A, B, C;
    A = (-21, -13);
    B = (58, 21);
    C = (89, -34);

    path c[];
    c1 = fullcircle scaled 2 abs(A-B) shifted A; 
    c2 = fullcircle scaled   abs(A-B) shifted 1/2[A, B];
    c3 = circle_through(A, B, C);

    draw c1 withcolor TR; label.ulft("I", point 3 of c1) withcolor TR;

    draw A -- B dashed withdots scaled 1/4 withpen pencircle scaled 1/4 withcolor TB;
    draw c2 withcolor TB; label.ulft("II", point 3 of c2) withcolor TB;
    draw fullcircle scaled 2 shifted 1/2[A, B] withcolor TB;

    draw c3 withcolor TG; label.urt("III", point 1 of c3) withcolor TG;

    dotlabel.llft("$A$", A);
    dotlabel.urt("$B$", B);
    dotlabel.lrt("$C$", C);
);

beginfig(1);
labeloffset := 10;
label.top(P1, origin);
label.bot(P2, origin);
endfig;
\end{mplibcode}
\end{document}
