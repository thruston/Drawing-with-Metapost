\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

path base, cup, cap, egg;

base = fullcircle scaled 200;
z0 = origin;
numeric n; n = 0;
for t = 0, 4:
    for a=-30, 30:
        z[incr n] = point t of base rotated a;
    endfor
endfor
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

egg = cup {up} .. z2 .. cap .. z3 .. {down} cycle;


fill egg withpen pencircle scaled 2 withcolor 3/4[1/4[red, green], white];
picture P; P = currentpicture;
fill z4 -- z5 -- z6 -- cycle withcolor 7/8[3/16[red, green], white];

drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
label.top("$\scriptstyle \sqrt 3$", 1/2[z4, z6]);
label.lft("$\scriptstyle \sqrt 4 $", z0);
label.ulft("$\scriptstyle \sqrt 7$", 1/2[z4, z5]);
draw base;  draw cap; draw cup;
draw z1 -- subpath (8, 10) of egg -- cycle;
draw z4 -- subpath (4, 6) of egg -- cycle;
draw z2 -- z3;
forsuffixes $=0, 1,4,5,6:
    draw z$ withpen pencircle scaled 2;
endfor
% dotlabels.top(1,2,3,4,5,6);
% for i=1 upto length egg: dotlabel.top(decimal i, point i of egg); endfor

drawoptions();

draw P shifted 240 right;


endfig;
\end{mplibcode}
\end{document}

