\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input archimedean-tools
beginfig(1);
    path t[], s[];
    s1 = poly 4 of (origin -- 42 dir 15);
    t1 = poly 3 of subpath (2, 1) of s1;
    t2 = poly 3 of subpath (3, 2) of s1;
    t3 = poly 3 of subpath (2, 1) of t1;
    t4 = poly 3 of subpath (2, 1) of t2;
    s2 = poly 4 of subpath (2, 1) of t4;

    picture unit;
    unit = image(
        fill s1 withcolor Oranges 8 5;
        fill t1 withcolor Blues 8 4;
        fill t4 withcolor Blues 8 3;
        fill t3 withcolor Greens 8 4;
        fill t2 withcolor Greens 8 3;
        fill s2 withcolor Reds 8 5;
        forsuffixes $=s1, t1, s2, t2, t3, t4: 
            %drawarrow $ withpen pencircle scaled 1/4;
            pair m; m = median($);
            for i=1 upto length $:
                draw m -- point i - 1/2 of $;
            endfor
        endfor
    );

    pair u, v;
    u = point 2 of t2 - point 0 of s1;
    v = point 2 of t3 - point 0 of s1;

    for i=0 upto 6:
        for j=0 upto 9:
            draw unit shifted (i*u + j*v);
        endfor
    endfor
    
    picture p; p = currentpicture;
    (wd, ht) = (urcorner p - llcorner p);
    currentpicture := nullpicture;
    p := p scaled (148.5mm / wd);
    draw p;
endfig;
\end{mplibcode}
\end{document}

