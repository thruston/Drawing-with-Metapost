\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
vardef make_gasket(expr t, s, level, c) =
    if level = 0:
        fill t withcolor Reds[7][7-c];
        draw t;
    else:
        save little_t; path little_t; little_t = t scaled s;
        for i=1 upto length t:
            make_gasket(little_t shifted (point i of t - point i of little_t), s, level-1, c);
        endfor
    fi
enddef;
vardef sf(expr n) = 
    numeric s; s = 0;
    for k=1 upto floor (n/4):
        s := s + cosd(360 / n * k);
    endfor
    1 / (2 * (1 + s))
enddef;
beginfig(1);  
    for n=5 upto 9:
        draw image(make_gasket(for i=1 upto n: 64 up rotated (360/n*i) -- endfor cycle, sf(n), 3, n-4))
            shifted (144n, 0);
    endfor

endfig;
\end{mplibcode}
\end{document}
