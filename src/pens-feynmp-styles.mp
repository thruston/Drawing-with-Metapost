\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\mplibshowlog{enable}
\begin{mplibcode}
input feynmp;
beginfig(1);
  path p[];
  p1 = (left -- right) scaled 50 rotated 40;
  p2 = (left {dir 45} .. right {dir 45}) scaled 50 rotated 40;
  p3 = fullcircle scaled 72 yscaled 4/5;
  p4 = unitsquare shifted -(1/2, 1/2) scaled 50;

  labeloffset := 13;
  ahangle := 30;
  for i=1, 2, 3, 4:
    numeric y; y = 0;
    forsuffixes $=curly, zigzag, wiggly:
      drawarrow p[i] shifted (96i, 96(incr y)) withcolor 3/4[if i=4: red else: blue fi, white];
      draw $ p[i] shifted (96i, 96y);
      if i=1: label.ulft("\mpl{" & str $ & "}", 96(i, y)) fi;
    endfor
  endfor

  label.bot("The un-morphed paths are drawn faintly in colour behind the morphed paths.", point 1/2 of bbox currentpicture);
  label.bot("The macros work on open or closed paths, \red{provided there are no sharp corners}.", point 1/2 of bbox currentpicture shifted 7 up);

  label.ulft("\red{Hmmm...}", point 2 of p4 shifted (4*96, 104));

endfig;
\end{mplibcode}
\end{document}
