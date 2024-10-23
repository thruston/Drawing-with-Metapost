\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
labeloffset := 5;
draw (left--right) scaled 2in withcolor 2/3 red;
for i=-4 upto 4:
  dotlabel.bot("$" & decimal i & "$", (32i, 0));
endfor
endfig;
\end{mplibcode}
\end{document}
