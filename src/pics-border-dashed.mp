\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\begin{mplibcode}
input pics-border-common
beginfig(1);
draw orthogonals;

bboxmargin := 16;
draw with_rounded_corners bbox currentpicture 
    dashed evenly scaled 1/2;

path b; b = bbox currentpicture;
label.urt(btex 
\smallmpexternal[firstline=26,lastline=30]{pics-border-common.mp} 
etex, point 3/2 of b shifted 10 left);
label.lrt(btex 
\smallmpexternal[firstline=10,lastline=12]{pics-border-dashed.mp} 
etex, point 3/2 of b shifted 10 left);
endfig;
\end{mplibcode}
\end{document}
