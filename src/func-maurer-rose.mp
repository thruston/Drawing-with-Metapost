\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  path r, k; 
  r = for t = 1 upto 360: cosd 2t * dir t .. endfor cycle;
  r := r scaled 150;
  k = for t = 1 upto 360: point 29t of r -- endfor cycle;

  draw k dashed withdots scaled 1/8
    withpen pencircle scaled 1/4 
    withcolor 1/2[blue, white];

  draw r withcolor 2/3 red;

  path xx, yy;  % you might nor need the axes...
  xx = (left -- right) scaled 160;
  yy = (down -- up) scaled 160;
  drawarrow xx; label.rt("$x$", point 1 of xx);
  drawarrow yy; label.top("$y$", point 1 of yy);
endfig;
\end{mplibcode}
\end{document}
