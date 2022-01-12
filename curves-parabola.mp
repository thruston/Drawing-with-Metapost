\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);


    pair A, S;
    A = origin;
    S = 64 right;

    path parabola; parabola = left;
    path last; last = origin;
    for q = -144 step 8 until 144:
        pair Q; Q = (0, q);
        path ray; 
        ray = (origin -- unitvector(S - Q)) scaled 300 rotated if q < 0: - fi 90 shifted Q;
        draw ray withcolor 3/4;
        if length(last) > 0:
            pair t;
            t = whatever[point 0 of ray, point 1 of ray] = whatever[point 0 of last, point 1 of last];
            draw t withpen pencircle scaled 2 withcolor red;
            if xpart point 0 of parabola < 0:
                parabola := t;
            else:
                parabola := parabola .. t;
            fi
        fi
        last := ray;
    endfor

    draw parabola withcolor blue;
    draw (up--down) scaled 300;

    forsuffixes $=A,S:
        dotlabel.lft("$" & str $ & "$", $);
    endfor

    vardef signum(expr x) = if x=0: 1 else: abs(x) / x fi enddef;
    path cart;
    cart = subpath (1, infinity) of (origin for x=-304 step 8 until 304:  
        .. (x, 16 sqrt abs(x)) scaled signum(x) endfor);

    drawarrow cart withcolor 2/3 green;


endfig;
\end{mplibcode}
\end{document}
