\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato Light}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\mplibnumbersystem{decimal}
\begin{document}
\begin{mplibcode}

input physics-thatch
numeric a, b; a = 200; b = 179; 
path orbit;  orbit = fullcircle xscaled 2a yscaled 2b;
beginfig(1);


  pair f[];
  f1 = (a +-+ b, 0);
  f2 = - f1;

  numeric t[]; t1 = 1; t2 = 1.4; t3 = 3.6; t4 = 4.5;

  path s[];
  s1 = f2 -- subpath (t1, t2) of orbit -- cycle;
  s2 = f2 -- subpath (t3, t4) of orbit -- cycle;

  thatch_angle := -30; thatch s1 withcolor 2/3 red;
  thatch_angle := +60; thatch s2 withcolor 2/3 red;
  
  draw s1;   
  draw s2;  

  draw orbit;
  ahangle := 30; ahlength := 8;
  path arrow[]; 
  arrow1 = subpath (t1 + 1/16, t2 - 1/16) of orbit scaled 1.05;
  arrow2 = subpath (t3 + 1/16, t4 - 1/16) of orbit scaled 1.05;

  drawarrow arrow1; drawarrow arrow2;
  label.urt("$\Delta t$", point 1/2 of arrow1);
  label.lft("$\Delta t$", point 1 of arrow2);

  draw f2 withpen pencircle scaled 8;
  undraw f2 withpen pencircle scaled 7;

endfig;
\end{mplibcode}
\end{document}


