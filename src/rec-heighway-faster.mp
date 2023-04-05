\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibnumbersystem{double}
\begin{mplibcode}
beginfig(1);
numeric r; r = .47;
path p; p = origin -- (0, 1-r) {up} .. (r, 1) -- (1,1);
p := p scaled 8;
for i = 1 upto 11:
    n := length p; show (i, n, abs(point n of p - point 0 of p));
    p := subpath (0, n-3/2r) of p {direction n-r of p} 
      .. subpath (n-3/2r, 0) of p rotatedabout(point n of p, 90);
endfor
p := p rotated -(90 + angle point length p of p);
bboxmargin := 24;
fill bbox p withcolor 1/256(144, 162, 145);
for i=1 upto 8:
    draw p withpen pencircle scaled 1/2(4-1/16(i*(i-1))) withcolor (i/8);
endfor

endfig;
\end{mplibcode}
\end{document}

