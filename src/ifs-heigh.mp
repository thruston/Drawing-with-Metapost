\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibnumbersystem{decimal}
\begin{mplibcode}
beginfig(1);
pair A, B;
A = origin;
B = right;

path p; p = A -- 4 B;

for i=1 upto 16:
    p := subpath (0, length p - 1/4) of p; 
    p := p rotated 45 {direction length p of p rotated 45} .. reverse p rotated 135 shifted 4(sqrt(2) ** i, 0);   
endfor
draw p;
endfig;
\end{mplibcode}
\end{document}

