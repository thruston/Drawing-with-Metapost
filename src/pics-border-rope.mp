\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input pics-border-common
input rope
beginfig(1);
draw orthogonals;  % from the common code...
bboxmargin := 16;
draw rope with_rounded_corners bbox currentpicture;
endfig;
\end{mplibcode}
\end{document}
