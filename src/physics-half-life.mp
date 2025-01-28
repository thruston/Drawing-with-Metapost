\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato Light}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def thickly = withpen pencircle scaled 3/4 enddef;
def thinly =  withpen pencircle scaled 1/4 enddef;

beginfig(1);
  path xx, yy, decay;
  numeric u, v;
  u = 72; v = 144;

  decay = ((0,1) .. (1, 1/2) .. (2, 1/4) .. (3, 1/8) .. (4, 1/16)) xscaled u yscaled v;

  xx = origin -- (4.5u, 0);
  yy = origin -- (0, 1.2v);

  ahangle := 30;

  interim labeloffset := 4;
  for i = 1, 2, 3:
    path m; m = (0, ypart point i of decay) -- point i of decay -- (xpart point i of decay, 0);
    draw m dashed evenly thinly;
    label.lft("$1/" & decimal (2**i) & "$", point 0 of m);
    label.bot("$" & if i > 1: decimal i & fi "T$", point 2 of m);
    draw (left--right) scaled 2 shifted point 0 of m;
    draw (down--up) scaled 2 shifted point 2 of m;
  endfor
  label.bot("$0$", origin);
  label.lft("$1$", (0, v));
  draw (left--right) scaled 2 shifted (0, v);

  draw decay withcolor 2/3 red;
  drawarrow xx; label.llft("TIME", point 1 of xx);
  drawarrow yy; label.rt("RADIOACTIVITY", point 1 of yy); 




endfig;
\end{mplibcode}
\end{document}

