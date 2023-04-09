\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def width(expr P) = xpart (urcorner P - llcorner P) enddef;
picture s[]; 
path p; p = origin -- 16 right;
s1 = image(undraw (origin -- up) scaled 21; draw p; 
        for t=0, 1:
            draw point t of p withpen pencircle scaled 3/2 withcolor 0.74 red;
        endfor
);
for i=2 upto 5:
    s[i] = image(
        p := p rotated 45;
        p := p & reverse p rotatedabout(point length p of p, 90);
        draw p;
        for t=0, 1/2 length p, length p:
            draw point t of p withpen pencircle scaled 3/2 withcolor 0.74 red;
        endfor
    ) shifted (0 for j=i-1 downto 1: + width(s[j]) + 30 endfor, 0);
endfor

beginfig(1);
draw s1; draw s2; draw s3; draw s4; draw s5;
ahangle := 30;
drawoptions(withcolor (.2,.2,.7));  
for i=1 upto 4:
    drawarrow (origin -- 14 right) shifted (xpart lrcorner s[i] + 6, 4);
endfor
drawoptions();
endfig;
\end{mplibcode}
\end{document}

