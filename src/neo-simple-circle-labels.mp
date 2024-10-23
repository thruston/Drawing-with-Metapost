\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path P; P = for i=0 upto 8: 50 dir 40i -- endfor cycle; 
draw P withcolor 2/3 red;
for i=1 upto length P:
    draw point i of P withpen pencircle scaled dotlabeldiam;
    label("$p_{" & decimal i & "}$", point i of P scaled 1.2);
endfor
endfig;
\end{mplibcode}
\end{document}

