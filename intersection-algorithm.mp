\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
color tr, tb; tr = 0.54 red; tb = (0.2, 0.2, 0.7);
ahangle := 30;
path A, B;
A = subpath (1, 2) of fullcircle scaled 240 shifted 48 left;
B = subpath (7, 8) of fullcircle scaled 240 rotated 144 shifted 48 right;

picture P[];
P1 = image(
    drawarrow A; label.rt("$A$", point 0 of A);
    drawarrow B; label.rt("$B$", point 0 of B);
);
vardef boxed(expr p) =
    save d; pair d; d = point infinity of p - point 0 of p;
    unitsquare xscaled xpart d yscaled ypart d shifted point 0 of p
enddef;

P2 = image(
    draw A withcolor 3/4; 
    draw B withcolor 3/4;
    draw boxed(A) withcolor tr;
    draw boxed(B) withcolor tb;
);

P3 = image(
    draw A withcolor 3/4; 
    draw B withcolor 3/4;
    path s[];
    numeric m; m = arctime 1/2 arclength A of A;
    s1 = boxed(subpath (0, m) of A);
    s3 = boxed(subpath (m, infinity) of A);
    numeric m; m = arctime 1/2 arclength B of B;
    s2 = boxed(subpath (0, m) of B);
    s4 = boxed(subpath (m, infinity) of B);
    draw s3 withcolor 7/8; 
    draw s4 withcolor 7/8;
    draw s2 withcolor tb;
    draw s1 withcolor tr;
    label.urt("$\scriptstyle 1$", point 1 of s1);
    label.ulft("$\scriptstyle 2$", point 0 of s2);
    label.urt("$\scriptstyle 3$", point 1 of s3);
    label.ulft("$\scriptstyle 4$", point 3 of s4);
);

draw P1;
draw P2 shifted 120 right;
draw P3 shifted 240 right;

P4 = image(
    draw A withcolor 3/4; 
    draw B withcolor 3/4;
    numeric m[];
    m1 = arctime 1/4 arclength A of A;
    m2 = arctime 1/2 arclength A of A;
    draw boxed(subpath (0, m1) of A) withcolor 7/8;
    draw boxed(subpath (m1, m2) of A) withcolor tr;
    numeric m[];
    m1 = arctime 1/4 arclength B of B;
    m2 = arctime 1/2 arclength B of B;
    draw boxed(subpath (0, m1) of B) withcolor 7/8;
    draw boxed(subpath (m1, m2) of B) withcolor tb;
);
P5 = image(
    draw A withcolor 3/4; 
    draw B withcolor 3/4;
    numeric m[];
    m1 = arctime 1/4 arclength A of A;
    m2 = arctime 3/8 arclength A of A;
    m3 = arctime 1/2 arclength A of A;
    draw boxed(subpath (m1, m2) of A) withcolor 7/8;
    draw boxed(subpath (m2, m3) of A) withcolor tr;
    numeric m[];
    m1 = arctime 1/4 arclength B of B;
    m2 = arctime 3/8 arclength B of B;
    m3 = arctime 1/2 arclength B of B;
    draw boxed(subpath (m2, m3) of B) withcolor 7/8;
    draw boxed(subpath (m1, m2) of B) withcolor tb;
);

draw P4 shifted 89 down;
draw P5 shifted 89 down shifted 120 right;
interim bboxmargin := 0;
label.top("and so on\dots", center bbox P5 shifted 89 down shifted 240 right);

endfig;
\end{mplibcode}
\end{document}

