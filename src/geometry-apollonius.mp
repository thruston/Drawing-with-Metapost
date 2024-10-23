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

vardef invert_point(expr P, o, r) = 
    save p, d; pair p; numeric d;
    p = P - o; d = abs p;
    if d > 0:
        o + unitvector p scaled (r/d*r) 
    else:
        errmessage("Inversion undefined at center.")
    fi
enddef;

vardef pole(expr Line, Circle) = 
    save p, o, r; pair o, p; numeric r;
    o = center Circle;
    r = 1/2 abs (point 4 of Circle - point 0 of Circle);
    p = whatever [point 1 of Line, point 0 of Line];
    p - o = whatever * direction 0 of Line rotated 90;
    invert_point(p, o, r)
enddef;

vardef polex(expr a, b, o, r) = 
    save p; pair p; 
    p = whatever [a, b];
    p - o = whatever * (a-b) rotated 90;
    invert_point(p, o, r)
enddef;

vardef three_point_circle(expr a,b,c) = 
  save m; pair m; 
  m = whatever [a,b] rotatedaround(.5[a,b],90) 
    = whatever [b,c] rotatedaround(.5[b,c],90);
  fullcircle scaled 2 length(m-a) shifted m
  enddef;

vardef through(expr a, b, o) = 
    save d; numeric d; d = abs(a-b);
    (1+o/d)[b, a] -- (1+o/d)[a, b]
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
    path a[]; 
    a1 = radical_axis(c1, c2);
    a2 = radical_axis(c2, c3);
    a3 = radical_axis(c3, c1);

    z0 = whatever [point 0 of a1, point 1 of a1] 
       = whatever [point 0 of a2, point 1 of a2];

    z11 = polex(ecs31, ecs12, z1, r1);
    z21 = polex(ecs31, ecs12, z2, r2);
    z31 = polex(ecs31, ecs12, z3, r3);

    z12 = c1 intersectionpoint (z0 -- z11);
    z22 = c2 intersectionpoint (z0 -- z21);
    z32 = c3 intersectionpoint (z0 -- z31);

    z13 = c1 intersectionpoint (z11 -- 8[z0,z11]);
    z23 = c2 intersectionpoint (z21 -- 8[z0,z21]);
    z33 = c3 intersectionpoint (z31 -- 8[z0,z31]);

    z14 = whatever[ecs12, ecs31] = whatever[z1, z11];
    z24 = whatever[ecs12, ecs31] = whatever[z2, z21];
    z34 = whatever[ecs12, ecs31] = whatever[z3, z31];

    drawoptions(withcolor 3/4[blue, white]);
    draw c1; draw c2; draw c3;
    drawoptions(withcolor 1/4[blue, white]);
    label.urt(btex $C_1$ etex, point 1 of c1);
    label.top(btex $C_2$ etex, point 2 of c2);
    label.rt (btex $C_3$ etex, point 1/2 of c3);
    draw ecs12 -- ecs31 -- ecs23;
    
    drawoptions(withpen pencircle scaled 1/4 withcolor 3/4[2/3 blue, white]);
    draw a1; draw a2; draw a3;
    draw through(z1, z14, 6);
    draw through(z2, z24, 6);
    draw through(z3, z34, 6);

    drawoptions(withpen pencircle scaled 1/4 withcolor 1/2 white);
    draw through(z0, z13, 6);
    draw through(z0, z23, 6);
    draw through(z0, z33, 6);

    drawoptions(withcolor 1/256(203, 92, 13));
    drawdot z0 withpen pencircle scaled 3/2 dotlabeldiam;
    z99 = z0 shifted 24 dir -6;
    label.rt("\vbox{\openup-4pt\halign{\hss #\hss\cr Radical\cr centre\cr}}", z99);
    interim ahangle := 20; drawarrow z99 -- z0 
        cutafter fullcircle scaled 16 shifted z0
        withpen pencircle scaled 1/3;

    drawoptions(withcolor 1/256(239, 114, 21));
    dotlabel.urt("\small Pole", z11);
    dotlabel.ulft("\small Pole", z21);
    dotlabel.urt("\small Pole", z31);

    drawoptions(withcolor 2/3 red);
    draw three_point_circle(z12, z22, z32);
    draw three_point_circle(z13, z23, z33);
    drawdot z12 withpen pencircle scaled 3/4 dotlabeldiam;
    drawdot z22 withpen pencircle scaled 3/4 dotlabeldiam;
    drawdot z32 withpen pencircle scaled 3/4 dotlabeldiam;
    drawdot z13 withpen pencircle scaled 3/4 dotlabeldiam;
    drawdot z23 withpen pencircle scaled 3/4 dotlabeldiam;
    drawdot z33 withpen pencircle scaled 3/4 dotlabeldiam;

    drawoptions(withcolor 1/2[blue, white]);
    drawdot z1 withpen pencircle scaled dotlabeldiam;
    drawdot z2 withpen pencircle scaled dotlabeldiam;
    drawdot z3 withpen pencircle scaled dotlabeldiam;
    drawdot z14 withpen pencircle scaled dotlabeldiam;
    drawdot z24 withpen pencircle scaled dotlabeldiam;
    drawdot z34 withpen pencircle scaled dotlabeldiam;
    draw thelabel.top(btex Axis of similitude, as polar etex, origin) 
        rotated angle (ecs12 - ecs31) 
        shifted 3/4[ecs31, ecs12];

    drawoptions();

endfig;
\end{mplibcode}
\end{document}
