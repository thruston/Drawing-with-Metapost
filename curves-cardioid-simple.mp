\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    numeric a; 2a = 144;

    path base; base = fullcircle rotated 180 scaled 2a shifted (a, 0);
    path c[]; numeric n; n = -1;
    numeric s; s = 1/4;
    for t = 0 step s until length base:
        c[incr n] = fullcircle 
            scaled 2 abs (point t of base - point 0 of base) 
            shifted point t of base;
            draw c[n] withpen pencircle scaled 1/4 withcolor 3/4;
    endfor

    path cardoid; 
    cardoid = for t = 0 step s until length base:
        point 0 of base reflectedabout(precontrol t of base, postcontrol t of base) ..
    endfor cycle;

    path polar;
    polar = for t=0 upto 360: 2a * (1 + cosd(t)) * dir t ..  endfor cycle;

    path rolling, aux; 
    aux = base rotatedabout(point 0 of base, 180);
    rolling = for t = 0 step 1/4 until length base:
        point t of aux rotatedabout(center base, 45t) ..
    endfor cycle;

    % draw rolling withpen pencircle scaled 2 withcolor 3/4[blue, white];
    % draw polar withpen pencircle scaled 5/4 withcolor 3/4[green, white];

    draw base withcolor 2/3 blue;
    draw cardoid withcolor 2/3 red;

    % for i=1 upto n-1:
    %     draw center c[i] withpen pencircle scaled 3/2;
    % endfor

    dotlabel.urt("$A$", point 0 of base);
    dotlabel.urt("$Q$", point 5.4 of base);
endfig;
\end{mplibcode}
\end{document}

