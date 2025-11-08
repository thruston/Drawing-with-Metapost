\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-cmyk
beginfig(1);
  path s; 
  s = unitsquare shifted -(1/2,1/2) scaled 12 xscaled 1.8;
y = 0;
forsuffixes $ = Blues, Reds, RdYlBu, BrBG, Paired:
  label.lft("\texttt{" & str $ & " . .}", (10, y));
  for x = 1 upto 8:
    fill s shifted (28x, y) withcolor $[8][x];
  endfor
  y := y - 20;
endfor
for x = 1 upto 8:
  label("\texttt{ 8 " & decimal x & "}", (28x,16));
endfor
endfig;
\end{mplibcode}
\end{document}

