\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato Light}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  def thickly = withpen pencircle scaled 3/4 enddef;
  def thinly =  withpen pencircle scaled 1/4 enddef;

  path ground, block, plank;

  ground = (left -- right) scaled 200;
  block = unitsquare xscaled 36 yscaled 100 shifted point 1/32 of ground;
  plank = unitsquare xscaled 360 yscaled 6;
  plank := plank shifted (point 31/32 of ground - point 1 of plank);

  numeric theta; theta = angle (point 1 of plank - point 2 of block);
  plank := plank rotatedabout(point 1 of plank, theta);

  draw ground;
  draw block thinly;
  draw plank;

  for i = 0 upto 18:
    numeric t; path tick;
    t = 1/32 + i/20;
    tick = (origin -- 3 down) rotated angle direction t of plank shifted point t of plank;
    draw tick thinly;  
    if (i > 0) and (i < 11): 
      label.bot("\footnotesize " & decimal i, point 1 of tick shifted (if i<10: -3 else: 0 fi,2)); 
    fi
  endfor

  path b[];
  b0 = fullcircle shifted 1/2 left scaled 14 rotated (270 + theta) shifted point 3 - 1/32 of plank;
  for i = 1, 2, 3: 
    b[i] = b0 shifted (point 3 - 1/32 - (i*i)/20 of plank - point 3-1/32 of plank); 
  endfor

  drawoptions(withcolor 2/3 red);
  draw b0;  
  draw b1 dashed evenly scaled 1/2 thinly;
  draw b2 dashed evenly scaled 1/2 thinly;
  draw b3 dashed evenly scaled 1/2 thinly;
  drawoptions();

  label.ulft("``START''", point 6 of b0);
  label.urt("``ONE''", point 3 of b1);
  label.urt("``TWO''", point 3 of b2);
  label.urt("``THREE''", point 3 of b3);

  label("$D\propto t^2$", (80, 112));


endfig;
\end{mplibcode}
\end{document}

