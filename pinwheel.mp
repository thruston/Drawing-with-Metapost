\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
vardef pinwheel(expr level, a, b, c, s) = 
    if level < 1:
        fill a--b--c--cycle withcolor s;
        draw a--b--c--cycle withpen pencircle scaled 1/8 withcolor white;
    else:
        save d, e, f, g;
        pair d, e, f, g; 
        d = 2/5[b, c]; e = 4/5[b,c]; f = 1/2[e, a]; g = 1/2[a, b];
        pinwheel(level - 1, e, a, c, Blues 9 2);
        pinwheel(level - 3, f, g, a, Blues 9 3);
        pinwheel(level - 2, f, g, e, Blues 9 4);
        pinwheel(level - 1, d, e, g, Blues 9 5);
        pinwheel(level - 2, d, b, g, Blues 9 6);
    fi
enddef;
beginfig(1);
    pinwheel(7, origin, 200 right, 100 up, "");
    pinwheel(7, (200,100), 100 up, 200 right, "");
    currentpicture := currentpicture rotated 90;
endfig;
\end{mplibcode}
\end{document}
