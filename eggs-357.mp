\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input eggs-common
beginfig(1);

path base, cup, cap, egg;

base = fullcircle scaled 180;
z0 = origin;
z1 = point -2/3 of base;
z2 = point  2/3 of base;
z3 = point 10/3 of base;
z4 = point 14/3 of base;
z5 = 1/2[z2, z3];
z6 = 1/2[z4, z1];

numeric a, b, c;
a = abs(z3 - z1);
b = a - abs(z4 - z6);
c = a - abs(z4 - z5);

cup = subpath (4, 8) of fullcircle scaled 2b shifted z6;
cap = fullcircle scaled 2c shifted z5
      cutbefore (z5 -- 2[z4, z5])
      cutafter (z5 -- 2[z1, z5]);

egg = point 4 of cup {up} .. cap .. {down} cup & cycle;

fill egg withpen pencircle scaled 2 withcolor eggshell;
picture P; P = currentpicture;
fill z4 -- z5 -- z6 -- cycle withcolor light_eggshell;

drawoptions(withpen pencircle scaled 1/4 withcolor dark_eggshell);
label.top("$\scriptstyle \sqrt 3$", 1/2[z4, z6]);
label.lft("$\scriptstyle \sqrt 4 $", 10 down);
label.ulft("$\scriptstyle \sqrt 7$", 7/16[z4, z5]);
draw base;  
draw z1 -- z2 -- z3 -- z4 -- z6 -- z5;
draw z0 withpen pencircle scaled 2;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw point 0 of egg -- point 4 of egg;
draw z4 -- point 1 of egg;
draw z1 -- point 3 of egg;
draw egg;
drawoptions(withpen pencircle scaled 2 withcolor 7/16);
forsuffixes $=1,4,5,6: draw z$; endfor
draw numbered_points(egg);
drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

