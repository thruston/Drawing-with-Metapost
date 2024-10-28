\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibshowlog{enable}
\begin{mplibcode}
randomseed:=2321.57867;
input colorbrewer-rgb
vardef bush(expr start, aim, level, limit) = 
  save s, target; pair target; numeric s; s = level / limit;
  for a = -32, -8, 8, 16:
    target := aim scaled ((64 + 32 normaldeviate) * s) rotated a shifted start;
    draw start -- target withpen pencircle scaled s withcolor BrBG[limit][limit-level];
    if level > 1: bush(target, aim rotated a, level - 1, limit); fi
  endfor
enddef;
beginfig(1); bush(origin, dir 80, 6, 8); endfig;
\end{mplibcode}
\end{document}

