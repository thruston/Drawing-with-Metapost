\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
picture s[]; 
path p; p = origin -- 42 right;
s1 = image(undraw (origin -- up) scaled 21; draw p;);
for i=2 upto 5:
    s[i] = image(
        draw p withcolor 7/8;
        p := p scaled sqrt 1/2;
        p := p rotated 45 .. reverse p rotated 135 shifted 42 right;
        draw p;
    ) shifted (80 * i - 80, 0);
endfor

beginfig(1);
draw s1; draw s2; draw s3; draw s4; draw s5;
ahangle := 30; y = 10;
drawoptions(withcolor (.2,.2,.7));  
drawarrow (50,y) -- (70, y);
drawarrow (130,y) -- (150, y);
drawarrow (205,y) -- (220, y);
drawarrow (285,y) -- (300, y);
drawoptions();
endfig;
\end{mplibcode}
\end{document}

