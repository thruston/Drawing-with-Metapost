\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input arch-snub-hex-parts
beginfig(1);
draw P1 shifted 180 left;
draw P2 shifted 180 right;
currentpicture := currentpicture rotated 90;
endfig;
\end{mplibcode}
\end{document}
