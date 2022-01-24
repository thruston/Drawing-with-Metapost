\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
vardef equilateral_triangle_point(expr a, b) =
  b shifted -a rotated 60 shifted a
enddef;
beginfig(1);
path c; c = fullcircle scaled 144;
numeric n; n = 8;
for i=0 upto n-1:
  pair a,b,p,q;
  a = point 8/n * i of c;
  b = point 8/n * (i + 1) of c;
  p = equilateral_triangle_point(a,b);
  q = equilateral_triangle_point(b,a);
  draw a -- p -- b withcolor .67 green;
  draw a -- q -- b withcolor .67 red;
endfor
draw c withcolor .53 blue;
endfig;
\end{mplibcode}
\end{document}
