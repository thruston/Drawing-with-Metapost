\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
r = 0.9;
z0 = (0, 0);
z1 = r*(89, -55);
z2 = r*(42, 30);
z3 = z1 + z2;

picture FE, FEV, E, EV, M, N, U, V;
FE  = thelabel("$f^*E$",   (x0, y0));
M   = thelabel("$M$",      (x0, y1));
E   = thelabel("$E$",      (x1, y0));
N   = thelabel("$N$",      (x1, y1));
FEV = thelabel("$f^*E_V$", (x2, y2));
U   = thelabel("$U$",      (x2, y3));
EV  = thelabel("$E_V$",    (x3, y2));
V   = thelabel("$V$",      (x3, y3));

forsuffixes @=E, M, N, U, V, EV, FE, FEV: draw @; endfor

ahangle := 20;
vardef connect(expr a, b) = 
  save line; path line; interim bboxmargin := 3;
  line = center a .. center b cutbefore bbox a cutafter bbox b;
  cutdraw line withpen pencircle scaled 4 withcolor background;
  drawarrow line
enddef;

connect(FEV, EV); 
connect(FEV, U);
connect(EV, V);
connect(U, V);

connect(FEV, FE);
connect(EV, E);
connect(U, M);
connect(V, N);

connect(FE, E);
connect(FE, M);
connect(E, N);
connect(M, N);
endfig;
\end{mplibcode}
\end{document}
