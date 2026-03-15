\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
input seq-simple-line-common
vardef jump(expr a, b, u, dy) = 
  save p, q; pair p, q; p = (a*u, dy); q = (b*u, dy);
  p {dir  (if a < b: if dy < 0: - else: + fi 30
           else: 180 if dy < 0: + else: - fi 30 fi)} .. q 
    cutbefore fullcircle scaled 12 shifted p
    cutafter  fullcircle scaled 12 shifted q
enddef;
drawarrow jump(1, 5, u, 12) withcolor blue;
drawarrow jump(3, -2, u, -4) withcolor red;
endfig;
\end{mplibcode}
\end{document}
