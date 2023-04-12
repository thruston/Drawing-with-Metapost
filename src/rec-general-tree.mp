\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
r = 0.75; theta = 16; 
vardef make_tree(expr bar) = 
    save a; numeric a; a = abs(point 1 of bar - point 0 of bar);
    if a > 5:
        make_tree(
            bar shifted - point 0 of bar 
            shifted (- a / 60, 0)
            scaled r rotated theta
            shifted point 1 of bar 
        );
        make_tree(
            bar shifted - point 0 of bar 
            shifted (a / 60, 0)
            scaled r rotated -theta
            shifted point 1 of bar 
        );
    fi
    cutdraw bar withpen pencircle scaled (a/8);
enddef;
beginfig(1);
make_tree(origin -- 100 up);
endfig;
\end{mplibcode}
\end{document}

