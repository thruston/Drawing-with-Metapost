\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
path p; p = origin -- dir 30;
numeric n, r; r = 3;
for i=1 upto 12:
  n := length p; 
  p := p rotated (45 - r);
  p := p & reverse p rotatedabout(point n of p, 90 + 2r);
endfor
draw p scaled (384 / xpart (urcorner p - llcorner p)) withcolor .54 red;
endfig;
\end{mplibcode}
\end{document}

