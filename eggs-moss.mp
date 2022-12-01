\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
color eggshell; eggshell = 3/4[1/4[red, green], white];
path a, b, c, e; numeric r; r = 100;
a = fullcircle scaled 2r;
b = subpath (0, 1) of fullcircle scaled 4r shifted point 4 of a;
c = subpath (3, 4) of fullcircle scaled 4r shifted point 0 of a;
e = subpath (4, 8) of a & b .. c & cycle;

fill e withpen pencircle scaled 2 withcolor eggshell;

picture P; P = currentpicture;

drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw a;
draw point 4 of a -- b -- cycle;
draw point 0 of a -- c -- cycle;
draw fullcircle scaled 2 abs (point 2 of a - point 1 of b) shifted point 2 of a;
draw point 0 of a withpen pencircle scaled 2;
draw point 2 of a withpen pencircle scaled 2;
draw point 4 of a withpen pencircle scaled 2;
draw center a withpen pencircle scaled 2;

drawoptions();

draw P shifted 240 right;

endfig;
\end{mplibcode}
\end{document}

