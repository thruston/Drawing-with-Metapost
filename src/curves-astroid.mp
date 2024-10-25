\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  path base; base = fullcircle scaled 300;
  path astroid; astroid = for t=0 step 1/16 until 8: 
    hide(pair a, b, p; 
      a = (xpart point t of base, 0); b = (0, ypart point t of base); 
      p = whatever[a,b]; p - point t of base = whatever * (a-b) rotated 90;
    ) p -- endfor cycle;
  for t=0 step 1/16 until 8: 
    draw (xpart point t of base, 0) -- (0, ypart point t of base) withcolor 7/8;
  endfor
  draw astroid withcolor 2/3 red;
endfig;
\end{mplibcode}
\end{document}

