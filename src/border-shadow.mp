\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input border-common
beginfig(1);
interim bboxmargin := 16;
picture P; P = orthogonals;  % from the common code, but normally you would use "currentpicture" here
fill bbox P shifted (3,-3) withcolor 3/4;
unfill bbox P; draw bbox P; draw P; 
endfig;
\end{mplibcode}
\end{document}
