\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
path a; a = (left .. right) scaled 42;
pair P; P = origin; r = 31;
draw a rotated r withcolor 2/3 red; draw a rotated (90+r) withcolor 2/3 red;
draw P withpen pencircle scaled dotlabeldiam;
label(btex $P$ etex, P shifted 10 dir 68);
z0 = P + 20 dir -20; 
draw z0 -- P 
  cutafter fullcircle scaled 8 shifted P
  withpen pencircle scaled 1/4;
label.rt(btex \textit{pole} etex, z0);
endfig;
\end{mplibcode}
\end{document}
