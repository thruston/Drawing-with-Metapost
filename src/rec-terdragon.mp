\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path gene, p; 
z1 = 0.57735 dir 30; z2 = (x1, -y1);
gene = p = origin -- z1 -- z2 -- right;
transform a, b, c;
a = identity zscaled z1;
b = identity zscaled (z2-z1) shifted z1;
c = identity zscaled z1 shifted z2;
for i=1 upto 6:
    show length p;
    p := p transformed a & p transformed b & p transformed c;
endfor

beginfig(1);
for i=1 upto 6:
    draw p scaled 512 rotated 60i withcolor i/8;
endfor
endfig;
\end{mplibcode}
\end{document}

