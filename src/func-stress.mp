\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    z1 = 377 right;  z2 = 233 up;

    path ff; 
    ff = origin .. (72, 144){1,2} .. (84, 144) .. (96, 144){1,1} .. (220, 220){right} .. (370, 160){2,-1.3};

    for t=2, 4, 4.9:
        draw point t of ff -- (xpart point t of ff, y2 + 6) dashed evenly scaled 1/2;
    endfor
    label.top("Strain hardening", (1/2 (xpart point 2 of ff + xpart point 4 of ff), y2));
    label.top("Necking",          (1/2 (xpart point 4 of ff + xpart point 4.9 of ff), y2));

    path rr; 
    rr = point 0.4 of ff -- (xpart point 0.8 of ff, ypart point 0.4 of ff) -- point 0.8 of ff;
    draw rr; label.bot("Run", point 1/2 of rr); label.rt("Rise", point 3/2 of rr);

    vardef pin_label@#(expr p, a, b)= 
        draw a -- b cutbefore fullcircle scaled 8 shifted a withpen pencircle scaled 1/4 withcolor 1/2 white;
        label@#(p, b);
    enddef;

    pin_label.lrt("Yield strength",     point 1.2 of ff, point 2 of ff + (8, -18));
    pin_label.bot("Ultimate strength",  point 4   of ff, point 4 of ff + (4, -24));
    pin_label.bot("Fracture",           point 5   of ff, point 5 of ff + (-8, -18));

    draw ff withpen pencircle scaled 1 withcolor 2/3 blue;
    clip currentpicture to unitsquare scaled 400; % clip thick pen at origin

    drawdblarrow z1 -- origin -- z2;
    label.ulft("Strain, $\epsilon$", z1);
    label.urt("Stress, $\sigma$", z2);

    label("$\displaystyle\hbox{Young's modulus} = \hbox{Slope} = {\hbox{Rise}\over\hbox{Run}}$",
        1/2 z1 shifted 36 up) withcolor 2/3 blue;

endfig;
\end{mplibcode}
\end{document}

