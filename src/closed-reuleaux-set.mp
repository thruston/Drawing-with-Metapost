\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
\mplibtextextlabel{enable}
vardef reuleaux(expr n, r) =
    save a; numeric a; a = 90/n;
    for t = 0 step 4a until 359:
        (0, r) rotated t {left rotated (a + t)} .. {left rotated (3a + t)}
    endfor cycle
enddef;
vardef median(expr p) = origin for i=1 upto length p: + point i of p / length p endfor enddef;
input colorbrewer-rgb
beginfig(1);
    for n = 3 upto 7:
        path p; p = reuleaux(n, 42) shifted (90n, 0);
        pair m; m = point (n+1)/2 of p;
        fill p withcolor if odd n: Oranges else: Blues fi 8 2;
        fill subpath (0, 1) of p -- m -- cycle 
            withcolor if odd n: Oranges else: Blues fi 8 3;
        %draw fullcircle scaled 2 abs(point 0 of p - m) shifted m
        %    withpen pencircle scaled 2 withcolor 3/4;
        %draw tensepath(p) withcolor Blues 8 6;
        %draw p rotatedabout(median(p), 180/n) withcolor Blues 8 6;
        draw p;
    endfor

endfig;
\end{mplibcode}
\end{document}

