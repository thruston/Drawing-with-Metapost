\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input border-common
beginfig(1);
interim bboxmargin := 16;
draw = orthogonals;  % from the common code...
draw with_rounded_corners bbox currentpicture dashed evenly scaled 1/2;
endfig;
\end{mplibcode}
\end{document}
