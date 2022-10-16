\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
vardef median(expr p) = origin for i=1 upto length p: + point i of p / length p endfor enddef;
beginfig(1);
    path s[], t[];
    s1 = unitsquare scaled 24 rotated 15; 
    s2 = s1 rotated 150;
    t1 = subpath (4, 3) of s1 -- point 1 of s2 -- cycle;
    t2 = t1 reflectedabout(point 1 of t1, point 2 of t1);
    t3 = t1 rotated 150;
    t4 = t1 rotated 210;

    picture color_unit, grid_unit;
    color_unit = image(
        fill s1 withcolor Oranges 8 1;
        fill s2 withcolor Oranges 8 2;
        fill t1 withcolor Blues 8 1;
        fill t2 withcolor Blues 8 2;
        fill t3 withcolor Blues 8 3;
        fill t4 withcolor Blues 8 4;
    );
    grid_unit = image(
        forsuffixes $=s1, s2, t1, t2, t3, t4:
            draw $; 
            % pair m; m = median($);
            % for i=1 upto length $: 
            %     draw m -- point i - 1/2 of $ 
            %         withpen pencircle scaled 1/4; 
            % endfor
        endfor
    );

    pair u, v;
    u = point 1 of s1 - point 1 of s2;
    v = u rotated 90;
    
    numeric n; n = 3;
    forsuffixes $=color_unit, grid_unit:
        for i=-n upto n:
            for j=-n upto n:
                draw $ shifted (i * u + j * v);
            endfor
        endfor
    endfor
    label.bot("The arrangement of polygons in the unit is carefully",  point 1/2 of bbox currentpicture
            shifted 34 down);
    label.bot("chosen so that the tiling has neat edges."            , point 1/2 of bbox currentpicture);
endfig;
\end{mplibcode}
\end{document}

