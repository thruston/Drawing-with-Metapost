\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    s = 1/2;
    path gene[];
    gene0 = origin -- (.5, -s) -- right;
    gene1 = origin -- (.5, +s) -- right;

        path d; d = origin -- 256 up;
        for n = 1 upto 14:
            d := for t = 1 upto length d:
                gene[t mod 2] zscaled (point t of d - point t-1 of d) shifted point t-1 of d &
            endfor point length d of d;
        endfor
        % numeric r; r = 3/8;
        % path drag; drag = point 0 of d 
        %     for i=1 upto length d: 
        %         .. {direction i-r of d} point i-1+r of d -- point i-r of d 
        %     endfor .. point length d of d;
            
        draw d withcolor 1/2 blue;
        % draw drag;




endfig;
\end{mplibcode}
\end{document}


