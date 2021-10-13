\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input archimedean-tools
input colorbrewer-rgb
beginfig(1);
    path dodo, h[], s[];
    dodo = poly 12 of (origin -- 21 up);
    for i=1 upto 3:
        s[i] = poly 4 of subpath(2i, 2i-1) of dodo;
    endfor
    h1 = poly 6 of subpath (4, 3) of s1;
    h2 = poly 6 of subpath (2, 1) of s3;

    picture cols, lines;
    cols = image(
        fill dodo withcolor Greens 9 2;
        for i=1 upto 2:
            fill h[i] withcolor Greens 9 3;
        endfor
        for i=1 upto 3:
            fill s[i] withcolor Greens 9 4;
        endfor
    );
    lines = image(
        forsuffixes $=dodo, s1, s2, s3, h1, h2:
            if known $:
                draw $ withpen pencircle scaled 1/4;
                pair m; m = median($);
                for i=1 upto length $:
                    cutdraw m -- point i - 1/2 of $
                        if odd i: cutbefore fullcircle scaled (length $ / 4) shifted m fi 
                        withpen pencircle scaled 1/4
                         withcolor Reds 4 3;
                        ;
                endfor
            fi
        endfor
    );

    pair u, v;
    u = point 2 of s1 - point 8 of dodo;
    v = u rotated 60;

    numeric n;
    n = 2;

    forsuffixes @ = cols, lines:
        for i=-n upto n+1:
            for j=-n upto n:
                draw @ shifted (i*u + j*v - floor(i/2) * v);
            endfor
        endfor
    endfor

    clip currentpicture to unitsquare xscaled ((2n+1) * xpart u) yscaled (2n * ypart v)
        shifted median(s2 shifted (-n*u - n*v + floor(n/2) * v));


endfig;
\end{mplibcode}
\end{document}

