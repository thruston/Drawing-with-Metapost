\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
r = 0;
vardef make_H(expr level, bar, thickness) = 
    cutdraw bar withpen pencircle scaled thickness
        withcolor Blues[9][9 - floor(level/2)];

    % save spike, m; path spike; pair m; m = unitvector(direction 1/2 of bar rotated 90);
    % spike = point 0 of bar .. m scaled +thickness shifted point 1/2 of bar .. point 1 of bar &
    %         point 1 of bar .. m scaled -thickness shifted point 1/2 of bar .. point 0 of bar & cycle;
    % fill spike withcolor Reds 9 7;

    if level > 0:
        save foo, fo; 
        path foo, fo; 
        foo = bar shifted - point 1/2 of bar scaled 0.7071067811865475; 
        make_H(level - 1, foo rotated 90 shifted point r of bar, thickness);
        make_H(level - 1, foo rotated 90 shifted point 1-r of bar, thickness);
    fi
enddef;
beginfig(1);
make_H(8, (left -- right) scaled 200, 1/2);
endfig;
\end{mplibcode}
\end{document}

