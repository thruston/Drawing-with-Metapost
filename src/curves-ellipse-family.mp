\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef dp(expr x) = substring(0, 5) of decimal x enddef;
beginfig(1);

  pair F[], o;

  -F1 = F2 = 55 dir 34;

  o = 1/2[F1, F2];

  dotlabel.lrt("$F_1$", F1);
  dotlabel.lrt("$F_2$", F2);

  2d = abs(F1 - F2);
  r = angle(F1 - F2);

  for i = 0 upto 8:
    a := d * (1 + 1/4 i);
    b := a +-+ d;
    e :=  1 +-+ b/a;
    path ee; ee = fullcircle xscaled 2a yscaled 2b rotated r shifted o;
    draw ee; 
    picture tl; tl = thelabel.top(TEX("$e=" & dp(e) & "$"), origin);
    draw tl rotated angle direction 2 of ee shifted point 2 of ee;
  endfor

endfig;
\end{mplibcode}
\end{document}

