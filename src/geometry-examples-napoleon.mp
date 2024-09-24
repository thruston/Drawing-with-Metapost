\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def equilateral_triangle_point(expr a, b) = 
  a rotatedabout(b, 60) 
enddef;
primarydef o beyond z = z scaled (1+o/abs(z)) enddef;
beginfig(1);
  randomseed := 543.01811;

  pair A, B, C, D, E, F, G, H, I;
  A = 91 dir (  0 + 18 normaldeviate);
  B = 92 dir (120 + 18 normaldeviate);
  C = 93 dir (240 + 18 normaldeviate);

  D = equilateral_triangle_point(A, B);
  E = equilateral_triangle_point(B, C);
  F = equilateral_triangle_point(C, A);

  G = 1/3(A + B + D);
  H = 1/3(B + C + E);
  I = 1/3(C + A + F);

  draw A -- B -- C -- cycle withcolor blue;
  draw A -- D -- B -- E -- C -- F -- cycle withcolor 3/4;
  draw G -- H -- I -- cycle withcolor 2/3 red;

  forsuffixes @ = A, B, C, D, E, F, G, H, I:
    draw @ withpen pencircle scaled dotlabeldiam;
    label("$" & str @ & "$", 10 beyond @);
  endfor

  label.bot("\textsc{Napoleon's Theorem}", 
    point 1/2 of bbox currentpicture);
endfig;
\end{mplibcode}
\end{document}

