\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef key_pattern expr p = 
    save unit, u, v; path unit; numeric u, v; u = 8; v = 3;
    unit = (0, 0) -- (0, -v) -- (u, -v) -- (u, 0) -- (v, 0) -- (v, v) -- (u+v, v) -- (u+v, 0);
    for t=0 step u+v until arclength p - u - v:
       subpath (0, 7) of unit shifted (t, 0) --
    endfor point 1 of p
enddef;



beginfig(1);
linecap := 0;
linejoin := 0;
draw key_pattern origin -- 220 right withpen pencircle scaled 2;
draw key_pattern origin -- 220 right withpen pencircle scaled 1.25 withcolor white;
endfig;
\end{mplibcode}
\end{document}

