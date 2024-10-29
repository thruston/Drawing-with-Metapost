\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input tiling-arch-snub-hex-parts
beginfig(1);
draw P0 shifted 180 up;
draw P2 shifted 180 down;
numeric wd; wd = xpart (urcorner P0 - llcorner P0);
currentpicture := currentpicture scaled (250/wd); 
endfig;
\end{mplibcode}
\end{document}
