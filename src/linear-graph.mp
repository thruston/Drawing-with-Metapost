\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric u, m, m', b, b';
    u = 1.44cm;
    b = 3.6u;  b' = b + 1/2 u;
    m = -1;  m' = 3/4 m; 

    path xx, yy;
    xx = (left -- 5 right) scaled u;
    yy = xx rotated 90;

    numeric minx, maxx; path ff, gg;
    minx = xpart point 1/16 of xx;
    maxx = xpart point 15/16 of xx;
    ff = (minx, minx * m + b) -- (maxx, maxx * m + b); 
    gg = (minx, minx * m' + b') -- (maxx, maxx * m' + b'); 

    z0 = point 0.4 of ff;
    z1 = point 0.54 of ff;
    z1 0 = whatever [point 0 of gg, point 1 of gg]; x1 0 = x0;
    z1 1 = whatever [point 0 of gg, point 1 of gg]; x1 1 = x1;

    forsuffixes @=0, 1:
        draw (x@, 0) -- z@ -- (0, y@) dashed evenly scaled 3/4;
        draw z@ -- z1 @ -- (0, y1 @) dashed withdots scaled 1/2;
        label.bot("$x_{" & decimal @ & "}$", (x@, 0));
        label.lft("$y_{" & decimal @ & "}$", (0, y@));
        label.lft("$y'_{" & decimal @ & "}$", (0, y1 @));
    endfor

    draw ff withcolor 2/3 red;
    draw gg withcolor 3/4 blue;
    drawarrow xx; drawarrow yy;

    label.rt("$x$", point 1 of xx);
    label.top("$y$", point 1 of yy);

    dotlabel.urt("$b$", (0, b));
    dotlabel.urt("$b'$", (0, b'));

    draw thelabel("slope: $m=" & decimal m & "$", 7 up)
        rotated angle (1, m) shifted point 2/3 of ff;
    draw thelabel("slope: $m'=" & decimal m' & "$", 7 up)
        rotated angle (1, m') shifted point 2/3 of gg;
        
endfig;
\end{mplibcode}
\end{document}
