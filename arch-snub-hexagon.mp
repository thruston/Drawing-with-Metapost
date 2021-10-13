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
    for i=1 upto 6:
        t[i] = poly 3 of subpath (i, i-1) of h;
    endfor
    t7 = poly 3 of subpath (2, 1) of t2;
    t8 = poly 3 of subpath (2, 1) of t5;

    picture unit;
    unit = image(
        for i=1 upto 6:
            fill t[i] withcolor Blues 8 if odd i: 2 else: 3 fi;
        endfor
        fill h withcolor Oranges 8 5;
        draw fullcircle scaled 1 shifted point 0 of h;
        forsuffixes $=h, t1, t2, t3, t4, t5, t6: % , t7, t8:
            % drawarrow $ withpen pencircle scaled 1/4;
            pair m; m = median($);
            for i=1 upto length $:
                % draw m -- point i - 1/2 of $ withcolor white;
                draw m -- point i - 1/2 of $;
            endfor
        endfor
    );

    pair u, v;
    u = point 2 of t8 - point 0 of h;
    v = u rotated -60;

    numeric n; n=4;
    for i=-n upto n:
        for j=-n upto n:
            draw unit shifted (i*u + j*v - floor (j/2) * u);
        endfor
    endfor
    %draw bbox unit withcolor red;
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


