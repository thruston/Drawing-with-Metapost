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
input physics-decorations

beginfig(1);


  path block, wire, mass;

  block = unitsquare shifted 1/2 left xscaled 50 yscaled 10; 
  wire = origin -- 68 down; 
  mass =  unitsquare shifted 1/2 left xscaled 10 yscaled -6 shifted point 1 of wire;

  thatch_space := 3;
  thatch block;
  draw subpath (-1, 2) of block withpen pencircle scaled 3/4;

  filldraw mass withpen pencircle scaled 1;

  draw springy(wire, 10);

  label.lft("$m$", point -1/2 of mass);

  ahangle := 30;
  x0 = xpart point 1 of block; y0 = -39; 
  x1 = 1/2 x0; y1 = y0;
  x2 = x1; y2 = ypart point 1 of mass + 1/2;

  path a[];
  a1 = z0 -- (2.6, y0);
  a2 = z1 -- z2;
  a3 = (6 left -- 4 right) shifted z2;

  drawoptions(withpen pencircle scaled 1/4);
  drawarrow a1;
  drawarrow a2;
  draw a3;
  drawoptions();
  
  picture x; x = thelabel("$x$", point .45 of a2); unfill bbox x; draw x;

  label.rt("\vbox to 8pt{\small\halign{#\hfill\cr EQUILIBRIUM\cr POSITION\cr}\vss}", z0);


endfig;
\end{mplibcode}
\end{document}


