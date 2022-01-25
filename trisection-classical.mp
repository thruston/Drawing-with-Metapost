\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    path C, base, section, aa;
    numeric theta;
    C = fullcircle scaled 144; 
    base = origin -- right scaled 172.8;   
    theta = 63; 

    z1 = point 0 of C scaled 1.2 rotated theta;
    z2 = point 4 of C rotated theta;

    draw C;
    draw z1 -- origin -- base;
    draw origin -- z2 -- base shifted z2 dashed evenly;

    section = base scaled 1.2 rotated 1/3 theta shifted z2 cutafter base;
    draw section;

    label.ulft("$a$", 1/2 z2);
    aa = subpath (eps, infinity) of section cutbefore C;
    label.lrt("$a$", point 1/2 of aa);

    draw origin -- point 0 of aa dashed withdots scaled 1/2;

    label("$\theta$", 20 right rotated 1/2 theta);
    label("$\theta/3$", 60 right rotated 1/6 theta shifted z2);

endfig;
\end{mplibcode}
\end{document}

