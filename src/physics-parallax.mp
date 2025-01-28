\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato Light}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
picture sun, earth, star;
sun = image(
  fill fullcircle scaled 36 withcolor white;
  for i=1 upto 26: fill ((1/2 down -- (if odd i: 24 else: 12 fi + 2 normaldeviate ) * right -- 1/2 up -- cycle) shifted 16 right) rotated 13.846i; endfor
  label("SUN", origin);
);

star = image(
  fill fullcircle scaled 9 withcolor white;
  for i=1 upto 8: fill ((1/8 down -- (if odd i: 2 else: 4 fi + 1/8 normaldeviate ) * right -- 1/8 up -- cycle) shifted 1/2 right) rotated 45i; endfor 
);

earth = image(
  path e; e = fullcircle scaled 8;
  fill e withcolor white;
  fill subpath (-2,2) of e -- cycle withcolor 1/4;
  draw e withpen pencircle scaled 1/4;
);

path orbit; 
orbit = fullcircle scaled 300 yscaled 1/2 rotated -50;



beginfig(1);
  pair s; s = (400, 90);
  draw point 4 of orbit -- orbit dashed evenly;
  draw (4 dir 50) shifted point 4 of orbit -- s -- (4 dir 10) shifted point 0 of orbit
    dashed withdots scaled 1/4;
  draw sun scaled 7/8;
  draw star shifted s; label.top("STAR", s + 7 up);
  draw earth rotated angle direction 6 of orbit shifted point 0 of orbit;
  draw earth rotated angle direction 2 of orbit shifted point 4 of orbit;
  label.ulft("EARTH", point 4 of orbit + 4 left);
  label.lrt("EARTH, six months later", point 0 of orbit + 4 right);



endfig;
\end{mplibcode}
\end{document}

