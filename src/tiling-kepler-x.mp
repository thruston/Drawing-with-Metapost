\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
    path s; s = unitsquare shifted -(1/2, 1/2) scaled 21;
    path t; t = s rotated 45;

    vardef show_corners(expr p) = 
        save s; numeric s; s = abs(point 1 of p - point 0 of p) / (2 + sqrt(2));
        image( for i=0 upto 3: 
            fill unitsquare scaled s shifted point 0 of p rotated 90i withcolor Oranges[8][1+2i]; 
            draw unitsquare scaled s shifted point 0 of p rotated 90i; 
        endfor)
    enddef;

    pair u, v;
    u = point 1 of s - point 0 of s;
    v = u rotated 90;
    numeric n; n = 8;
    for i = -n upto n:
        for j = -n upto n:
            draw show_corners(s) shifted (i * u + j * v);
            draw show_corners(s) rotated -45 shifted (i * u + j * v);
        endfor
    endfor

endfig;
\end{mplibcode}
\end{document}

