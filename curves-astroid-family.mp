\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
    numeric a; a = 144;
    for n=1 upto 7:
        path p; p = a * right for t=6 step 6 until 90:
            .. a * (cosd(t) ** n, sind(t) ** n)
        endfor;
        p := for i=0 upto 3: p rotated 90i & endfor cycle;
        fill p withcolor Oranges[9][n]; draw p;
    endfor
endfig;
\end{mplibcode}
\end{document}

