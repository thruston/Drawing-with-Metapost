\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
picture axes, dot, opendot, P[];
numeric u; u = 42;
interim ahangle := 30;
axes = image(
    path xx, yy; xx = (left--right) scaled 1.2 u; yy = xx rotated 90;
    draw fullcircle scaled 2u;
    drawarrow xx; label.rt("$\Re$", point 1 of xx);
    drawarrow yy; label.top("$\Im$", point 1 of yy);
);
dot = image(fill fullcircle scaled dotlabeldiam);
opendot = image(draw dot; unfill fullcircle scaled 3/4 dotlabeldiam);
z1 = 0.7 dir 76;
z2 = 1.5 dir 60;
z3 = 1 dir 42;

vardef connect(expr a, b, shade) = 
    path c; c = (a -- origin -- b) scaled u;
    drawarrow c cutafter fullcircle scaled 5 shifted point 2 of c withcolor shade;
    draw dot shifted point 0 of c; draw opendot shifted point 2 of c;
enddef;

vardef zinverse(expr z) = 1/abs z * dir - angle z enddef;
vardef zsqrt(expr z) = if abs z > 0: sqrt(abs z) * dir 1/2 angle fi z enddef;

input colorbrewer-rgb
P1 = image(
draw axes withcolor 3/4;
label.lrt("\small\texttt{zinverse()}", ulcorner axes shifted 10 left);
for i=1 upto 3: connect(z[i], zinverse(z[i]), SetTwo[7][2+i]); endfor
);
P2 = image(
draw axes withcolor 3/4;
label.lrt("\small\texttt{zsqrt()}", ulcorner axes);
for i=1 upto 3: connect(z[i], zsqrt(z[i]), SetTwo[7][2+i]); endfor
);
beginfig(1);
    interim labeloffset := 12;
    label.lft(P1, origin);
    label.rt(P2, origin);
endfig;
\end{mplibcode}
\end{document}

