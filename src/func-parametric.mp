\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path xx, yy;
xx = (left -- right) scaled 150;
yy = (down -- up) scaled 100;
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);
path p; 
p = for t = 0 upto 360: (144 cosd(3t), 89 sind(2t)) ... endfor cycle;
draw p withcolor 2/3 red;
endfig;
\end{mplibcode}
\end{document}

