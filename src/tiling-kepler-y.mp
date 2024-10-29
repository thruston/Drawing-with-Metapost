\documentclass[border=0mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path o; 
o = for i=0 upto 7: 8 right rotated (45/2 + 45i) -- endfor cycle;
numeric a, b; 
a = abs(point 1/2 of o - point 9/2 of o);
b = abs(point 0 of o - point 1 of o);
o := o shifted 1/2(2a + b, a);
path s, t, x;
s = unitsquare zscaled (point 4 of o - point 5 of o) shifted point 5 of o;
t = unitsquare zscaled (point 6 of o - point 7 of o) shifted point 7 of o;
x = unitsquare zscaled (point 7 of o - point 8 of o) shifted point 8 of o;

input colorbrewer-rgb

picture unit;
unit = image(
  for i=0 upto 7:
    fill o rotated 45i withcolor Oranges 8 3;
    draw o rotated 45i;
    fill s rotated 45i withcolor Blues 8 2;
    draw s rotated 45i;
  endfor
  for i = 0, 1, 2, 3, 5, 7:
    fill t rotated 45i withcolor Blues 8 4;
    draw t rotated 45i;
  endfor
  for i = 1, 3, 5, 7:
    fill x rotated 45i withcolor Blues 8 4;
    draw x rotated 45i;
  endfor
);

beginfig(1);
  pair u, v; u = 2 center t; v = u rotated 90;
  n = 4;
  for i=-n upto n:
    for j = -n upto n:
      draw unit shifted (i * u + j * v);
    endfor
  endfor

  clip currentpicture to unitsquare shifted -(1/2, 1/2) yscaled sqrt(2) scaled 105mm;

endfig;
\end{mplibcode}
\end{document}
