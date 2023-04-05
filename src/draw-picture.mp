\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric s; s = 21;
    path alpha;
    alpha = ((-2s, s) {right} 
        .. halfcircle rotated -90 scaled 2s shifted (2s, 0)
        .. {left} (-2s, -s)) shifted (s*left);
    
    vardef overdraw(expr a, b, r, P, shade) =
        linecap := butt;
        undraw subpath (a+r, b-r) of P withpen pencircle scaled 2;
        draw subpath (a, b) of P withcolor shade;
    enddef;

    picture cb; cb = image(
        draw alpha withcolor 2/3 red;
        undraw alpha rotated 180 withpen pencircle scaled 2;
        draw alpha rotated 180 withcolor 2/3 blue;
        overdraw(0.21, 0.36, 0.02, alpha, 2/3 red);
        overdraw(0.67, 0.86, 0.02, alpha, 2/3 red);
        overdraw(3.4,  4.3,  0.1,  alpha, 2/3 red);
        overdraw(5.4,  5.6,  0.02, alpha, 2/3 red);
        overdraw(5.4,  5.6,  0.02, alpha rotated 180, 2/3 blue);
    );

    picture P[];

    P1 = image(draw cb; label.rt("\texttt{draw cb;}", point 3/2 of bbox currentpicture)); 
    P2 = image(draw cb withpen pencircle scaled 4; label.rt("\texttt{draw cb withpen pencircle scaled 4;}", point 3/2 of bbox currentpicture));
    P3 = image(draw cb withcolor 1/2; label.rt("\texttt{draw cb withcolor 1/2;}", point 3/2 of bbox currentpicture));
    P4 = image(draw cb withpen pencircle scaled 4 withcolor 1/2; label.rt("\texttt{draw cb withpen pencircle scaled 4 withcolor 1/2;}", point 3/2 of bbox currentpicture));
    P5 = image(
        color bagel; bagel = 1/256(187, 146, 79);
        for i=4 step -1/4 until 1/2:
            draw cb withpen pencircle scaled i
                withcolor (i/4)[white, bagel];
        endfor
        label.rt(btex \vbox{\halign{\texttt{#}\cr
        for i=4 step -1/4 until 1/2:\cr
        \quad draw cb withpen pencircle scaled i \cr
        \qquad withcolor sqrt(i/4)[white, bagel];\cr
        endfor\cr}} etex, point 3/2 of bbox currentpicture);
    );
    
    P6 = image(
        for e within cb:
            draw pathpart e withpen penpart e scaled 4
                withcolor 7/8[colorpart e, background];
        endfor
        label.rt(btex \vbox{\halign{\texttt{#}\cr
        for e within cb:\cr
        \quad draw pathpart e withpen penpart e scaled 4\cr
        \qquad  withcolor 7/8[colorpart e, background];\cr
        endfor\cr}} etex, point 3/2 of bbox currentpicture);
    );

    for i=1 upto 6:
        if known P[i]: 
            pair p; p = 60i * down;
            label.rt(P[i], p); 
            fill superellipse(right, up, left, down, 0.8) scaled 6 shifted p 
                withcolor 2/3;
            label("\textsf{" & decimal i & "}", p) withcolor white;
        fi;
    endfor

endfig;
\end{mplibcode}
\end{document}
