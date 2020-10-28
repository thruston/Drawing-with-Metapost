
\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef excircle(expr A,B,C) = 
  save a, b, m, t; pair a, b, m, t;
  a = A + unitvector (C-A) - unitvector (B-A);
  b = B + unitvector (A-B) + unitvector (C-B);
  m = whatever[A,a] = whatever [B,b]; t = whatever[A,B];
  t-m = whatever * (B-A) rotated 90;
  fullcircle scaled 2 abs (t-m) shifted m
enddef;
beginfig(1);

    z0 = origin; z1 = 89 dir 10; z2 = 55 dir 72;

    draw z0--z1--z2--cycle;

    draw excircle(z0,z1,z2);
    draw excircle(z1,z2,z0);
    draw excircle(z2,z0,z1);


endfig;
\end{mplibcode}
\end{document}

