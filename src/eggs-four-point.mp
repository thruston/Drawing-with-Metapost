\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input eggs-common
beginfig(1);

path egg, a, b, c, d;
a = fullcircle scaled 80;
b = a scaled 2 shifted point 6 of a;
c = halfcircle scaled 2 (abs(point 0 of a - point 5 of b) - abs(point 0 of a));
d = fullcircle scaled 2 abs(point 2 of a - point 2 of c) shifted point 2 of c;
egg = point 0 of c {up} .. subpath (1,3) of d .. {down} point 4 of c .. subpath (5, 7) of b .. cycle;

fill egg withpen pencircle scaled 2 withcolor 3/4[1/4[red, green], white];
picture P; P = currentpicture;
drawoptions(withpen pencircle scaled 1/4 withcolor darker_eggshell);
draw a; draw b; draw c; draw d;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw point 0 of c -- point 3 of egg;
draw point 4 of c -- point 1 of egg;
draw point 0 of a -- point 5 of egg;
draw point 4 of a -- point 7 of egg;
draw point 0 of c -- point 4 of c;
draw point 2 of d -- point 6 of b;
draw egg;
drawoptions(withpen pencircle scaled 2 withcolor 7/16);
for i=1 upto length egg: 
    draw point i of egg;
    label(decimal i, point i of egg scaled 1.06);
endfor;
draw point 0 of a;
draw point 4 of a;
draw point 6 of a;
draw point 2 of c;
drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

