\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def perpendicular expr t of p = 
  direction t of p rotated 90 shifted point t of p
  enddef;

vardef block(expr r) = 
    save u, n, s, theta, base, ray;
    numeric u, n, s, theta;
    u = 5mm;  n = 32; s = 8u; theta = -45;

    path base, ray[];
    base = origin for i=1 upto n-1: -- (i/n*s,r*normaldeviate) endfor 
        -- (s,0) -- (s,-u) -- (0,-u) -- cycle;

    image(
        fill base withcolor .8[blue,white];
        draw base withcolor .67 blue;

        for i=2 upto 6:
          ray[i] = (left--right) scaled 2/3 s rotated theta shifted (i*u,0);
          b := ypart(ray[i] intersectiontimes base);
          ray[i] := point 0 of ray[i] 
                 -- point b of base 
                 -- point 0 of ray[i] reflectedabout(point b of base, perpendicular b of base);
          drawarrow ray[i];
        endfor   

        label("r=" & decimal r, center base);
    ) enddef;

beginfig(0);

    draw block(0); draw block(0.42) shifted 180 right;


endfig;
\end{mplibcode}
\end{document}
