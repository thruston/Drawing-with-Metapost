\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibnumbersystem{decimal}
\begin{mplibcode}
beginfig(1);
  path S; S = origin for t=1 upto 360: .. 1/12 t * dir 8t endfor;
  drawarrow S;
  input rope
  draw rope S shifted 64 right;
  z0 = urcorner currentpicture - llcorner currentpicture;
  currentpicture := currentpicture scaled (300 / x0);
endfig;
\end{mplibcode}
\end{document}
