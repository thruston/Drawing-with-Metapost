\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path c, C; numeric r; r = 60;
c = fullcircle scaled 2r shifted (-r, 0);
C = fullcircle scaled 4r shifted (2r, 0);
numeric t, u;
(t, whatever) = C intersectiontimes C shifted (center c - center C);
(u, whatever) = c intersectiontimes (point t of C -- center c);
path s;
s = subpath (0, u) of c -- subpath (t, 4) of C -- cycle;
for i=0 upto r:
    draw (left--right) scaled 2r rotated -42 shifted (3i, 0) 
        withpen pencircle scaled 1/4 withcolor 2/3 blue;
endfor
clip currentpicture to s;
draw c; draw C; 
draw center c -- center C -- point t of C -- cycle;
endfig;
\end{mplibcode}
\end{document}
