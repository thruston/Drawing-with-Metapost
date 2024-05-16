\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\mplibshowlog{enable}
\begin{mplibcode}
beginfig(1);


input feynmp;

beginfig(1);

    path p[];
    p1 = (left -- right) scaled 50 rotated 40;
    p2 = (left {dir 45} .. right {dir 45}) scaled 50 rotated 40;
    p3 = fullcircle scaled 72 yscaled 4/5;
    p4 = unitsquare shifted -(1/2, 1/2) scaled 50;

    interim labeloffset := 13;
    interim ahangle := 30;
    for i=1, 2, 3, 4:
        numeric y; y = 0;
        forsuffixes $=curly, zigzag, wiggly:
            drawarrow p[i] shifted (96i, 96(incr y)) withcolor 3/4[if i=4: red else: blue fi, white];
            draw $ p[i] shifted (96i, 96y);
            if i=1: label.ulft("\mpl{" & str $ & "}", 96(i, y)) fi;
        endfor
    endfor




endfig;
\end{mplibcode}
\end{document}
