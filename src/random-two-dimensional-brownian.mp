\documentclass{standalone}
\usepackage{luamplib}
\mplibshowlog{enable}
\begin{document}
\begin{mplibcode}
beginfig(1);
% randomseed := uniformdeviate infinity;
randomseed := 2141.34242;
numeric u, v; u = 5; v = 4;
for n=1 upto 4:
  numeric x, y; x = y = 0;
  path w; w = (x, y) for i=1 upto 2048:
    hide(x := x + normaldeviate * u ; y := y + normaldeviate * v)
    .. (x, y) 
  endfor;
  draw w withcolor (2n/10)[white, 2/3 blue];
  draw (x, y) withpen pencircle scaled 3 withcolor 2/3 red;
endfor
draw origin withpen pencircle scaled 3 withcolor 3/4 green;
endfig;
\end{mplibcode}
\end{document}
