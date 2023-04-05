\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
z1 = (10,10);
z4 = 144 right rotated 12;
z5 = z4 shifted (2, 78);
z7 = z4 reflectedabout(origin, (1,1));

z2 = 1/2 [z5, z7];
z9 = whatever [z1, z4];
z2-z9 = whatever * (z7-z1);
z8 = whatever [z1, z5] = whatever [z2, z4];
z3 = whatever [z2, z9] = whatever [z4, z7];
z6 = whatever [z1, z7] = whatever [z3, z5];

drawoptions(dashed withdots scaled 1/4 withcolor Blues 7 7);
draw z1 -- z4 -- z7 -- z1 -- z5 -- z6;
draw z4 -- z2 -- z9;
draw z5 -- z7;
drawoptions();

for i=1 upto 9:
    fill fullcircle scaled 12 shifted z[i] withcolor Blues 7 2;
    draw fullcircle scaled 12 shifted z[i] withcolor Blues 7 7;
    label("\textsf{" & decimal i & "}", z[i]);
endfor

for i=1 upto 2:
    draw (50i, 0) -- (50i, 150) dashed withdots scaled 1/4 withcolor Reds 7 7;
    draw (0, 50i) -- (150, 50i) dashed withdots scaled 1/4 withcolor Reds 7 7;
endfor

endfig;
\end{mplibcode}
\end{document}

