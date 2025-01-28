\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato Light}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\mplibnumbersystem{decimal}
\begin{document}
\begin{mplibcode}

input physics-thatch
input physics-coiled

beginfig(1);


  path block, wire, mass;

  block = unitsquare shifted 1/2 left xscaled 42 yscaled 8;
  wire = origin -- 64 down;
  mass =  unitsquare shifted 1/2 left xscaled 10 yscaled -6 shifted point 1 of wire;

  thatch block;
  draw subpath (-1, 2) of block withpen pencircle scaled 3/4;

  filldraw mass withpen pencircle scaled 1;

  draw coiled wire;

endfig;
\end{mplibcode}
\end{document}


