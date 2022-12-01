\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

path base;  
base = fullcircle scaled 200;

pair m, n, n', p;
path a, b;

m = 1/2 point 0 of base;
a = halfcircle scaled 2 abs (point 2 of base - m) shifted m cutbefore (origin -- 1000 up);

n = point infinity of a;
n' = n reflectedabout(up, down);
b = subpath (0, 2) of base shifted n cutafter (origin -- 1000 up);

p = point infinity of b;

path dome; 
path cap, cup, egg;
dome = fullcircle 
    scaled 2 (abs(n - point 0 of base) - abs(n - point 0 of b))
    shifted p;
cap = dome
    cutbefore (point 4 of b -- 2[n, point 4 of b])
    cutafter  (point 4 of b -- 2[n', point 4 of b]);
cup = subpath (4, 8) of base;
path egg; egg = cup {up} .. cap .. {down} cycle;

fill egg withpen pencircle scaled 2 withcolor 3/4[1/4[red, green], white];
picture P; P = currentpicture;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2[1/4[red, green], white]);
draw m -- a; 
draw b; 
draw origin -- point 2 of base;

drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw n -- subpath (4, 5) of egg -- cycle;  
draw n' -- subpath (7, 8) of egg -- cycle;  
draw base; draw dome;

forsuffixes $=n, n', p, origin: draw $ withpen pencircle scaled 2; endfor
draw m withpen pencircle scaled 2 withcolor 1/2[1/4[red, green], white];

drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

