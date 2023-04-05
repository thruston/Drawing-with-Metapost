\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    pair O, S; O = origin; S = 66 right;
    path parabola, last;
    for q = -144 step 8 until 144:
        pair Q; Q = (0, q); 
        path ray; 
        ray = (origin -- unitvector(S - Q)) scaled 300 
              rotated if q < 0: - fi 90 shifted Q;
        draw S -- ray withcolor 7/8;
        if known last:
            pair t;
            t = whatever[point 0 of ray, point 1 of ray] 
              = whatever[point 0 of last, point 1 of last];
            parabola := if known parabola: parabola .. fi t;
        fi
        last := ray;
    endfor

    draw parabola withcolor 3/4[red, white];
    for t=0 upto length parabola:
        draw point t of parabola withpen pencircle scaled 3/2 withcolor red;
    endfor
    draw (up--down) scaled 300;

    dotlabel.lft("$A$", O);
    dotlabel.rt("$S$", S);

    % vardef signum(expr x) = if x=0: 1 else: abs(x) / x fi enddef;
    % path cart;
    % cart = subpath (1, infinity) of (origin for x=-304 step 8 until 304:  
    %     .. (x, 16 sqrt abs(x)) scaled signum(x) endfor);

    % drawarrow cart withcolor 1/3 green;
endfig;
\end{mplibcode}
\end{document}
