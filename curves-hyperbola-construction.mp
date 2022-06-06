\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    pair O; O = origin;
    path c; c = fullcircle scaled 288;  
    pair S; S = point 0 of c shifted 42 right;
    path hyperbola, last;

    numeric t;
    (t, whatever) = c intersectiontimes fullcircle scaled abs(O-S) shifted 1/2[O,S];

    numeric s; s = 1/16;
    for t=-t + 6s step s until t - 5s:
        path ray; 
        ray = (origin -- unitvector(S - point t of c)) scaled 200
            rotated if t < 0: - fi 90 shifted point t of c;
        draw S -- ray withcolor 7/8;
        if known last:
            pair p;
            p = whatever[point 0 of ray, point 1 of ray]
              = whatever[point 0 of last, point 1 of last];
            hyperbola := if known hyperbola: hyperbola .. fi p;
        fi
        last := ray;
    endfor


    drawoptions(withcolor 1/2);
    drawdblarrow   2[O, point t of c] -- O --   2[O, point -t of c];
    draw O -- 1.2[O, S];
    
    drawoptions(withcolor 3/4[blue, white]);
    draw subpath (-1.4, 1.4) of c;
    draw 1.4[S, point t of c] -- S -- 1.4[S, point -t of c];
    drawoptions();

    draw hyperbola withcolor 3/4[red, white];
    for t=0 upto length hyperbola:
        draw point t of hyperbola withpen pencircle scaled 3/2 withcolor red;
    endfor


    dotlabel.lrt("$S$", S);
    dotlabel.llft("$A$", point 0 of c);
    dotlabel.lft("$O$", origin);

endfig;
\end{mplibcode}\llap{\texttt{\tiny\jobname}\quad}
\end{document}

