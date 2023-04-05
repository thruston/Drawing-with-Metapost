\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
input colorbrewer-rgb
path o, r[];
o = (for i=0 upto 7: 21 dir 45i -- endfor cycle) rotated -90/4;
pair t; t = whatever[point 0 of o, point 1 of o]
          = whatever[point 2 of o, point 3 of o];
r1 = subpath (1,2) of o -- t -- cycle;
r2 = r1 rotated 90;
r3 = r2 rotated 90;
r4 = r3 rotated 90;

picture filler; 
filler = image(
    filldraw r1 withcolor Reds 8 3;
    filldraw r2 withcolor Blues 8 3;
    filldraw r3 withcolor Reds 8 3;
    filldraw r4 withcolor Blues 8 3;
    filldraw o withcolor Purples 8 2;
);
pair u, v;
u = point 0 of o - point 5 of o; v = u rotated 90;
beginfig(1);
numeric n;  n = 5;
for i=-n upto n:
    for j=-n upto n:
        draw filler rotated ((i+j) mod 2 * 90) shifted (i*u + j * v);
    endfor
endfor
for i=-n upto n:
    for j=-n upto n:
        draw o shifted (i*u + j * v);
    endfor
endfor
endfig;
\end{mplibcode}
\end{document}
