\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);

    numeric u;

    u = 42;   

    z0 = (0, 3u);
    z1 = z0 rotated 120;
    z2 = z1 rotated 120;

    z3 = z0 shifted (1/2u, 3/2u * sqrt(3));
    z4 = z3 shifted (-u,0);
    
    z5-z4 = whatever * (z0-z1);
    z6 = whatever [z0, z2];  
    y5 = y6 = y2 - sqrt(3) * 1/2 u;
    
    z7-z3 = whatever * (z0-z1); 
    z7 = whatever [z1, z2]; 

    %dotlabels.top(0, 1, 2, 3, 4, 5, 6, 7);

    path vii;
    vii = z3--z4--z5--z6--z2--z7--cycle;

    for i=0 upto 2: 
        fill vii rotated 120i withcolor Blues[9][i+2];
    endfor
    for i=0 upto 2: 
        draw vii rotated 120i;
    endfor

endfig;
\end{mplibcode}
\end{document}
