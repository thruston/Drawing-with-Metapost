\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path base;
base = for t=0 upto 11: 42 up rotated -30t .. endfor cycle;

path limacon; limacon = for t=0 upto length base - 1:
    42 dir angle point 2t of base
         shifted point t of base ..
endfor cycle;

draw base withcolor 2/3 blue;

for i=1 upto 9:
    draw point i/10 of base -- point i/10 of limacon 
        withpen pencircle scaled 1/4
        withcolor 7/8;
endfor
for i=1 step 1 until 12:
    draw center base -- point i of base -- point i of limacon 
        withpen pencircle scaled 1/4
        withcolor 3/4;
    draw point i of base withpen pencircle scaled 2;
    %draw point i of limacon withpen pencircle scaled 1;
endfor
draw limacon withcolor 2/3 red;

draw origin withpen pencircle scaled 2;

endfig;
\end{mplibcode}
\end{document}

