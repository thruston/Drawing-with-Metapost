\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input border-common
input rope
beginfig(1);
interim bboxmargin := 16;
draw = orthogonals;  % from the common code...
draw rope with_rounded_corners bbox currentpicture;
endfig;
\end{mplibcode}
\end{document}
