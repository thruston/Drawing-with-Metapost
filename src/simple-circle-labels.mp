\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path C; C = fullcircle scaled 100; draw C withcolor 2/3 red;
for i=0 upto 11:
    drawdot point 2/3 i of C withpen pencircle scaled dotlabeldiam;
    label("$p_{" & decimal i & "}$", point 2/3 i of C scaled 1.2);
endfor
endfig;
\end{mplibcode}
\end{document}

