\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  numeric u; u = 1cm; 
  path xx; xx = (2 left -- 10 right) scaled u;
  path yy; yy = (down -- 7 up) scaled u;

  numeric theta, psi; psi = 28; theta = 50;
  pair P, Q, H, N, M, T, L;  P = (4, 3) scaled u;

  path ell, tee, arc;
  ell = (left--right) scaled 10u rotated theta shifted P cutbefore xx;
  tee = (left--right) scaled 10u rotated psi   shifted P cutbefore xx;
  arc = subpath (1.6, 3.2) of halfcircle rotated -180 shifted 1/2 up 
        scaled 10u shifted P rotatedabout(P, psi);

  Q = ell intersectionpoint subpath (1.5, 3) of arc;
  H = P + whatever * dir psi;  
  xpart H = xpart Q = xpart M;  ypart M = ypart N = 0;
  xpart N = xpart P;
  L = point 0 of ell;
  T = point 0 of tee;

  % now we can get with the drawing
  draw arc withcolor 1/2 red;
  draw P--N dashed withdots scaled 1/2;
  draw Q--M dashed withdots scaled 1/2;
  drawarrow xx; label.rt("$x$", point 1 of xx);
  drawarrow yy; label.top("$y$", point 1 of yy);
  drawoptions(withcolor 2/3 blue);
    draw fullcircle scaled 32 shifted T cutafter tee;
    draw fullcircle scaled 28 shifted L cutafter ell;
    label("$\psi$", 24 right rotated 1/2 psi shifted T);
    label("$\theta$", 20 right rotated 1/2 theta shifted L);
  drawoptions();

  % draw the lines trimmed neatly
  path invisible_boundary;
  z1 = point .95 of xx;
  z2 = point .95 of yy;
  invisible_boundary = z1--(x1,y2)--z2;
  draw ell cutafter invisible_boundary;
  draw tee cutafter invisible_boundary;

  % and finally label the points.
  forsuffixes @ = T, L, N, M: label.bot("$" & str @ & "$", @); endfor
  forsuffixes @ = H, P, Q: dotlabel.lrt("$" & str @ & "$", @); endfor
endfig;
\end{mplibcode}
\end{document}
