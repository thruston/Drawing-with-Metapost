% inspired by Grünbaum & Shephard - fig 8.0.1
\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
  numeric r, s; s = 9; r = 2s * (sind(75)-sind(45));
  path a; a = unitsquare rotated -45 scaled s shifted (r, 0);
  picture unit; unit = image(
    for t=0 upto 5:
      fill a rotated 60t withcolor Spectral[6][t mod 3 + 3];
      draw a rotated 60t;
    endfor
  );
  pair u, v;
  u = (2s * sind(75), 0); u := u + u rotated 60; u := u rotated 60;
  v = u rotated 60;
  numeric n; n = 5;
  for i = -n upto n:
    for j = -n upto n:
      draw unit shifted (i*u + j*v - floor(j/2)*u);
    endfor
  endfor
endfig;
\end{mplibcode}
\end{document}

