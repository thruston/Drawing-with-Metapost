\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path p, gene;
% gene = origin -- sqrt(1/2) * dir 45  -- right;
gene = origin -- 0.7427429446247741 dir 32.8938  -- right;  
transform a, b;
a = identity zscaled (point 1 of gene - point 0 of gene) shifted point 0 of gene;
b = identity zscaled (point 1 of gene - point 2 of gene) shifted point 2 of gene;
p = gene;
for i=1 upto 16:
    p := p transformed a -- reverse p transformed b;
endfor
beginfig(1);
draw p scaled 512 withpen pencircle scaled 1/8;
endfig;
\end{mplibcode}
\end{document}

