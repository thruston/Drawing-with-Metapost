\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path A, B;
A = (origin {dir 42} .. 120 right {dir 42}) rotated 6;
B = A reflectedabout (left, right) shifted 10 up;
drawarrow A; label.llft("$A$", point 0 of A);
drawarrow B; label.ulft("$B$", point 0 of B);
draw fullcircle scaled 4
    shifted (A intersectionpoint B)
    withcolor .54 red;
draw fullcircle scaled 4
    shifted (reverse A intersectionpoint B)
    withcolor (.2, .2, .7);
endfig;
\end{mplibcode}
\end{document}

