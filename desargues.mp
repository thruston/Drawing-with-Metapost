\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
beginfig(1);
    z.P = 200 up rotated 21; z.A = 100 left rotated -21;
    z.B = origin; z.C = 90 right rotated 42;

    z.A' = 3/8[z.P, z.A];
    z.B' = 1/2[z.P, z.B];
    z.C' = 5/8[z.P, z.C];

    z.R = whatever [z.A, z.B] = whatever [z.A', z.B'];
    z.S = whatever [z.B, z.C] = whatever [z.B', z.C'];
    z.T = whatever [z.C, z.A] = whatever [z.C', z.A'];

    path t[];
    t1 = z.A--z.B--z.C--cycle;
    t2 = z.A'--z.B'--z.C'--cycle;

    fill t1 withcolor 7/8[red, white];
    fill t2 withcolor 7/8[blue, white];
    draw t1 withcolor 1/2 white;
    draw t2 withcolor 1/2 white;

    drawoptions(dashed withdots scaled 1/2);
    draw z.P--z.A;
    draw z.P--z.B;
    draw z.P--z.C;

    drawoptions(dashed evenly scaled 1/2);
    draw z.B--z.R--z.B';
    draw z.C--z.S--z.C';
    undraw subpath (1/4, 3/4) of (z.C'--z.T) withpen
        pencircle scaled 5;
    draw z.C--z.T--z.C';
    drawoptions(withcolor 2/3 red);
    draw 9/8[z.S,z.R] -- 9/8[z.R,z.S];
    picture pp; pp = thelabel("perspectrix", origin);
    draw pp shifted 7 down rotated angle (z.S-z.R)
         shifted 1/2[z.R, z.T];
    dotlabel.urt("perspector", z.P);

    drawoptions();
    dotlabel.lft (btex $A$ etex, z.A);
    dotlabel.llft(btex $B$ etex, z.B);
    dotlabel.lrt (btex $C$ etex, z.C);
    dotlabel.lft (btex $A'$ etex, z.A');
    dotlabel.llft(btex $B'$ etex, z.B');
    dotlabel.bot (btex $C'$ etex, z.C');
    label.rt(btex Desargues' Theorem etex, (x.C', 1/2(y.P+y.C')));
endfig;
\end{mplibcode}
\end{document}
