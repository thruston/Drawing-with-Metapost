\documentclass{standalone}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
path egg;
egg = (superellipse(right, 1.6 up, left, 1.2 down, 0.69)) scaled 100;
input eggs-common
beginfig(1);
    fill egg withpen pencircle scaled 2 withcolor eggshell;
    picture P; P = currentpicture;
    drawoptions(withcolor 1/2);
    draw origin withpen pencircle scaled 2;
    draw egg withpen pencircle scaled 1/4;
    drawoptions();
    draw numbered_points(egg) withpen pencircle scaled 2;
    draw P shifted 240 right;
endfig;
\end{mplibcode}
\end{document}
