\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

input tiling-ammann-procedures

beginfig(1);

  pickup pencircle scaled 1/8;
  path shape; shape = r scaled 360;

  bounded_rhomb(4, point 0 of shape, point 2 of shape);
  draw shape withpen pencircle scaled 1/2;

endfig;
\end{mplibcode}
\end{document}

