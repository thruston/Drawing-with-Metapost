\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibsetformat{metafun}
\begin{mplibcode}
beginfig(1);
    path s; 
    s = origin for i=1 upto 90: .. (30i, 0) rotated 4i endfor;
    
    path e[], f[];
    for i = 0 upto 17:
        e[i] = s rotated 20i;
        f[i] = s reflectedabout(left, right) rotated 20i;
    endfor

    for i=0 upto 8:
        fill e[2i] -- reverse e[2i+1] .. cycle withcolor 1/2;
    endfor
    for i=0 upto 8:
        fill f[2i] -- reverse f[2i+1] .. cycle withcolor transparent(2, 1/2, 0);
    endfor
endfig;
\end{mplibcode}
\end{document}

