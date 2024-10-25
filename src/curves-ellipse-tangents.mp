\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path ellipse; ellipse = fullcircle scaled 300 yscaled 5/8 rotated 8;
2a = abs (point 0 of ellipse - point 4 of ellipse);
2b = abs (point 2 of ellipse - point 6 of ellipse);
e = 1 +-+ b/a;

pair F[], A;
F1 = (1/2-e/2)[point 0 of ellipse, point 4 of ellipse];
F2 = (1/2+e/2)[point 0 of ellipse, point 4 of ellipse];
A = 240 dir 25;

path pp; pp = fullcircle scaled 2 abs (F1-A) shifted A;
path qq; qq = fullcircle scaled 4a shifted F2;
pair P, Q, T, T';
z1 = pp intersectiontimes qq; P = point x1 of pp; 
z2 = reverse pp intersectiontimes qq; Q = point -x2 of pp;
z3 = ellipse intersectiontimes (F2 -- P); T = point x3 of ellipse;
z4 = ellipse intersectiontimes (F2 -- Q); T' = point x4 of ellipse;

vardef f(expr x) = 
  angle (A-point x of ellipse) + 90 > angle direction x of ellipse
enddef;
drawarrow A -- point solve f(0, x3) of ellipse withcolor 2/3 blue;

draw subpath (x1 - 1/2, 17/2 - x2) of pp dashed withdots scaled 1/2;
draw subpath (y2 - 33/4, y1 + 1/4) of qq dashed withdots scaled 1/2;
draw T -- F1 -- P -- F2 -- Q -- F1 -- T' withcolor 1/2;
draw P -- A -- Q withcolor 1/2;
draw T -- A -- T' withcolor 2/3 red;
draw ellipse;

def dotlabelx(expr t, z, o) =
  draw z withpen pencircle scaled dotlabeldiam; label(t, z + o);
enddef;
dotlabelx("$F_1$", F1, 10 dir 241);
dotlabelx("$F_2$", F2, 8 dir 260);
dotlabelx("$A$", A, 8 dir 30);
dotlabelx("$P$", P, 10 dir 94);  dotlabelx("$Q$", Q, 10 dir 300);
dotlabelx("$T$", T, 10 dir 120); dotlabelx("$T'$", T', 10 dir -45);

input show_name
endfig;
\end{mplibcode}
\end{document}

