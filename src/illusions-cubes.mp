\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(2);
  numeric u, v;
  u = 60;
  v = 21 * sqrt(3);
  path face[];
  for i=0 upto 2:
    face[i] = unitsquare scaled u rotated 45 yscaled (1/sqrt(3)) rotated (120-120i);
  endfor
  picture cube, sides;
  cube = image(
    for i=0 upto 2:
      fill face[i] withcolor Oranges[8][i+1];
    endfor
    for i=0 upto 2:
      draw subpath (1, 4) of face[i];
    endfor
  );
  sides = image(
    for i=0, 2:
      fill face[i] withcolor Oranges[8][i+1];
    endfor
    for i=0, 2:
      draw face[i];
    endfor
  );
  draw cube shifted (0u, 2v);
  draw cube shifted (0u, 4v);
  draw cube shifted (0u, 6v);
  draw cube shifted (1u, 5v);
  draw cube shifted (2u, 4v);
  draw cube shifted (3u, 3v);
  draw cube shifted (2u, 2v);
  draw cube shifted (u, v);
  draw cube;
  draw sides shifted (0u, 2v);
endfig;

\end{mplibcode}
\end{document}
