\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    pair A, B, C, D, N, M, p, q, r;
    A = origin; B = 377 dir 10; C = 233 dir 70;
    % pedal points
    p = whatever[B, C]; A - p = whatever * (B-C) rotated 90;
    q = whatever[C, A]; B - q = whatever * (C-A) rotated 90;
    r = whatever[A, B]; C - r = whatever * (A-B) rotated 90;

    D = whatever[A, p] = whatever[B, q];
    N = 1/4(A + B + C + D);
    M = D rotatedabout(N, 180);  % M is also the circumcentre

    path circumcircle, nine_point_circle;
    nine_point_circle = fullcircle scaled 2 abs(N - 1/2[A, B]) shifted N;
    circumcircle = fullcircle scaled 2 abs(M - A) shifted M;

    draw nine_point_circle withcolor 3/4 red;
    draw circumcircle withcolor 1/2[3/4 blue, white];

    drawoptions(dashed evenly scaled 1/4 withcolor 1/2);
    draw 1/2[A,B] -- M -- 1/2[B, C];
    draw 1/2[C,A] -- M -- D;
    draw A -- p;
    draw B -- q;
    draw C -- r;

    drawoptions(withpen pencircle scaled 1/4);
    draw fullcircle scaled 2 shifted 1/2[A, B];
    draw fullcircle scaled 2 shifted 1/2[A, C];
    draw fullcircle scaled 2 shifted 1/2[A, D];
    draw fullcircle scaled 2 shifted 1/2[B, C];
    draw fullcircle scaled 2 shifted 1/2[B, D];
    draw fullcircle scaled 2 shifted 1/2[C, D];
    draw fullcircle scaled 2 shifted p;
    draw fullcircle scaled 2 shifted q;
    draw fullcircle scaled 2 shifted r;

    drawoptions();
    draw A--B--C--cycle;
    dotlabel.llft("$A$", A);
    dotlabel.rt("$B$", B);
    dotlabel.ulft("$C$", C);
    dotlabel.urt("\ $D$", D);
    dotlabel.llft("$M$", M);
    dotlabel.llft("$N$", N);

endfig;
\end{mplibcode}
\end{document}
