\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibnumbersystem{double}
\begin{mplibcode}
vardef dragon(expr a, b) = 
    if abs(a-b) < 1:
        a -- b
    else:
        save p; pair p;
        p = 0.7427429446247741[a, b] rotatedabout(a, 32.8938); 
        dragon(a, p) & reverse dragon(b, p)
    fi
enddef;

vardef rounded_corners expr p = 
    save r, n; numeric r, n; r = 1/3; n = length p;
    subpath (0, 1-r) of p 
    for t=1 upto n-1:
        .. subpath (t+r, t+1-r) of p
    endfor .. subpath (n-r, n) of p
enddef;


beginfig(1);

    path p; p = dragon(origin, 360 right);
    show length p;
    %draw rounded_corners p withpen pencircle scaled 1/8;
    draw p withpen pencircle scaled 1/8;

endfig;
\end{mplibcode}
\end{document}

