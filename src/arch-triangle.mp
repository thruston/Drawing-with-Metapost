\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input archimedean-tools
beginfig(1);

    path s, t;
    s = poly 3 of (origin -- 42 right);
    t = poly 3 of subpath(2,1) of s;
    pair ms, mt;
    ms = median(s);
    mt = median(t);

    picture unit;
    unit = image(
        fill s withcolor Oranges 8 3;
        fill t withcolor Blues 8 2;
        draw point 5/2 of s -- ms;
        draw point 3/2 of t -- mt;
        draw point 1/2 of s -- ms -- mt -- point 5/2 of t;
    );

    pair u, v;
    u = point 1 of s - point 0 of s;
    v = point 2 of s - point 0 of s;

    numeric n;
    n = 0;

    for i=-n upto n:
        for j=-n upto n:
            draw unit shifted (i*u + j*v);
        endfor
    endfor

    clip currentpicture to superellipse(168 right, 168 up, 168 left, 168 down, 0.78);



endfig;
\end{mplibcode}
\end{document}
