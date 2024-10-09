\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
    numeric a; a = 13;
    path s; s = unitsquare shifted -(1/2, 1/2) rotated 45 shifted (sqrt(3/2), 0) scaled a;
    picture unit;
    ahangle := 10;
    unit = image(
        for i=-1 upto 1:
            fill s rotated 60i withcolor Oranges 8 3;
            draw s rotated 60i;
        endfor
    );
    pair u, v;
    u = point 2 of s - point 0 of s rotated -60;
    v = u rotated 60;
    numeric n; n = 8;
    for i = -n upto n:
        for j = -n upto n:
            draw unit shifted (i * u + j * v);
        endfor
    endfor
    
    picture P; P = currentpicture; currentpicture := nullpicture;
    fill fullcircle scaled 400 withcolor Blues 5 4;
    clip P to fullcircle scaled 400;
    draw P;
endfig;
\end{mplibcode}
\end{document}

