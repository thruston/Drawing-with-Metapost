\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef polygon_with_side(expr n, s) = 
    save a, b; numeric a, b; a * n = 360; a + 2b = 180; 
    for i = 0 upto n-1: s * sind(b) / sind(a) * dir (a * i) -- endfor cycle
enddef;
beginfig(1);

    for i = 13 upto 18:
        draw polygon_with_side(i, 30) shifted (6i*i, 0);
    endfor

endfig;
\end{mplibcode}
\end{document}

