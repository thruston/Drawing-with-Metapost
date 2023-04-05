\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input tangent-times
color tb; tb = (0.2, 0.2, 0.7);
beginfig(1);
path A, B;
A = fullcircle scaled 144;
B = fullcircle scaled 60 shifted (200, 140);

numeric R, r;
R = abs (point 0 of A - center A);
r = abs (point 0 of B - center B);

path C; numeric t, u;
C = fullcircle scaled (2R-2r) shifted center A;
(t, u) = tangent_times(C, center B);

draw A withpen pencircle scaled 2 withcolor 3/4[blue, white];
draw B withpen pencircle scaled 2 withcolor 3/4[blue, white];
draw C withpen pencircle scaled 1 withcolor 7/8[blue, white];

draw subpath (t, u) of C -- center B -- cycle dashed evenly withcolor 1/2;
draw subpath (t, u) of A -- subpath (u-8, t) of B -- cycle;

drawoptions(dashed withdots scaled 1/2 withcolor 1/4);
forsuffixes $=t, u: 
    draw point $ of C -- point $ of A; 
    draw center B -- point $ of B;
endfor

drawoptions(withcolor tb);
label.urt("$A$", point 1 of A);
label.ulft("$B$", point 4 of B); 
label.urt("$C$", point 1/2 of C);
drawdot center B withpen pencircle scaled dotlabeldiam;

drawoptions();
dotlabel.lrt("$t$", point t of C);
dotlabel.ulft("$t'$", point t of A);
dotlabel.ulft("$t''$", point t of B);
dotlabel.ulft("$u$", point u of C);
dotlabel.lrt("$u'$", point u of A);
dotlabel.lrt("$u''$", point u of B);

label.rt("$r$", 1/2[center B, point t of B]);
label.rt("$r$", 1/2[point t of C, point t of A]);


endfig;
\end{mplibcode}
\end{document}

