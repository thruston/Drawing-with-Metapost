\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef thatch(expr a, b, c, penw, gap) =
    picture H;
    pair v;
    v = gap * unitvector(c - 1/2[a, b]);
    H = image(
        for i=1 upto 120:
            draw (a--b)
                shifted (i * v)
                withpen pencircle scaled penw;
        endfor
    );
    clip H to a--b--c--cycle; draw H;
enddef;

beginfig(1);

    path h, t;

    h = for i=0 upto 5: 84 right rotated 60i -- endfor cycle;
    t = (origin -- subpath (0, 1) of h -- cycle)
        shifted -1/3(point 0 of h + point 1 of h) 
        scaled 1.08
        rotated 90;

    thatch(point 2 of t, point 0 of t, point 1 of t, 1/4, 3/2);
    thatch(point 4 of h, point 0 of t, point 2 of t, 1/4, 5/4);
    thatch(point 0 of t, point 0 of h, point 1 of t, 1/4, 3/4);
    thatch(point 1 of h, point 1 of t, point 0 of h, 1/4, 1);
    thatch(point 4 of h, point 2 of t, point 3 of h, 1/4, 2);
    thatch(point 4 of h, point 0 of t, point 5 of h, 1/4, 1);
    thatch(point 5 of h, point 0 of t, point 6 of h, 1/4, 3/4);

    draw h;
    draw t;

    for i=0 upto 2:
        draw point 2i of h -- point i of t;
        draw point 2i of h -- point i+1 of t;
        draw point 2i+1 of h -- point i+1 of t;
    endfor

    input ruler-cm

endfig;
\end{mplibcode}
\end{document}

