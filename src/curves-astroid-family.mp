\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
input colorbrewer-rgb
for n=1 upto 7:
  path p; p = (right for t=6 step 6 until 90:
    .. (cosd(t) ** n, sind(t) ** n)
  endfor) scaled 144;
  p := for i=0 upto 3: p rotated 90i & endfor cycle;
  fill p withcolor Blues[9][n]; draw p;
endfor
endfig;
\end{mplibcode}
\end{document}
