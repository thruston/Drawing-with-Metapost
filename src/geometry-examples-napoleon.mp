\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def equilateral_triangle_point(expr a, b) = 
  a rotatedabout(b, 60) 
enddef;
def beyond(expr z, o) = 
  z scaled (1+o/abs(z)) 
enddef;
beginfig(1);
  randomseed := 543.01811;
  z1 = 91 dir (  0 + 18 normaldeviate);
  z2 = 92 dir (120 + 18 normaldeviate);
  z3 = 93 dir (240 + 18 normaldeviate);

  z4 = equilateral_triangle_point(z1, z2);
  z5 = equilateral_triangle_point(z2, z3);
  z6 = equilateral_triangle_point(z3, z1);

  z7 = 1/3(z1 + z2 + z4);
  z8 = 1/3(z2 + z3 + z5);
  z9 = 1/3(z3 + z1 + z6);

  draw z1--z2--z3--cycle withcolor blue;
  draw z1--z4--z2--z5--z3--z6--cycle withcolor 3/4;
  draw z7--z8--z9--cycle withcolor 2/3 red;

  for i=1 upto 9:
    draw z[i] withpen pencircle scaled dotlabeldiam;
    label("$" & char (64+i) & "$", beyond(z[i], 10));
  endfor

  label.bot("\textsc{Napoleon's Theorem}", 
    point 1/2 of bbox currentpicture);
endfig;
\end{mplibcode}
\end{document}

