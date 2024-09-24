\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  pair P, A, B, C, A', B', C', R, S, T;
  P = 200 dir 102; 
  A = 100 dir 159; B = origin; C = 90 dir 42;

  A' = 3/8[P, A];  % the factors should not 
  B' = 1/2[P, B];  % be the same!
  C' = 5/8[P, C];

  R = whatever [A, B] = whatever [A', B'];
  S = whatever [B, C] = whatever [B', C'];
  T = whatever [C, A] = whatever [C', A'];

  path t[];
  t1 = A -- B -- C -- cycle;
  t2 = A' -- B' -- C' -- cycle;
  fill t1 withcolor 7/8[red, white];
  fill t2 withcolor 7/8[blue, white];
  draw t1 withcolor 1/2 white;
  draw t2 withcolor 1/2 white;

  drawoptions(dashed withdots scaled 1/2);
  draw P--A;
  draw P--B;
  draw P--C;

  drawoptions(dashed evenly scaled 1/2);
  draw B--R--B';
  draw C--S--C';
  undraw subpath (1/4, 3/4) of (C'--T) withpen
      pencircle scaled 5;
  draw C--T--C';
  
  drawoptions(withcolor 2/3 red);
    draw 9/8[S,R] -- 9/8[R,S];
    draw thelabel.bot("perspectrix", origin)
      rotated angle (T-R) shifted 1/2[T, R];
    dotlabel.urt("perspector", P);
  drawoptions();

  dotlabel.lft ("$A$ ", A);
  dotlabel.llft("$B$ ", B);
  dotlabel.lrt ("$C$ ", C);
  dotlabel.lft ("$A'$ ", A');
  dotlabel.llft("$B'$ ", B');
  dotlabel.bot ("$C'$ ", C');
  label.rt("\textsc{Desargues' Theorem}", 1/2[P, C'] shifted 10 right);
endfig;
\end{mplibcode}
\end{document}
