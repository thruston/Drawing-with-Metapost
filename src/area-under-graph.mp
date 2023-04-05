\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
ahangle := 30;
beginfig(1);
    numeric u;
    u = 1cm;
    path xx, yy, f;
    xx = (1/4 left -- 17/4 right) scaled u;
    yy = (1/4 down -- 9/4 up) scaled u;

    f = ((15/32,32/15) for x = 1/2 step 1/8 until 33/8: .. (x,1/x) endfor) scaled u;

    path A;
    A = buildcycle(yy shifted (u,0), f, yy shifted (2.71828u,0), xx);
    fill A withcolor Blues 8 2;

    drawoptions(withcolor 3/4);
    for x=1 upto 4: 
        draw yy shifted (x*u,0) cutafter (xx shifted (0, ypart point 0 of f)); 
    endfor
    for y=1 upto 2: 
        draw xx shifted (0,y*u) cutafter (yy shifted (xpart point infinity of f,0)); 
    endfor

    drawoptions();
    draw f withcolor Reds 8 7;
    drawarrow xx;
    drawarrow yy;

endfig;
\end{mplibcode}
\end{document}

