\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef pulse(expr w, h, d) = 
for i=0 upto 4: x[i] = w/4 * i; endfor
    y0 = y1 = 0;
    y3 = y4 = d;
    y2 = h;
    z0 .. 1/2[z0, z1] .. controls z1 
       .. 1/2[z1, z2] .. controls z2 
       .. 1/2[z2, z3] .. controls z3 
       .. 1/2[z3, z4] .. z4
enddef;

beginfig(1);
    path p; p = pulse(300, 100, -40);

    draw point 0 of p -- postcontrol 1 of p -- postcontrol 2 of p -- postcontrol 3 of p -- point 5 of p
            dashed withdots scaled 1/2 withcolor 2/3 red;
    for i=1 upto 3: draw postcontrol i of p withpen pencircle scaled 2 withcolor 2/3 red; endfor
    label.lrt("$z_1$", postcontrol 1 of p) withcolor 2/3 red;
    label.top("$z_2$", postcontrol 2 of p) withcolor 2/3 red;
    label.llft("$z_3$", postcontrol 3 of p) withcolor 2/3 red;

    draw p withcolor 1/2 blue;
    draw p shifted 120 up withcolor 1/2 blue;
    for i=0 upto length p: draw point i of p withpen pencircle scaled 2; endfor

endfig;
\end{mplibcode}
\end{document}

