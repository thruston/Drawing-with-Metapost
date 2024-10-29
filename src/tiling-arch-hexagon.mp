\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);

  path h[]; pair m[];
  for i=0 upto 2:
    h[i] = (for j=0 upto 5: 30 dir 60j -- endfor cycle);
    h[i] := h[i] shifted - point 0 of h[i] rotated (30+120i);
    m[i] = 1/2[point 0 of h[i], point 3 of h[i]];
  endfor

  picture unit;
  unit = image(
    numeric i; i = -1;
    forsuffixes $ = Purples, Oranges, Blues:
      pair m; m = m[incr i];
      for j=1 upto 3:
        fill subpath (-2i+2j, 2-2i+2j) of h[i] -- m -- cycle withcolor $[8][1+j];
      endfor
      for j=1 upto 3:
        draw m -- point 2j of h[i] withcolor $[8][1];
      endfor
    endfor

  );

  pair u, v;
  u = point 3 of h1 - point 1 of h0;
  v = u rotated 60;

  numeric n; n = 4;
  for i=-n upto n:
    for j=-n upto n:
      draw unit shifted (i*u + j*v);
    endfor
  endfor

  path se; se = superellipse(right, up, left, down, 0.86);
  clip currentpicture to se scaled 168;

endfig;
\end{mplibcode}
\end{document}
