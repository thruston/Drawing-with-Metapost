\documentclass[border=1mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef radical_axis(expr ca, cb) = 
    numeric t, d, ra, rb;
    ra = abs(center ca - point 0 of ca);
    rb = abs(center cb - point 0 of cb);
    d = abs(center cb - center ca);
    2t = 1 + (ra+rb) / d * (ra-rb) / d;
    (up -- down) scaled 89
        rotated angle (center cb - center ca) 
        shifted t[center ca, center cb]
enddef;

vardef tangent_times(expr C, p) = 
    save m, a, b, G, H;
    pair m; numeric a, b; path G, H;
    m = 1/2[p, center C];
    H = halfcircle scaled abs (p - center C)
        rotated angle (p - center C) shifted m;
    G = H rotatedabout(m, 180);
    (a, whatever) = C intersectiontimes H;
    (b, whatever) = C intersectiontimes G;
    (a, b if b < a: + 8 fi)
enddef;

beginfig(1);
    path c[], a[]; 
    z1 = origin; z2 = 233 right rotated 4; z3 = 209 right rotated -42;
    c1 = fullcircle scaled 202 shifted z1;
    c2 = fullcircle scaled 106 shifted z2;
    c3 = fullcircle scaled  62 shifted z3;
    a1 = radical_axis(c1, c2);
    a2 = radical_axis(c2, c3);
    a3 = radical_axis(c3, c1);

    z0 = whatever [point 0 of a1, point 1 of a1] 
       = whatever [point 0 of a2, point 1 of a2];

    numeric t;
    (t, whatever) = tangent_times(c1, z0);

    drawoptions(withpen pencircle scaled 1 withcolor 3/4[blue, white]);
    draw c1; draw c2; draw c3;

    drawoptions(withcolor 3/4[blue, white]);
    draw z1 -- point t of c1 dashed evenly;

    drawoptions(withpen pencircle scaled 1/4);
    draw z1 -- z2 -- z3 -- cycle;
    drawoptions();
    draw a1; draw a2; draw a3;

    drawoptions(withcolor 2/3 red);
    draw fullcircle scaled 2 abs (point t of c1 - z0) shifted z0;
    draw z0 -- point t of c1 dashed evenly;
    drawdot z0 withpen pencircle scaled dotlabeldiam;

    drawoptions(withcolor 1/4[blue, white]);
    drawdot z1 withpen pencircle scaled dotlabeldiam;
    drawdot z2 withpen pencircle scaled dotlabeldiam;
    drawdot z3 withpen pencircle scaled dotlabeldiam;
    label.urt(btex $C_1$ etex, point 1 of c1);
    label.urt(btex $C_2$ etex, point 1 of c2);
    label.rt (btex $C_3$ etex, point 0 of c3);
endfig;
\end{mplibcode}
\end{document}

