\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

numeric r, a, b, t; a = 60; b = 45; r = a ++ b;

z1 = -z2 = (b, 0);

path base, cap, egg;
base = subpath (4, 8) of fullcircle scaled 2(2r-b);
cap = subpath (0, 4) of fullcircle scaled 2r shifted (0, a)
      cutbefore ((b, 0) -- (b, 2r))
      cutafter  ((-b, 0) -- (-b, 2r));  



egg = cap .. {down} base {up} .. cycle;

fill egg withpen pencircle scaled 2 withcolor 3/4[1/4[red, green], white];
picture P; P = currentpicture;
fill origin -- (-b, 0) -- (0, a) -- cycle withcolor 7/8[3/16[red, green], white];
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
label.top("$\scriptstyle 3$", (-1/2b, 0));
label.lft("$\scriptstyle 4$", (0, 1/2a));
label.ulft("$\scriptstyle 5$", 1/2[(-b, 0), (0, a)]);

draw fullcircle scaled 2(2r-b);           draw origin withpen pencircle scaled 2;
draw fullcircle scaled 2r shifted (0, a); draw (0, a) withpen pencircle scaled 2;

draw z1 -- subpath (2, 3) of egg -- cycle;  draw z1 withpen pencircle scaled 2;
draw z2 -- subpath (7, 8) of egg -- cycle;  draw z2 withpen pencircle scaled 2;

drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

