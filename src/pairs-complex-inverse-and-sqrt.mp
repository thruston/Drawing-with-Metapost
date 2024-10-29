\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef zinverse(expr z) = 1/abs z * dir - angle z enddef;
vardef zsqrt(expr z) = 
  if abs z > 0: sqrt(abs z) * dir 1/2 angle fi z
enddef;

z1 = 0.8 dir 148; z2 = 1.5 dir 60; z3 = 1.0 dir 42;

input colorbrewer-rgb
numeric u; u = 42; ahangle := 30;
picture axes; axes = image(
  path xx, yy; xx = (left--right) scaled 1.2 u; yy = xx rotated 90;
  draw fullcircle scaled 2u;
  drawarrow xx; label.rt("$\Re$", point 1 of xx);
  drawarrow yy; label.top("$\Im$", point 1 of yy);
);
vardef connect(expr a, b, shade) =
  save A, B; pair A, B; A = a scaled u; B = b scaled u;
  drawarrow A -- origin -- B
     cutafter fullcircle scaled 5 shifted B withcolor shade;
  draw A withpen pencircle scaled dotlabeldiam;
  draw B withpen pencircle scaled dotlabeldiam;
  draw B withpen pencircle scaled 2/3 dotlabeldiam withcolor white;
enddef;
picture P[];
P1 = image(draw axes withcolor 3/4;
  label.lrt("\small\texttt{zinverse()}", ulcorner axes shifted 10 left);
  connect(z1, zinverse(z1), SetTwo 7 3); 
  connect(z2, zinverse(z2), SetTwo 7 4); 
  connect(z3, zinverse(z3), SetTwo 7 5); 
);
P2 = image(draw axes withcolor 3/4;
  label.lrt("\small\texttt{zsqrt()}", ulcorner axes);
  connect(z1, zsqrt(z1), SetTwo 7 3); 
  connect(z2, zsqrt(z2), SetTwo 7 4); 
  connect(z3, zsqrt(z3), SetTwo 7 5); 
);
beginfig(1);
  labeloffset := 12; label.lft(P1, origin); label.rt(P2, origin);
endfig;
\end{mplibcode}
\end{document}

