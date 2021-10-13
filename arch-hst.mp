\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input archimedean-tools
beginfig(1);
    path t[], s[], h;
    h = poly 6 of (origin -- 42 dir 30);
    for i=1 upto 3:
        s[i] = poly 4 of subpath (2i, 2i-1) of h;
    endfor
    t1 = poly 3 of subpath (4, 3) of s1;
    t2 = poly 3 of subpath (2, 1) of s2;

    picture unit;
    unit = image(
        for i=1 upto 2:
            fill t[i] withcolor Blues 8 4;
        endfor
        for i=1 upto 3:
            fill s[i] withcolor Greens 8 1;
        endfor
        fill h withcolor Oranges 9 4;
        forsuffixes $=t1, t2:
            pair m; m = median($);
            for i=1 upto length $:
                draw m -- point i - 1/2 of $ withcolor Blues 8 8;
            endfor
        endfor
        forsuffixes $=s1, s2, s3:
            draw point 1/2 of $ -- point 5/2 of $ withcolor Oranges 8 8;
            draw point 3/2 of $ -- point 7/2 of $ withcolor Blues 8 8;
        endfor
        for i=1 upto 3:
            draw point i-1/2 of h -- point i+5/2 of h withcolor Oranges 8 8;
        endfor
    );

    pair u, v;
    u = point 2 of s1 - point -1 of h;
    v = u rotated 60;

    numeric n; n=4;
    for i=-n upto n:
        for j=-n upto n:
            draw unit rotated 0 shifted (i*u + j*v - floor (j/2) * u);
        endfor
    endfor
    %draw bbox unit withcolor red;
    
    clip currentpicture to fullcircle scaled (3/2n * abs(v));
    
    % picture p; p = currentpicture;
    % (wd, ht) = (urcorner p - llcorner p);
    % currentpicture := nullpicture;
    % p := p scaled (148.5mm / wd);
    % draw p;
endfig;
\end{mplibcode}
\end{document}
