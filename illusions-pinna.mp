\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    path s; s = unitsquare shifted -(1/2, 1/2) scaled 23;
    for n = 1 upto 4:
        numeric N; N = 10n + 8;
        numeric a; a = 30 normaldeviate;
        for t=0 upto N-1:
            draw s rotated if odd n: - fi 13 shifted (5N * right) rotated (360 / N * t + a)
                withcolor t mod 2;
        endfor
    endfor
    picture P;
    P = currentpicture; currentpicture := nullpicture;
    fill bbox P withcolor 0.42;
    draw P;
endfig;
\end{mplibcode}
\end{document}

