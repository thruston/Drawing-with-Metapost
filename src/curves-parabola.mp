\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  pair A, S; A = origin; S = 66 right;
  path parabola, last; 
  for q = -144 step 8 until 144:
    pair Q; Q = q * up; path ray; 
    ray = Q -- Q + 300 unitvector(S - Q) rotated if q < 0: - fi 90;
    draw S -- ray withcolor 7/8;
    if known last:
      pair t; t = whatever[point 0 of ray, point 1 of ray] 
                = whatever[point 0 of last, point 1 of last];
      parabola := if known parabola: parabola .. fi t;
    fi
    last := ray;
  endfor
  draw parabola withcolor 3/4[red, white];
  for t=0 upto length parabola:
    draw point t of parabola withpen pencircle scaled 3/2 withcolor red;
  endfor
  draw (up--down) scaled 300;
  dotlabel.lft("$A$", A); dotlabel.rt("$S$", S);
endfig;
\end{mplibcode}
\end{document}
