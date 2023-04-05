\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input arch-snub-hex-parts
beginfig(1);
    draw unit1 rotated 210;
    draw unit2 rotated 210 shifted 100 left;
endfig;
\end{mplibcode}
\end{document}
