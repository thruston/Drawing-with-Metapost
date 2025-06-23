\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{unicode-math}
\setmathfont{Lete Sans Math}
\setmainfont{Lato Light}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  ahangle := 24;
  pair F, F';
  F = 64 dir 6;
  F' = 128 dir -108;

  picture P[];

  P0 = image(
    drawarrow origin -- F  withcolor 1/2;
    drawarrow origin -- F' withcolor 1/2;
    draw origin withpen pencircle scaled dotlabeldiam;
    label("$F$", 6 up rotated angle F shifted 1/2 F);
    label("$F'$", 6 down rotated angle F' shifted 1/2 F');
  );
  P1 = image(
    z0 = 42 dir 144;
    label("\vbox{\hsize 60pt\raggedright\small Forces applied here}", z0);
    draw (z0 shifted (-8,-7) -- origin) cutafter fullcircle scaled 8 
      withpen pencircle scaled 1/4;
    draw P0;
    label.bot("\strut\footnotesize (a)", point 1/2 of bbox currentpicture);
  );

  P2 = image(
    drawarrow F -- F+F' dashed evenly withcolor 3/4; label.lrt("$F'$", 1/2[F, F+F']);
    drawarrow F' -- F+F' dashed evenly withcolor 3/4; label.lrt("$F$", 1/2[F', F'+F]);
    drawarrow origin -- F+F';  label.urt("$F+F'$", 1/3 (F+F'));

    draw P0;
    label.bot("\strut\footnotesize (b)", point 1/2 of bbox currentpicture);
  );

  P3 = image(
    path axis;
    pair F, Fx;
    numeric r, theta; r = 18; theta = 42;
    axis = (55 left -- 144 right) rotated r;
    F = 80 dir theta rotated r;
    Fx = xpart (F rotated -r) * right rotated r;

    drawarrow axis withpen pencircle scaled 1/4 withcolor 3/4;

    drawarrow origin -- F;
    drawarrow origin -- Fx;



  

    label.bot("\strut\footnotesize (c)", point 1/2 of bbox currentpicture);

  );

  draw P1;
  draw P2 shifted 100 right;
  label.urt(P3, lrcorner currentpicture);

endfig;
\end{mplibcode}
\end{document}

