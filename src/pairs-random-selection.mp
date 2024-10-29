\documentclass[border=0mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric u; u = 72;
    for x = -2u step 1/8 until 2u:
        drawdot (x, normaldeviate * 1/2u) withpen pencircle scaled 2;
    endfor
    path c;
    c = fullcircle scaled u shifted (u, 1/2u);
    picture P; P = currentpicture; clip P to c; 
    draw c withcolor .54 red;
    draw P withcolor .84 red;

    picture B; B = currentpicture;
    path S; 
    S = unitsquare shifted (-1/2, -1/2) scaled 4u;
    fill S withcolor (1,1,31/32); draw S; clip B to S; draw B;

endfig;
\end{mplibcode}
\end{document}

