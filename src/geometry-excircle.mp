\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef through(expr a, b, o) = 
  save t; numeric t; t = 1+o/abs(a-b);
  t[b,a] -- t[a,b]
enddef;

vardef excircle(expr A, B, C) =
  save a, b, m, t; pair a, b, m, t;
  a = A + unitvector (C-A) - unitvector (B-A);
  b = B + unitvector (A-B) + unitvector (C-B);
  m = whatever[A,a] = whatever [B,b]; t = whatever[A,B];
  t-m = whatever * (B-A) rotated 90;
  fullcircle scaled 2 abs (t-m) shifted m
enddef;

beginfig(1);
  pair A, B, C;
  A = origin; B = 233 dir 10; C = 144 dir 70;
  pair a, b, m, t;
  a = A + 22 unitvector (C-A) - 22 unitvector (B-A);
  b = B + 22 unitvector (A-B) + 22 unitvector (C-B);
  m = whatever[A,a] = whatever [B,b]; t = whatever[A,B];
  t-m = whatever * (B-A) rotated 90;

  drawoptions(dashed evenly scaled 1/4 withcolor 1/2 white);
  draw t -- m;
  draw unitsquare scaled 5 rotated angle (B-A) shifted t;
  draw through(A, m, 10);
  draw through(A, t, 10);
  draw through(B, m, 10);
  drawoptions();
  draw excircle(A, B, C) withcolor 2/3 blue;
  draw A--B--C--cycle;
  dotlabel.urt(btex $m$ etex, m);
  dotlabel.bot(btex $t$ etex, t);
  dotlabel.bot(btex $A$ etex, A);
  dotlabel.urt(btex $B$ etex, B);
  dotlabel.top(btex $C$ etex, C);
  dotlabel.urt(btex $a$ etex, a);
  dotlabel.top(btex $b$ etex, b);
  numeric wd; wd = xpart (urcorner currentpicture - llcorner currentpicture);
  currentpicture := currentpicture scaled (333/wd); 
endfig;
\end{mplibcode}
\end{document}

