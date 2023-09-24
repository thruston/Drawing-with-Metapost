\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    path A;

    vardef median(expr p) = save n; numeric n; 
        n = length p; 
        origin for i=1 upto n: + point i of p / n endfor
    enddef;
    path S; S = unitsquare shifted -(1/2, 1/2) scaled 100 slanted 1/2;
    path S; S = (for i=0 upto 4: 50 up rotated 72i -- endfor cycle) slanted 1;
    draw S withcolor red;
    z0 = median(S);
    vardef beyond(expr a, b, o) = 
        save d; numeric d; d = abs(b-a); (1+o/d)[a,b]
    enddef;
    path T; T = 
    for i=0 step 1/8 until length S - eps:
        % beyond(z0, point i of S, 16) --
        (1.1)[z0, point i of S] --
    endfor cycle;
    draw z0 withpen pencircle scaled 2;

    draw T withcolor blue;

    A = S shifted - center S scaled 1.2 shifted center S;

    draw A withcolor green;

endfig;
\end{mplibcode}
\end{document}

