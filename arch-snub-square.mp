\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-cmyk
% a polygon of n sides on a given path
vardef poly expr n of p = 
    save x, y;
    z0 = point 0 of p;
    z1 = point 1 of p;
    for i=2 upto n-1:
        z[i] = z[i-2] rotatedabout(z[i-1], 180(2/n-1));
    endfor
    for i=0 upto n-1: z[i] -- endfor cycle
enddef;
vardef median(expr P) = 
    (origin for i=1 upto length P: + point i of P endfor) / length P
enddef;
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
            pair m; m = median($);
            for i=1 upto length $:
                draw point i - 1/2 of $ -- m 
                    withpen pencircle scaled 3/2 withcolor Spectral 3 2;
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
    
    % picture p; p = currentpicture;
    % (wd, ht) = (urcorner p - llcorner p);
    % currentpicture := nullpicture;
    % p := p scaled (145mm / wd);
    % undraw unitsquare xscaled 148mm yscaled 210mm shifted llcorner p shifted -(1.5mm, 1.5mm)
    %     withpen pencircle scaled 1/8;
    % z0 = 1/2[llcorner currentpicture, ulcorner currentpicture];
    % draw z0 -- z0 shifted 3 right withpen pencircle scaled 1/8;
    % z1 = 1/2[lrcorner currentpicture, urcorner currentpicture];
    % draw z1 -- z1 shifted 3 left withpen pencircle scaled 1/8;
    % draw p;
    % picture r; r = currentpicture rotated 90;
    % currentpicture := nullpicture;
    % draw r;
endfig;
\end{mplibcode}
\end{document}
