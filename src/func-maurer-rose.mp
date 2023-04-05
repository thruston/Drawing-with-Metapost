\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    numeric n; n = 2;
    path r; r = (for t=0 upto 360: 
        cosd(n * t) * dir t ...
    endfor cycle) scaled 150;

    numeric d; d = 29;
    path k; k = for t = 0 upto 360:
        point d * t mod 360 of r -- 
    endfor cycle;
    
    draw k dashed withdots scaled 1/8
        withpen pencircle scaled 1/4 
        withcolor 1/2[blue, white];
    draw r withcolor 2/3 red;

    path xx, yy;
    xx = (left -- right) scaled 160;
    yy = (down -- up) scaled 160;
    drawarrow xx; label.rt("$x$", point 1 of xx);
    drawarrow yy; label.top("$y$", point 1 of yy);

endfig;
\end{mplibcode}
\end{document}
