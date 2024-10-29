\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
  path o; numeric r; r = 1/4;
  o = (for i=0 upto 3: subpath (i+r, i+1-r) of unitsquare shifted -(1/2, 1/2) -- endfor cycle) scaled 42;
  picture unit; path s; s = unitsquare scaled arclength subpath (1, 3/2) of o
  rotated -45 shifted point 3/2 of o;
  unit = image(
    fill o withcolor Blues 8 5;
    for i=0 upto 3: fill s rotated 90i; endfor
  );

  pair u, v; u = 42 right; v = u rotated 90; numeric n; n = 3;
  for i=-n upto n:
    for j=-2n upto 2n:
      draw unit if (i+j) mod 4 < 2: reflectedabout (dir 135, dir -45) fi
        shifted ((2i + j mod 2)*u  + j*v);
    endfor
  endfor

endfig;
\end{mplibcode}
\end{document}

