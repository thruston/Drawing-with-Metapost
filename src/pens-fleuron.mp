\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
    -z1 = z4 = 7 dir 8; 
    y2 - y1 = y4 - y3 = 3(y4 - y1);
    z2 - z1 = z4 - z3 = whatever * dir 50;
    draw z1 .. controls z2 and z3 .. z4 withpen pencircle xscaled 1.2 yscaled 0.2 rotated 50;
    undraw z1 .. controls z2 and z3 .. z4 withpen pencircle xscaled 0.4 yscaled 0.03 rotated 50;
    for i=1 upto 5:
        draw currentpicture shifted ((2**(i-1))*z4);
    endfor
    currentpicture := currentpicture rotated - angle z4;
endfig;
\end{mplibcode}
\end{document}
