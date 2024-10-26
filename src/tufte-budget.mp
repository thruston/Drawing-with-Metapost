\documentclass{standalone}
\usepackage{luamplib}
\usepackage{unicode-math}
\setmainfont[Numbers=OldStyle]{TeX Gyre Pagella}
\setmathfont{TeX Gyre Pagella Math}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input tufte-manila-paper
beginfig(1);
  path data; numeric n;
  data = (1967, 311) -- (1968, 332) -- (1969, 372) -- (1970, 385) 
      -- (1971, 385) -- (1972, 393) -- (1973, 387) -- (1974, 381)
      -- (1975, 387) -- (1976, 400) -- (1977, 380);
  n = length data; 
  numeric u, v; path p;  % make data --> p
  u = xpart urcorner textext("1980\kern 0.75em"); v = 1.414;
  p = data shifted -(xpart point 0 of data, 300) xscaled u yscaled v;
  for i=0 upto n: z[i] = point i of p; endfor
  for d = 300 step 20 until 400: % y-axis
    numeric y; y =  (d - 300) * v; draw (-8, y) -- (-12, y);
    label.lft("\strut\scriptsize\$\,\small" & decimal d, (-12, y));
  endfor
  path a, b, c;  % annotating lines
  a = (x3, y[n-1]) -- (x[n] + 8, y[n-1]);
  b = (x3, y[n])   -- (x[n] + 8, y[n]);
  c = (x[n] + 21, y[n]) -- (x[n] + 21, y[n-1]);
  drawoptions(withpen pencircle scaled 1/4);
    draw a dashed evenly scaled 1/4;
    draw b dashed evenly scaled 1/4;
    draw c; 
    for i=0,1: draw (left--right) scaled 2 shifted point i of c; endfor
    label("\small 5\%", point 1/2 of c shifted 12 right);
  drawoptions();
  draw p;  % the data points
  for i = 0 upto n:
    undraw z[i] withpen pencircle scaled 2 dotlabeldiam;
    draw z[i] withpen pencircle scaled dotlabeldiam;
    draw (x[i], -8) -- (x[i], -12);
    label("\strut\small" & decimal xpart point i of data, (x[i], -20));
  endfor
  label.urt(btex \vbox{\halign{\small #\hfill\cr Per capita\cr 
    budget expenditure\cr in constant dollars\cr}} etex, (x0,y[n-1]+10v));
endfig;
\end{mplibcode}
\end{document}
