\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input eggs-common

numeric r, a, b, t; a = 60; b = 45; r = a ++ b;
pair p, q; p = -q = (b, 0); 
path base, cap, egg;
base = subpath (4, 8) of fullcircle scaled 2(2r-b);
cap = subpath (0, 4) of fullcircle scaled 2r shifted (0, a)
      cutbefore ((b, 0) -- (b, 2r))
      cutafter  ((-b, 0) -- (-b, 2r));  
egg = point 4 of base {up} .. cap .. {down} base & cycle;
% more naturally "base {up} .. cap .. {down} & cycle"
% but then point 0 would not be at 3 o'clock

beginfig(1);
fill egg withpen pencircle scaled 2 withcolor eggshell;
picture P; P = currentpicture;
fill origin -- (-b, 0) -- (0, a) -- cycle withcolor light_eggshell;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
label.top("$\scriptstyle 3$", (-1/2b, 0));
label.lft("$\scriptstyle 4$", (0, 1/2a));
label.ulft("$\scriptstyle 5$", 1/2[(-b, 0), (0, a)]);

draw fullcircle scaled 2(2r-b);           draw origin withpen pencircle scaled 2;
draw fullcircle scaled 2r shifted (0, a); draw (0, a) withpen pencircle scaled 2;

draw p -- subpath (3, 4) of egg -- cycle;  draw p withpen pencircle scaled 2;
draw q -- subpath (0, 1) of egg -- cycle;  draw q withpen pencircle scaled 2;

draw numbered_points(egg);

drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

