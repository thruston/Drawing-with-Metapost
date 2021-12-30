\documentclass[border=1mm]{standalone}
\usepackage{luatex85}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\hbox to 5.3in{$\vcenter{%
\begin{mplibcode}
beginfig(1);
    z1 = (10, 50); 
    z2 = (80, 190);
    z3 = (0, 170);
    z4 = (60, 10);

    draw z1--z2;
    draw z3--z4;

    z0 = alpha [z1, z2] = beta [z3, z4];

    forsuffixes @=0,1,2,3,4: 
        dotlabel.rt("$z_" & decimal @ & "$", z@) 
        withcolor 2/3 if @=0: red else: blue fi; 
    endfor

    %label.urt(decimal alpha, (x2, y0));
    %label.lrt(decimal beta, (x2, y0));

endfig;
\end{mplibcode}}
\qquad\vcenter{
\begin{code}
beginfig(1);
    z1 = (10, 50); 
    z2 = (80, 190);
    z3 = (0, 170);
    z4 = (60, 10);

    z0 = whatever [z1, z2] = whatever [z3, z4];

    draw z1--z2;
    draw z3--z4;
    forsuffixes @=0,1,2,3,4: 
        dotlabel.rt("$z_" & decimal @ & "$", z@) 
        withcolor 2/3 if @=0: red else: blue fi; 
    endfor
endfig;
\end{code}}$\hss}
\end{document}
