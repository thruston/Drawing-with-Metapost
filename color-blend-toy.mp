\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  color brg, pbr; 
  brg = 1/256 (1, 66, 37);
  pbr = 1/256 (223, 52, 57);
  N = 5; n = 0;
  for y=1 upto N:
    for x=1 upto N:
      fill fullcircle scaled 16 shifted 20(x,y)
        withpen pencircle scaled 2
        withcolor (n/N/N)[pbr, brg];
      label(decimal incr n infont "phvr8r", 20(x,y)) 
        withcolor white;
    endfor
  endfor
endfig;
\end{mplibcode}
\end{document}
