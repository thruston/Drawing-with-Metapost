\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path p;
p = origin .. controls (64, 64) and (128, 64) .. (192, 0)
           .. controls (256, -64) and (320, -64) .. (384, 0);

ahangle := 20;
ahlength := 6;
picture P[];
P1 = image(
    draw p withcolor 0.54 red;
    for t=0 upto length p: draw fullcircle scaled 5 shifted point t of p; endfor
);
P2 = image(
    draw p withcolor 0.54 red;
    drawoptions(withcolor 1/2);
    for t=0 upto length p:
        drawarrow precontrol t of p -- postcontrol t of p;
        fill fullcircle scaled 2 shifted precontrol t of p;
        draw fullcircle scaled 5 shifted point t of p;
    endfor
    drawoptions();
);
P3 = image(
    draw p withcolor 0.54 red;
    drawoptions(withcolor 1/2);
    for t=0 step 1/8 until length p:
        path s; 
        s = origin -- unitvector(direction t of p) scaled 42;
        drawarrow s shifted point t of p;
        fill fullcircle scaled 2 shifted point t of p;
    endfor
    drawoptions();
);
draw P1;
draw P2 shifted 144 down;
draw P3 shifted 360 down;
endfig;
\end{mplibcode}
\end{document}

