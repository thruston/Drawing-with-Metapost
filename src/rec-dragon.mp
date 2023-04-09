\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
numeric r, theta; r = sqrt 1/2; theta = 45;
vardef dragon(expr level, a, b) = 
    if level > 0:
        save p; pair p;
        p = r[a, b] rotatedabout(a, theta); 
        dragon(level - 1, a, p) & reverse dragon(level - 1, b, p)
    else:
        a .. b
    fi
enddef;

vardef rounded_corners expr p = 
    save r, n; numeric r, n; r = 1/3; n = length p;
    subpath (0, 1-r) of p 
    for t=1 upto n-1:
        .. subpath (t+r, t+1-r) of p
    endfor .. subpath (n-r, n) of p
enddef;

beginfig(1);

    path d; d = dragon(15, origin, 240 right);
    draw d withpen pencircle scaled 1/4 withcolor (.2, .2, .7);
    label.top("The dragon curve at level 15", point 1/3 of bbox currentpicture);

    draw rounded_corners dragon(10, origin, 240 right)
        shifted 280 down
        withcolor .54 red;

    label.top("\dots\ and at level 10 with rounded corners", point 1/3 of bbox currentpicture);
    
endfig;
\end{mplibcode}
\end{document}

