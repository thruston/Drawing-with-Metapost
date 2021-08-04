\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);

    r = 164;
    path Y, L, C, P, S;

    Y = origin for t=5 step 5 until 140:
        -- (0, r) rotated t shifted (t/57.29577951308232*r, -r)
    endfor cutafter (origin -- (4r, 0) rotated -45);

    z0 = point 0 of Y;
    z1 = point infinity of Y;

    L = z0 -- z1;  
    C = quartercircle rotated 180 scaled 2x1 shifted (x1, y0);
    %
    % parabola f = x^2, f' = 2x
    P = z0{1,-2} ... (xpart 1/2[z1, z0], ypart 1/4[z1, z0]){1,-1} ... z1 {1, 0};
    % sixth degree f = x^6, f' = 6x^5 
    S = z0{1,-6} ... (xpart 1/2[z1, z0], ypart 1/64[z1, z0]){1, -6/32} ... z1 {1, 0};

    draw z0 -- (x0,y1) -- z1 withcolor 3/4;

    drawoptions(withcolor 2/3 red);         draw L; dotlabel.urt("Line", point 1/4 of L);
    drawoptions(withcolor 1/2 green);       draw C; dotlabel.urt("Circle", point 1 of C);
    drawoptions(withcolor 1/4[red, green]); draw P; dotlabel.urt("Parabola", point 1/2 of P);
    drawoptions(withcolor 3/4[red, green]); draw S; dotlabel.llft("Sixth degree", point 3/4 of S);
    drawoptions(withcolor 1/2 blue);        draw Y; dotlabel.urt("Cycloid", point 22 of Y);

    drawoptions();
    dotlabel.ulft("$A$", z0);
    dotlabel.urt("$B$", z1);

    input ruler-inch
endfig;
\end{mplibcode}
\end{document}
