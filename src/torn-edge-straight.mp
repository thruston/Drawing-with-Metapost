\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input torn-edge
beginfig(2);
path t; numeric x, y; 
x = 0; y=0; 
t = (x, -20) -- (x, y) for i=1 upto 288: -- (incr x, walkr y) endfor -- (x, -20) -- cycle;
fill t withcolor 1/32(32,32,31);
draw t withcolor .67 blue;
endfig;
\end{mplibcode}
\end{document}
