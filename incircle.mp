\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef through(expr a, b, o) = 
    save t; numeric t; t = 1+o/abs(a-b);
    t[b,a] -- t[a,b]
enddef;

beginfig(1);
    pair A, B, C;
    A = origin; B = 377 dir 10; C = 233 dir 70;
  pair a, b, m, t;
  a = A + 22 unitvector (C-A) + 22 unitvector (B-A);
  b = B + 22 unitvector (A-B) + 22 unitvector (C-B);
  m = whatever[A,a] = whatever [B,b]; t = whatever[A,B];
  t-m = whatever * (B-A) rotated 90;

  drawoptions(dashed evenly scaled 1/4 withcolor 1/2 white);
    draw t -- m;
    draw unitsquare scaled 5 rotated angle (B-A) shifted t;
    draw through(A, m, 10);
    draw through(B, m, 10);
  drawoptions();
    draw fullcircle scaled 2 abs (t-m) shifted m withcolor 2/3 red;
    draw A--B--C--cycle;
    dotlabel.top(btex $m$\thinspace\strut etex, m);
    dotlabel.bot(btex $t$ etex, t);
    dotlabel.bot(btex $A$ etex, A);
    dotlabel.urt(btex $B$ etex, B);
    dotlabel.top(btex $C$ etex, C);
    dotlabel.top(btex $a$ etex, a);
    dotlabel.top(btex $b$ etex, b);
endfig;
\end{mplibcode}
\end{document}

