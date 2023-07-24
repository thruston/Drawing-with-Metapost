\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibshowlog{enable}
\begin{mplibcode}
beginfig(1);
  randomseed := 3612.11746;
  numeric w, h, n; w = 377; h = 80; n = 500;
  draw (origin--right) scaled w;
  draw (origin--right) scaled w shifted (0,+h/2) withcolor 3/4;
  draw (origin--right) scaled w shifted (0,-h/2) withcolor 3/4;
  for i=1 upto 4:
    numeric y; y = 0;
    path walk; walk = (0, y) for x=w/n step w/n until w: 
      hide(y := y + 2 normaldeviate)
      -- (x, y)
    endfor;
    undraw walk withpen pencircle scaled 3/4;
    draw walk withcolor (1/2+y/h)[red, blue];
    label.rt("$\scriptstyle" & decimal i & "$", 
    point infinity of walk);
  endfor
endfig;
\end{mplibcode}
\end{document}

