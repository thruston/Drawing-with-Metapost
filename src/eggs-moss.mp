\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input eggs-common
path a, b, c, d, egg; numeric r; r = 100;
a = fullcircle scaled 2r;
b = fullcircle scaled 4r shifted point 4 of a;
c = fullcircle scaled 4r shifted point 0 of a;
d = fullcircle scaled 2 abs (point 2 of a - point 1 of b) 
               shifted point 2 of a;
egg = subpath (0, 1) of b .. point 2 of d .. 
      subpath (3, 4) of c .. subpath (5, 7) of a .. cycle;
beginfig(1);
fill egg withpen pencircle scaled 2 withcolor eggshell;
picture P; P = currentpicture;
drawoptions(withpen pencircle scaled 1/4 withcolor dark_eggshell);
draw a; draw d;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw point 1 of egg -- point 4 of egg --
     point 0 of egg -- point 3 of egg;
draw egg;
drawoptions(withpen pencircle scaled 2 withcolor 7/16);
draw center a;
draw center d;
draw numbered_points(egg);
drawoptions();
draw P shifted 240 right;
endfig;
\end{mplibcode}
\end{document}
