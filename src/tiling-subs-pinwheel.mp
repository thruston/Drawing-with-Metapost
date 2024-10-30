\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input tiling-pinwheel-macro
beginfig(1);
  pair a, b, c; a = origin; b = 460 right; c = 1/2 b rotated 90;
  drawoptions(withpen pencircle scaled 1/8 withcolor white);
    pinwheel(5, a, b, c, ""); 
  drawoptions();
  draw currentpicture rotatedabout(1/2[b,c], 180);
  currentpicture := currentpicture rotated 90;
endfig;
\end{mplibcode}
\end{document}
