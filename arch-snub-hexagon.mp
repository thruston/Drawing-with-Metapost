\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input archimedean-tools
beginfig(1);
    path t[], h;
    h = poly 6 of (origin -- 42 dir -11);
    t1 = poly 3 of subpath (1, 0) of h;
    t5 = poly 3 of subpath (2, 1) of h;
    for i=2 upto 4:
        t[i] = poly 3 of subpath (2, 1) of t[i-1];
    endfor

    picture unit;
    unit = image(
        for i=1 upto 5:
            fill t[i] withcolor Blues 8 if odd i: 2 else: 3 fi;
        endfor
        fill h withcolor Oranges 8 5;
        draw fullcircle scaled 1 shifted point 0 of h;
        forsuffixes $=h, t1, t2, t3, t4, t5: %, t6: % , t7, t8:
            drawarrow $ withpen pencircle scaled 1/4;
            pair m; m = median($);
            label(str $, m);
            for i=1 upto length $:
                % draw m -- point i - 1/2 of $ withcolor white;
                %draw m -- point i - 1/2 of $;
            endfor
        endfor
    );

    pair u, v;
    u = point 4 of h - point 0 of t2;
    v = u rotated -60;

    numeric n; n=1;
    for i=-n upto n:
        for j=-n upto n:
            draw unit shifted (i*u + j*v - floor (j/2) * u);
        endfor
    endfor
    % draw bbox unit withcolor red;
    drawarrow origin -- u withcolor red;
    drawarrow origin -- v withcolor blue;
    draw fullcircle scaled 2 abs(u) withcolor red;

    
    % picture p; p = currentpicture;
    % (wd, ht) = (urcorner p - llcorner p);
    % currentpicture := nullpicture;
    % p := p scaled (148.5mm / wd);
    % draw p;
endfig;
\end{mplibcode}
\end{document}


