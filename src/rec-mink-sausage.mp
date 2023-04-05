% ref Mandlebrot, FGoN, p.32 and p.48
\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path gene; gene = (0,0) -- (1,0) -- (1, -1) -- (2, -1);
gene := gene rotated - angle point length gene of gene;
gene := gene scaled (1 / abs point length gene of gene);
beginfig(1);
for n=5, 6:
    path p; p = gene scaled 300;
    for i = 1 upto n:
        p := for t = 1 upto length p:
            subpath (0, 2) of gene 
            zscaled (point t of p - point t-1 of p)
            shifted point t-1 of p -- endfor point length p of p;
    endfor
    p := p shifted (0, -144n);
    for i = 0 upto length p:
        fill fullcircle scaled 4
            shifted point i of p
            withcolor 7/8;
    endfor
    draw p withcolor 1/2;
endfor
endfig;
\end{mplibcode}
\end{document}

