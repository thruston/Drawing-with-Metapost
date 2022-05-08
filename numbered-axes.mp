\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric u, v; u = 40; v = 29; 
    path xx, yy;  
    xx = (3/2 left -- 5 right) scaled u;
    yy = (3/2 down -- 4 up) scaled v;
    for x=-1 upto 4:
        if x <> 0:
            draw (down--up) shifted (x * u, 0);
            label("$" & decimal x & "$", (x * u, -8));
        fi
    endfor
    for y=-1 upto 3:
        if y <> 0:
            draw (left--right) shifted (0, y * v);
            label("$" & decimal y & "$", (-10, y * v));
        fi
    endfor
    drawarrow xx; label.rt("$x$", point 1 of xx);
    drawarrow yy; label.top("$y$", point 1 of yy);
endfig;
\end{mplibcode}
\end{document}

