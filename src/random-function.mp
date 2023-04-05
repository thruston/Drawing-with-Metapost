\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

beginfig(1);
path xx, yy, ff;
xx = origin -- 233 right;
yy = origin -- 144 up;

z1 = (72, 62);
z2 = (180, 110);

ff = (xpart point 0 of xx, ypart point 0 of yy) {dir 76}
  .. z1 {dir 64} .. z2 {dir 64} .. (xpart point 1 of xx, ypart point 1 of yy) {dir 30};

draw ff withcolor 0.54 red;
drawarrow xx;
drawarrow yy;
forsuffixes $=1,2: 
    draw (0, y$) -- z$ -- (x$,0) dashed evenly withcolor 1/2; 
    dotlabel.lft("\texttt{(0,y" & decimal $ & ")}", (0, y$));
    dotlabel.bot("\texttt{(x" & decimal $ & ",0)}", (x$, 0));
    dotlabel.rt("$z_" & decimal $ & "$", z$);
endfor



endfig;
\end{mplibcode}
\end{document}

