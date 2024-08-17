\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
r = 0;

vardef decorate(expr a, b, s, z) = 
    save F, w; picture F; pair w; w = (mlog(a/b), 400 + normaldeviate);
    F = thelabel(TEX("$\frac{" & decimal a & "}{" & decimal b & "}$") scaled s, z);


    fill bbox F withcolor 1/4[white, if a/b < 1: red else: blue fi]; draw F;

    draw w withpen pencircle scaled 1;
enddef;

vardef make_H(expr level, scale, bar, thickness, n, d) = 
    cutdraw bar withpen pencircle scaled thickness
        withcolor Blues[8][level];

    decorate(n, d, scale, point 1/2 of bar);

    % save spike, m; path spike; pair m; m = unitvector(direction 1/2 of bar rotated 90);
    % spike = point 0 of bar .. m scaled +thickness shifted point 1/2 of bar .. point 1 of bar &
    %         point 1 of bar .. m scaled -thickness shifted point 1/2 of bar .. point 0 of bar & cycle;
    % fill spike withcolor Reds 9 7;

    if level > 1:
        save foo, fo; 
        path foo, fo; 
        foo = bar shifted - point 1/2 of bar scaled 0.7071067811865475; 
        make_H(level - 1, scale * .8, foo rotated (90+1/4normaldeviate) shifted point r of bar, thickness, n, n+d);
        make_H(level - 1, scale * .8, foo rotated (90+1/4normaldeviate) shifted point 1-r of bar, thickness, n+d, d);
    else:
        decorate(n, n+d, scale, point 0 of bar);
        decorate(n+d, d, scale, point 1 of bar);
    fi
enddef;
beginfig(1);
make_H(9, 1.4, (left -- right) scaled 256, 1/2, 1, 1);
endfig;
\end{mplibcode}
\end{document}

