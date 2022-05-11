\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path xx, yy;
xx = (left -- right) scaled 150;
yy = (down -- up) scaled 150;

path ff, negative_ff;
ff = (1,1) for x = 3/2 step 1/2 until 6: ... (x, 1/x) endfor;
ff := reverse ff reflectedabout(origin, dir 45) & ff;
ff := ff scaled 24;
negative_ff = ff reflectedabout(origin, dir -45);

for i=-6 upto 6:
    draw xx shifted (0, 24i) withpen pencircle scaled 1/4 withcolor 7/8;
    draw yy shifted (24i, 0) withpen pencircle scaled 1/4 withcolor 7/8;
endfor

forsuffixes @ = ff, negative_ff:
    draw @ withcolor 2/3 red;
    for i=0 upto length @: 
        draw point i of @ withpen pencircle scaled 1; 
    endfor
endfor

label("$y = 1/x$", (-84, 84));
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);
endfig;
\end{mplibcode}
\end{document}

