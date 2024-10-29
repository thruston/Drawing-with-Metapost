\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef poly expr n of p = 
  clearxy; z0 = point 0 of p; z1 = point 1 of p;
  for i=2 upto n-1:
    z[i] = z[i-2] rotatedabout(z[i-1], 360/n-180);
  endfor
  for i=0 upto n-1: z[i] -- endfor cycle
enddef;
beginfig(1);
  path P[]; P3 = for i=0 upto 2: 6 up rotated 120i -- endfor cycle;
  fill P3 withcolor 3/4 red; undraw P3;
  for n = 4 upto 23:
    numeric m; m = floor(n / 2);
    P[n] = poly n of subpath (m, m-1) of P[n-1];
    fill P[n] withcolor (n/48)[3/4 if odd n: red else: blue fi, white];
    undraw P[n]; label(decimal n, center P[n]) withcolor white;
  endfor
endfig;
\end{mplibcode}
\end{document}
