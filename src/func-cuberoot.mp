\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path xx, yy;
xx = (left -- right) scaled 150;
yy = (down -- up) scaled 50;

numeric n; n = 6;

path ff; ff = origin {right} for x = 1 upto n: ... {1, 3x*x} (x, x*x*x) endfor;
ff := ff reflectedabout(origin, dir 45);
ff := reverse ff rotated 180 & ff;
ff := ff xscaled (150/n/n/n) yscaled (50/n);

for i = 1-n upto n-1:
    draw yy shifted (i * xpart directionpoint (1, 1/3) of ff, 0) withcolor 7/8;
endfor
for i = -1, 1:
    draw xx shifted (0, i * ypart directionpoint (1, 1/3) of ff) withcolor 7/8;
endfor

draw ff withcolor 2/3 blue;

label("$y = \sqrt[3]x$", (-84, 14));
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);

endfig;
\end{mplibcode}
\end{document}

