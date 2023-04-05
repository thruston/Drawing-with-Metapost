\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input rope
beginfig(1);

    interim ahangle := 30;

    z0 = 42 left  rotated normaldeviate;
    z1 = 30 up    rotated normaldeviate;
    z2 = 31 right rotated normaldeviate;
    z3 = 34 down  rotated normaldeviate;

    path s[];
    for i=0 upto 3:
        s[i] = unitsquare zscaled (z[(i+1) mod 4] - z[i]) shifted z[i];
        fill s[i] withcolor if odd i: Blues else: Oranges fi 8 1;
        draw point 3 of s[i] -- subpath (1,4) of s[i] -- point 2 of s[i] withcolor 3/4;
        drawarrow subpath (0, 1) of s[i];
        z[i+4] = 1/2[point 0 of s[i], point 2 of s[i]];
    endfor

    z8 = whatever[z4, z6] = whatever[z5, z7];

    draw unitsquare scaled 5 rotated angle (z4-z6) shifted z8 withcolor 3/4;

    drawarrow z4--z6;
    drawarrow z5--z7;

    vardef with_rounded_corners expr p = 
        for i=1 upto length p:
            subpath (i-15/16, i-1/16) of p ..
        endfor cycle
    enddef;

    interim bboxmargin := 16;
    draw rope with_rounded_corners bbox currentpicture;
    %    dashed evenly scaled 3/4;
    %picture P; P = currentpicture;
    %fill bbox P shifted (3,-3) withcolor 3/4;
    %unfill bbox P; draw bbox P;
    %draw P; 

endfig;
\end{mplibcode}
\end{document}

