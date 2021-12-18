\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input archimedean-tools
beginfig(1);
    path P[]; P3 = for i=0 upto 2: 6 up rotated 120i -- endfor cycle;
    fill P3 withcolor 3/4 red; draw P3;
    for n = 4 upto 23:
        numeric m; m = floor(n / 2);
        P[n] = poly n of subpath (m, m-1) of P[n-1];
        fill P[n] withcolor (n/32)[3/4 if odd n: red else: blue fi, white];
        draw P[n]; label(decimal n, median(P[n]));
    endfor
endfig;
\end{mplibcode}
\end{document}
