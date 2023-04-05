\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input penrose
beginfig(1);
    path s, t; phi = 1.61803398875;
    s = unitsquare shifted -(1/2, 1/2) rotated 45 xscaled phi yscaled 2 sind(36) scaled 20;
    t = unitsquare shifted -(1/2, 1/2) rotated 45 xscaled (1/phi) yscaled 2 sind(72) scaled 20;
    picture p[];
    p1 = image(
        draw (left--right) scaled 30 dashed evenly;
        draw s;
    );
    p3 = image(
        draw (left--right) scaled 13 dashed evenly;
        draw t;
    ) rotated 90 shifted 130 right;
    p2 = image(
        draw subpath (1, 3) of s -- cycle dashed withdots scaled 1/16 withpen pencircle scaled 1/8 withcolor 1/2;
        inflate_wide(3, 1, point 1 of s, point 2 of s, point 3 of s);
    ) shifted 64 right; 
    p4 = image(
        draw subpath (1, 3) of t -- cycle dashed withdots scaled 1/16 withpen pencircle scaled 1/8 withcolor 1/2;
        inflate_tall(3, 1, point 1 of t, point 2 of t, point 3 of t);
    ) rotated 90 shifted 200 right; 
    ahangle := 30;
    draw p1; 
    draw p2;
    draw p3;
    draw p4;
    drawarrow (7 left -- 8 right) shifted point 7/4 of bbox p1 withcolor .67 red;
    drawarrow (1 left -- 14 right) shifted point 7/4 of bbox p3 withcolor .67 red;

endfig;
\end{mplibcode}
\end{document}

