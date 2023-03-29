\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef make_gasket(expr t, s, limit) = 
    if length (point 1 of t - point 0 of t) < limit:
        fill t;
    else:
        save little_t; path little_t; little_t = t scaled s;
        for i=1 upto length t:
            make_gasket(little_t shifted (point i of t - point i of little_t), s, limit);
        endfor
    fi
enddef;
beginfig(1);  
    path P, H; 
    P = for i = 1 upto 5: 64 up rotated (72i) -- endfor cycle;
    H = for i = 1 upto 6: 64 up rotated (60i) -- endfor cycle;
    picture a, b;
    a = image(make_gasket(P, 1/2(3-sqrt(5)), 2));
    b = image(make_gasket(H rotated 30, 1/3, 2));

    label.lft(a, 30 left);
    label.rt(b, 30 right);
endfig;
\end{mplibcode}
\end{document}
