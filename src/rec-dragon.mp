\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
vardef dragon(expr level, a, b, r) = 
    if level = 0:
        a .. b
    else:
        save p; pair p;
        p = 0.7071067811865476[a, b] rotatedabout(a, r); 
        
        dragon(level-1, a, p, +abs(r)) &
        dragon(level-1, p, b, -abs(r)) 
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

    for i=1 upto 11:
        path p; p = dragon(i, origin, 180 right, 45); 

        show length p;
        draw p shifted (0, -180i);
        draw rounded_corners p shifted (360, -180i);
    endfor

endfig;
\end{mplibcode}
\end{document}

