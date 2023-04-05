\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef pentapath(expr a, b) = 
    save c, d, e; 
    pair c, d, e;
    c = a rotatedabout(b, -108);
    d = b rotatedabout(c, -108);
    e = b rotatedabout(a, 108);
    a -- b -- c -- d -- e -- cycle
enddef;
input colorbrewer-rgb
beginfig(1);

    path p[];
    p0 = for i=1 upto 5: 20 right rotated -18 rotated 72i -- endfor cycle; 
    draw p0 dashed withdots scaled 1/4;
    for i=1 upto 3:
        p[i] = pentapath(point 4 of p[i-1], point 2 of p[i-1]);
        draw p[i] dashed withdots scaled 1/4;
        draw point 0 of p0 {point 2 of p0 - point 3 of p0}
          .. point 1 of p0 {point 3 of p0 - point 4 of p0}
          .. point 2 of p[i] {point 4 of p[i] - point 0 of p[i]}
          .. point 3 of p[i] {point 0 of p[i] - point 1 of p[i]}
          .. point 4 of p[i] {point 1 of p[i] - point 2 of p[i]}
          .. cycle withcolor Spectral[4][i];
    endfor


endfig;
\end{mplibcode}
\end{document}

