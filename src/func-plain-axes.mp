\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
path xx, yy;
xx = (left -- right) scaled 130;
yy = (down -- up) scaled 80;
drawarrow xx; label.rt(TEX("$x$"), point 1 of xx);
drawarrow yy; label.top(TEX("$y$"), point 1 of yy);
endfig;
\end{mplibcode}
\end{document}

