\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
  path s; 
  s = unitsquare shifted -(1/2,1/2) scaled 12 xscaled 1.6;
y = 0;
forsuffixes $ = Blues, Reds, RdYlBu, BrBG, Paired:
  label.lft("\texttt{" & str $ & "..}", (10, y));
  for x = 1 upto 9:
    fill s shifted (24x, y) withcolor $[9][x];
  endfor
  y := y - 20;
endfor
for x = 1 upto 9:
  label("\texttt{..9" & decimal x & "}", (24x,16));
endfor
endfig;
\end{mplibcode}
\end{document}

