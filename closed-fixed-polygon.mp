\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
vardef polygon_with_side(expr n, s) = 
    save a, b, r; numeric a, b, r; 
    a * n = 360; a + 2b = 180; r = s * sind(b) / sind(a);
    for i = 0 upto n-1: (0, r) rotated (a * i) -- endfor cycle
enddef;
for n = 11 downto 3:
    path p; p = polygon_with_side(n, 72);
    fill p withcolor (n/32)[white, 3/4 if odd n: red else: blue fi];
    draw p;
endfor
endfig;
\end{mplibcode}
\end{document}
