\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{graphicx}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
%label("$\includegraphics{ring-11.png}$", origin);
path S; 
S = (-117, 4) {dir 30} .. {right} 30 up .. {dir -36} (117, -4) .. {left} 88 down 
    .. (-200, -50) .. {up} (-266, 30) {down} -- (-266, -50) 
    .. (-200, -108) {dir -28} .. 148 down {right}
    .. (200, -108) .. {up} (266, -30);
S := S & subpath (5, 2) of S rotated 180 & cycle;
input colorbrewer-rgb

fill S withcolor Greens 8 3;
fill S rotated 180 withcolor Reds 8 3;

picture rules; rules = image(
    for t=0 step 1/32 until directiontime down of subpath(12, 13) of S:
        draw point 12+t of S -- point 12+t of S shifted 100 down
            cutafter S;
    endfor
    for t=3 step 1/16 until 5:
        draw point t of S -- point t of S shifted 100 down cutafter subpath (6, 8) of S;
    endfor
    for t=8+1/16 step 1/16 until 12:
        draw point t of S -- 1/2[point 1 of S, point 3 of S] cutafter subpath (1, 3) of S;
    endfor
);

for r = 0, 180:
    draw rules rotated r;
    draw S rotated r;
endfor


endfig;
\end{mplibcode}
\end{document}

