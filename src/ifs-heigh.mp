\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
path p; p = origin -- right rotated 30;
numeric n;
for i=1 upto 12:
    n := length p;
    p := p rotated 45;
    p := p & reverse p rotatedabout(point n of p, 90);
endfor
draw p scaled (384 / xpart (urcorner p - llcorner p))
    withcolor (.2, .2, .7);
endfig;
\end{mplibcode}
\end{document}

