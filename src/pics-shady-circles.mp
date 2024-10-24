\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  numeric r; r = 42; z1 = 5/4 r * left; z2 = 2r * right;  
  path c[]; 
  c1 = fullcircle scaled 2 abs z1 shifted z1;
  c2 = fullcircle scaled 2 abs z2 shifted z2;
  c3 = fullcircle scaled abs(z2-z1) shifted 1/2[z1,z2];
  numeric t, u;
  (t, whatever) = c2 intersectiontimes c3;
  (u, whatever) = c1 intersectiontimes (point t of c2 -- z1);
  
  path s; 
  s = subpath (0, u) of c1 -- subpath (t, 4) of c2 -- cycle;
  numeric gap; gap = 2;
  for i=0 upto 2r / gap:
    draw (origin--right) scaled 2r rotated 45t shifted (gap*i,0) 
      withpen pencircle scaled 1/4 withcolor 2/3 blue;
  endfor
  clip currentpicture to s;

  draw c1; draw c2; 
  draw z1 -- z2 -- point t of c2 -- cycle;
endfig;
\end{mplibcode}
\end{document}
