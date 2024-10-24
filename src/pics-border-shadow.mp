\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\begin{mplibcode}
input pics-border-common
beginfig(1);
draw orthogonals;
bboxmargin := 16;
picture P; P = currentpicture;
fill bbox P shifted (3,-3) withcolor 3/4;
unfill bbox P; draw bbox P; draw P; 
label.rt(btex 
\smallmpexternal[firstline=9, lastline=12]{pics-border-shadow.mp}
etex, point 3/2 of bbox currentpicture shifted 10 left);
endfig;
\end{mplibcode}
\end{document}
