\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input rope
beginfig(1);
    path loop;

    loop = (for i=0 upto 3: (up .. (2,1) {right} .. (2.8,2.8) .. (1,2){down} .. right) rotated -90i .. endfor cycle) scaled 12;

    draw rope loop rotated 45;
    draw rope fullcircle scaled 108;

%    draw rope subpath(0,1) of loop;

endfig;
\end{mplibcode}
\end{document}

