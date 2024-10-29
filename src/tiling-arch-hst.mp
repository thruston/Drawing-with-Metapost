\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb

beginfig(1);
  path t[], s[], h;
  h = for i=0 upto 5: 42 dir 60i -- endfor cycle;
  for i = 1 upto 3:
    s[i] = unitsquare zscaled (point i-1 of h - point i of h) shifted point i of h;
  endfor
  t1 = point 1 of h -- point 3 of s1 -- point 2 of s2 -- cycle;
  t2 = point 2 of h -- point 3 of s2 -- point 2 of s3 -- cycle;

  picture unit;
  unit = image(
    for i=1 upto 2:
      fill t[i] withcolor Blues 8 4;
    endfor
    for i=1 upto 3:
      fill s[i] withcolor Greens 8 1;
    endfor
    fill h withcolor Oranges 9 4;
    forsuffixes $=t1, t2:
      pair m; m = 2/3[point 0 of $, point 3/2 of $];
      for i=1 upto 3:
        draw m -- point i+1/2 of $ withcolor Blues 8 8;
      endfor
    endfor
    forsuffixes $=s1, s2, s3:
      draw point 1/2 of $ -- point 5/2 of $ withcolor Oranges 8 8;
      draw point 3/2 of $ -- point 7/2 of $ withcolor Blues 8 8;
    endfor
    for i=1 upto 3:
      draw point i-1/2 of h -- point i+5/2 of h withcolor Oranges 8 8;
    endfor
  );

  pair u, v;
  u = point 3 of s2 - point 4 of h;
  v = u rotated 60;

  numeric n; n=4;
  for i=-n upto n:
    for j=-n upto n:
      draw unit shifted (i*u + j*v - floor (j/2) * u);
    endfor
  endfor
  clip currentpicture to fullcircle scaled (7/4n * abs(u));
endfig;
\end{mplibcode}
\end{document}
