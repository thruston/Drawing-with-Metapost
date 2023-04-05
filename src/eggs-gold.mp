\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input eggs-common
beginfig(1);

path base;  
base = fullcircle scaled 200;

pair m, n, n', p;
path aa, bb;

m = 1/2 point 0 of base;
aa = halfcircle scaled 2 abs (point 2 of base - m) shifted m cutbefore (origin -- 1000 up);
n = point infinity of aa;
n' = n reflectedabout(up, down);
bb = subpath (0, 2) of base shifted n cutafter (origin -- 1000 up);
p = point infinity of bb;

path dome; 
path cap, cup, egg;
dome = fullcircle 
    scaled 2 (abs(n - point 0 of base) - abs(n - point 0 of bb))
    shifted p;
cap = dome
    cutbefore (point 4 of bb -- 2[n, point 4 of bb])
    cutafter  (point 4 of bb -- 2[n', point 4 of bb]);
cup = subpath (4, 8) of base;
path egg; egg = point 4 of cup {up} .. cap .. {down} cup & cycle;

fill egg withpen pencircle scaled 2 withcolor eggshell;
picture P; P = currentpicture;
drawoptions(withpen pencircle scaled 1/4 withcolor dark_eggshell);
draw m -- aa; 
draw bb; 
draw origin -- point 2 of base;
draw base; draw dome;
label.bot("$m$", m);
label.ulft("$n$", n);
label.urt("$n'$", n');
% label.lft("$p$", p);

drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw n -- point 1 of egg;
draw n' -- point 3 of egg;
draw point 0 of egg -- point 4 of egg;
draw egg;

forsuffixes $=n, n', p, origin: draw $ withpen pencircle scaled 2; endfor
draw m withpen pencircle scaled 2 withcolor dark_eggshell;
draw numbered_points(egg);

drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

