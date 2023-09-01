\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\newcommand\fleurona{\begin{mplibcode}
beginfig(1);
    z1 = origin; z4 = 13 dir 8;
    y2 - y1 = y4 - y3 = 3(y4 - y1);
    z2 - z1 = z4 - z3 = whatever * dir 50;
    draw z1 .. controls z2 and z3 .. z4 withpen pencircle xscaled 1.8 yscaled 0.2 rotated 50;
    undraw z1 .. controls z2 and z3 .. z4 withpen pencircle xscaled 0.45 yscaled 0.05 rotated 50;
    currentpicture := currentpicture rotated -8;
    for i=1 upto 5:
    draw currentpicture shifted 1/2[lrcorner currentpicture, urcorner currentpicture] shifted 4 left;
endfor
endfig;
\end{mplibcode}}
\newcommand\fleuronb{\begin{mplibcode}
beginfig(1);
    z1 = 3/2 up;  z2 = 9 right; 
    penpos1(1/2, 30); penpos2(3/2, 5); 
    penstroke z1e {dir 30} .. {dir 5} z2e;
    z3 = (1,15/8); z4 = 12 right;
    penpos3(1/2, 30); penpos4(3/2, 6);
    penstroke z3e {dir 30} .. {dir 6} z4e;
    currentpicture := currentpicture scaled 1.414;
endfig;
\end{mplibcode}}
\begin{document}
Here is a \fleurona\ and a \fleuronb.
\end{document}
