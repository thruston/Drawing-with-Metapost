\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef straight_through(expr Prefix, Path, Suffix) = 
    reverse (left scaled Prefix rotated angle direction 0 of Path shifted point 0 of Path)
    .. Path .. (right scaled Suffix rotated angle direction infinity of Path shifted point infinity of Path)
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
vardef arc_of_tangents(expr C, p) = 
    subpath tangent_times(C, p) of C
enddef;

beginfig(1);

    path c[]; numeric r[];
    z1 = origin; r1 = 101;
    z2 = 233 right rotated 4; r2 = 53;
    z3 = 209 right rotated -42; r3 = 31;

    forsuffixes $=1, 2, 3:
        c$ = fullcircle scaled 2 r$ shifted z$;
    endfor

    pair ecs[], ics[];

    for i=1 upto 3:
        numeric j, k; 
        j = i mod 3 + 1;
        k = 10i + j;
        ics[k] = (r[i]/(r[i]+r[j]))[z[i], z[j]];
        ecs[k] = (r[i]/(r[i]-r[j]))[z[i], z[j]];
    endfor

    show unitvector(ecs31 - ics12) dotprod unitvector(ecs12 - ics31);

    fill ecs12 -- arc_of_tangents(c1, ecs12) -- cycle withcolor 15/16[blue, white];
    fill ics12 -- arc_of_tangents(c1, ics12) -- cycle withcolor  7/8 [blue, white];
    fill ics12 -- arc_of_tangents(c2, ics12) -- cycle withcolor  7/8 [blue, white];
    
    unfill c1; unfill c2; unfill c3;

    drawoptions(withcolor 3/4[blue, white]);
    draw c1 withpen pencircle scaled 1;
    draw c2 withpen pencircle scaled 1;
    draw c3 withpen pencircle scaled 1;

    numeric t, u, v;
    (t, whatever) = tangent_times(c1, ecs12);
    (u, whatever) = tangent_times(c1, ics12);
    (whatever, v) = tangent_times(c2, ics12);
    draw point t of c1 -- z1 -- point u of c1 dashed evenly;
    draw point t of c2 -- z2 -- point v of c2 dashed evenly;

    drawoptions(withcolor 1/4[blue, white]);
    drawdot z1 withpen pencircle scaled dotlabeldiam;
    drawdot z2 withpen pencircle scaled dotlabeldiam;
    drawdot z3 withpen pencircle scaled dotlabeldiam;
    label(btex $C_1$ etex, z1 shifted 10 dir 254);
    label(btex $C_2$ etex, z2 shifted 10 dir 299);
    label(btex $C_3$ etex, z3 shifted 10 dir 6);
    label.lft(btex $r_1$ etex, 1/2[z1, point t of c1]);
    label.lft(btex $r_2$ etex, 1/2[z2, point t of c2]);
    
    drawoptions();
    draw ecs31 -- ics12 -- ecs23 -- ecs12 -- ics31 dashed withdots scaled 1/2;

    drawoptions(withcolor 1/2 white);
    draw straight_through(r1+24, z1 -- ecs12, 24);
    draw straight_through(r1+24, z1 -- ecs31, 24);
    draw straight_through(r2+24, z2 -- ecs23, 24);

    drawoptions(withcolor 2/3 red);
    drawdot ics12 withpen pencircle scaled dotlabeldiam;
    drawdot ics23 withpen pencircle scaled dotlabeldiam;
    drawdot ics31 withpen pencircle scaled dotlabeldiam;
    label(btex $I_{12}$ etex, ics12 shifted 12 dir 100);
    label(btex $I_{23}$ etex, ics23 shifted 12 dir 340);
    label(btex $I_{31}$ etex, ics31 shifted 10 dir 200);

    drawoptions(withcolor 5/8 blue);
    drawdot ecs12 withpen pencircle scaled dotlabeldiam;
    drawdot ecs23 withpen pencircle scaled dotlabeldiam;
    drawdot ecs31 withpen pencircle scaled dotlabeldiam;
    label(btex $E_{12}$ etex, ecs12 shifted 8 dir 100);
    label(btex $E_{23}$ etex, ecs23 shifted 11 dir 345);
    label(btex $E_{31}$ etex, ecs31 shifted 10 dir 277);

    draw thelabel.top(btex Axis of Similitude etex, origin) 
        rotated angle (ecs12 - ecs31) 
        shifted 1/4[ecs31, ecs12];

    label(btex $\displaystyle {C_1E_{12} \over C_2E_{12}} = {r_1 \over r_2} 
                               = {C_1I_{12} \over C_2I_{12}}$ etex, (x1, y3));

    label(btex \it \& cetera \dots etex, (x1, y3-28));
    
endfig;
\end{mplibcode}
\end{document}
