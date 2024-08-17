\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input borders

beginfig(1);
    path bb; bb = unitsquare xscaled 233 yscaled 144;
    draw plain_dots(bb, 8, 3, red);
endfig;
\end{mplibcode}
\end{document}

