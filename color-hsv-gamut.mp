\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input color-hsv-macro
beginfig(1);
    defaultfont := "phvr8r";
    numeric s[], v[];
    s0 = 1/2; v0 = 7/8;
    s1 = 7/8; v1 = 7/8;
    s2 = 7/8; v2 = 1/2;
    for y=0 upto 2:
        for h=0 step 15 until 360:
            fill fullcircle scaled 24 shifted (h, -32y) withcolor hsv_color(h, s[y], v[y]);
            draw fullcircle scaled 24 shifted (h, -32y) withcolor white;
            if y=1: label(decimal h infont defaultfont scaled 1/2, (h,-16)); fi
        endfor
    endfor

    label.urt("Less saturation", (-20,12));
    label.lrt("Lower value", (-20,-76));

    drawarrow (-15, -12) -- (-15,12);
    drawarrow (-15, -52) -- (-15,-76);
endfig;
\end{mplibcode}
\end{document}

