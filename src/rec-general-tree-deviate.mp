\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
r = 0.75; theta = 17; 
vardef make_tree(expr bar) = 
    save a; numeric a; a = abs(point 1 of bar - point 0 of bar);
    cutdraw bar withpen pencircle scaled (a/8);
    if a > 5:
        make_tree(
            bar shifted - point 0 of bar 
            shifted (- a / 60, 0)
            scaled (r + 1/16 normaldeviate) 
            rotated (theta + 8 normaldeviate) 
            shifted point 1 of bar 
        );
        make_tree(
            bar shifted - point 0 of bar 
            shifted (a / 60, 0)
            scaled (r + 1/16 normaldeviate) 
            rotated -(theta + 8 normaldeviate) 
            shifted point 1 of bar 
        );
    fi
enddef;
beginfig(1);
for i=1 upto 4:
    picture T; T = image(make_tree(origin -- 40 up)); draw T shifted (160i, 0);
endfor
endfig;
\end{mplibcode}
\end{document}

