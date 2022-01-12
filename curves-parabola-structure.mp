\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    path p;
    p = ((-1, 1){1, -2} for x = 1/4 - 1 step 1/4 until 1:
        .. (x, x*x){1, 2x} endfor) scaled 180 rotated -90;

    path xx, yy;
    pair A, M, N, P, Q, S, T, Z;

    xx = (left -- right) scaled xpart point 0 of p;
    yy = xx rotated 90;

    numeric t; t = 1/4;
    A = origin;
    P = point t of p;

    P - T = whatever * direction t of p; ypart T = 0;
    Q = whatever[P, T]; xpart Q = 0;
    N = (xpart P, 0);

    ypart S = 0;
    S - Q = whatever * (P - Q) rotated 90;
    M = whatever[S, Q]; ypart M = ypart P;
    Z = (xpart M, 0);

    drawarrow xx withcolor 1/2;
    drawarrow yy withcolor 1/2;

    draw P -- T -- M -- S -- P -- M withcolor 1/4;
    draw yy shifted Z withcolor 2/3 red;
    draw p withcolor 2/3 red;

    dotlabel.llft("$A$", A);
    dotlabel.lft("$M$", M);
    dotlabel.top("$P$", P);
    dotlabel.lft("$Q$\thinspace\vrule depth 6pt width 0pt", Q);
    dotlabel.bot("$T$", T);
    dotlabel.bot("$S$", S);
    dotlabel.llft("$Z$", Z);

    numeric r; r = 0.42;
    clip currentpicture to subpath (1+r, 4-r) of bbox currentpicture -- cycle;

endfig;
\end{mplibcode}
\end{document}

