\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef koch_segment(expr limit, a, b) = 
    if abs(a-b) < limit:
        a 
    else:
        save p, q, r; pair p, q, r; 
        p = 1/3[a,b]; r = 2/3[a,b]; q = r rotatedabout(p, 60);
        koch_segment(limit, a, p) --
        koch_segment(limit, p, q) --
        koch_segment(limit, q, r) --
        koch_segment(limit, r, b) -- b
    fi
enddef;
vardef koch(expr level, a, b) = 
    if level = 0:
        a
    else:
        save p, q, r; pair p, q, r; 
        p = 1/3[a,b]; r = 2/3[a,b]; q = r rotatedabout(p, 60);
        koch(level-1, a, p) --
        koch(level-1, p, q) --
        koch(level-1, q, r) --
        koch(level-1, r, b) -- b
    fi
enddef;

beginfig(1);

    draw koch_segment(2, origin, 243 right); 
    draw koch(5, origin, 243 right) shifted 60 down; 

endfig;
\end{mplibcode}
\end{document}

