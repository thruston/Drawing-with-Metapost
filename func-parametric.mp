\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path p; 
numeric a, b, j, k;  a = 144; b = 89; j = 3; k = 2;
p = for t = 0 upto 360: 
    (a * cosd(j * t), b * sind(k * t)) ...
endfor cycle;

draw p withcolor 2/3 red;

path xx, yy;
xx = (left -- right) scaled 150;
yy = (down -- up) scaled 100;
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);

endfig;
\end{mplibcode}
\end{document}

