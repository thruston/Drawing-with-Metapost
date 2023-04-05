\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    path xx, yy;
    xx = (left -- right) scaled 130;
    yy = (down -- up) scaled 80;
    drawarrow xx;
    drawarrow yy;
    label.rt("$x$", point 1 of xx);
    label.top("$y$", point 1 of yy);
endfig;
\end{mplibcode}
\end{document}

