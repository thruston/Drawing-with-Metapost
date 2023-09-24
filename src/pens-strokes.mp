\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

path S;

S = origin .. (40, 10) .. (100, -10) .. (144, 10);
% S := origin -- 100 dir 30 -- 200 right;


beginfig(1);
draw S shifted 100 up;

n = 32; w = 8;
for i=0 upto n * length S:
    z[i] = point i/n of S;
    penpos[i](w * (1 - i / (n * length S)), 90 + angle direction i/n of S);
endfor

penstroke z0e {direction 0 of S} for i=1 upto n * length S: .. z[i]e {direction i/n of S} endfor;

picture A; A = image(
    fill S rotatedabout(point infinity of S, -2) & reverse
         S rotatedabout(point infinity of S, +2) .. cycle; 
);

picture B; B = image(
    for i=0 step 1/512 until length S:
        draw point i of S withpen pencircle scaled (8 * (1 - i / length S))
            withcolor (i / length S)[1/2 blue, white];
    endfor
);
numeric n; n = 5;
path star; star = for i=0 upto n-1: 6 up rotated (720/n*i) -- endfor cycle; 
picture C; C = image(
    numeric t, i, a; t = i = a = 0;
    for k=0 upto 100:
        show (t, arclength S);
        exitif t >= arclength S;
        a := arctime t of S;
        fill star rotated angle direction a of S shifted point a of S
            withcolor if odd incr i: blue else: red fi;
        t := t + arclength subpath (2, 3) of star;
        star := star scaled 0.928;
    endfor
);

draw A shifted 50 down;
draw B shifted 50 up;
draw C shifted 100 down;


endfig;
\end{mplibcode}
\end{document}

