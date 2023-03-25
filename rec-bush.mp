\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
numeric t; t = 8;
vardef bush(expr start, aim, level, limit) = 
    save s; numeric s; s = level / limit;
    for a = -4t, -t, t, 2t:
        pair target; target = aim scaled ((32 + 16 normaldeviate)*s) rotated a shifted start;
        draw start -- target 
            withpen pencircle scaled s
            withcolor BrBG[limit][limit-level];
        if level > 1:
            bush(target, aim rotated a, level - 1, limit);
        fi
    endfor
enddef;
beginfig(1);
bush(origin, dir 80, 6, 8);
endfig;
\end{mplibcode}
\end{document}

