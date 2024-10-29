\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
\mplibtextextlabel{enable}
vardef antireuleaux(expr n, r) =
  save a; numeric a; a = 90/n;
  for t = 0 step 4a until 359:
    (0, r) rotated t {left rotated (3a + t)} .. {left rotated (a + t)}
  endfor cycle
enddef;
vardef median(expr p) = origin for i=1 upto length p: + point i of p / length p endfor enddef;
input colorbrewer-rgb
beginfig(1);
  for n = 3 upto 7:
    path p; p = antireuleaux(n, 42) shifted (90n, 0);
    pair m; m = point (n+1)/2 of p;
    fill p withcolor if odd n: Oranges else: Blues fi 8 2;
    draw p;
  endfor
endfig;
\end{mplibcode}
\end{document}

