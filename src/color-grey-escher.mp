\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  numeric s; s = 8;
  path atom;
  atom = origin
  -- (2s,0) rotated -30 -- (2s,0) rotated -30 + (0,s)
  -- ( s,0) rotated  30 -- ( s,0) rotated  30 + (0,s)
  -- (0,2s) -- cycle;

  picture p[];
  for i=0 upto 2:
    p[i] = image(
      fill atom rotated -120i withcolor (7/8 - 1/8i) ;
      draw atom rotated -120i;
    );
  endfor

  pair u, v; 
  u = point 3 of atom - point 1 of atom rotated -120;
  v = u rotated 60;

  n = 13;
  for i=-n upto n:
    for j=-n upto n:
      forsuffixes $=0,1,2:
        draw p$ shifted (i*u + j*v);
      endfor
    endfor
  endfor

  clip currentpicture to 
      unitsquare shifted -(1/2,1/2) scaled 5in yscaled 0.618;
endfig;
\end{mplibcode}
\end{document}
