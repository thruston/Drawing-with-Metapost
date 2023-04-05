\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
label(btex \vbox{\halign{\hfil\itshape # \hfil\cr
The paths are drawn with\cr
arrows to show where\cr
they start \& stop.\cr}} etex, origin);

ahangle := 30;
path A, B;
A = fullcircle scaled 200 shifted 40 left;
B = fullcircle scaled 200 rotated 144 shifted 40 right;

forsuffixes $=A, B:
    drawarrow $ cutafter fullcircle scaled 6 shifted point 0 of $;
    for t=0 upto 7: 
        drawdot point t of $ withpen pencircle scaled 2;
    endfor
endfor

label.ulft("$A$", point 3.14 of A);
label.urt("$B$", point 6.28 of B);

drawoptions(withcolor 0.54 red);
numeric t, u; (t,u) = A intersectiontimes B;
draw fullcircle scaled 6 shifted point t of A;
z0 = point t of A shifted (-3, 16);
draw z0 -- point t of A cutafter fullcircle scaled 8 shifted point t of A;
label.top("\texttt{A intersectiontimes B}", z0);
drawoptions(withcolor (.2, .2, .7));
numeric t, u; (t,u) = B intersectiontimes A;
draw fullcircle scaled 6 shifted point t of B;
z1 = point t of B shifted (-3, -16);
draw z1 -- point t of B cutafter fullcircle scaled 8 shifted point t of B;
label.bot("\texttt{B intersectiontimes A}", z1);
drawoptions();

endfig;
\end{mplibcode}
\end{document}

