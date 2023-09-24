\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path S; S = origin .. 100 right {down} .. origin .. 100 left {down} .. cycle;
beginfig(1);
draw S withpen pencircle scaled 6;
draw S withpen pencircle scaled 5 withcolor 1/2[red, green] * 2;
draw S withpen pencircle scaled 4.5;
draw S dashed evenly scaled 1/2 withcolor white;
endfig;
\end{mplibcode}
\end{document}

