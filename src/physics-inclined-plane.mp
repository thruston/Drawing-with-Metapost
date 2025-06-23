\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  numeric theta; theta = 28;
  z0 = origin;
  z1 = 400 dir theta;
  x2 = x1; y2 = y0;

  path plane, block;
  plane = z0 -- z1 -- z2 -- cycle;
  block = unitsquare shifted 1/2 left xscaled 55 yscaled 21 rotated theta shifted .54[z0, z1];

  z4 = 89 dir theta;
  path mg, normal, friction, sinemg, cosmg;
  mg       = (origin -- -(y4, x4) rotated theta) shifted center block;
  sinemg   = (origin -- -(y4,  0) rotated theta) shifted center block;
  cosmg    = (origin -- -( 0, x4) rotated theta) shifted center block;
  friction = (origin --  (y4,  0) rotated theta) shifted center block;
  normal   = (origin --  ( 0, x4) rotated theta) shifted center block;

  input colorbrewer-rgb
  fill block withcolor Blues 6 1; draw block withcolor Blues 6 6;
  fill plane withcolor Reds 6 1;  
  draw unitsquare rotated 90 scaled 8 shifted point 2 of plane withcolor Reds 6 6;
  draw plane withcolor Reds 6 6; 

  ahangle := 30;

  drawarrow mg;
  drawarrow normal;
  drawarrow friction;

  drawarrow sinemg dashed evenly;
  drawarrow cosmg dashed evenly;

  label("$\theta$", (666/theta) * dir 1/2 theta) withcolor Reds 6 6;
 
  label.bot("$mg$", point 1 of mg);
  label.lft("$mg\sin\theta$", point 1 of sinemg);
  label.rt("$mg\cos\theta$", point 1 of cosmg);
  label.urt("$f$", point 1 of friction);
  label.ulft("$N$", point 1 of normal);

  draw center block withpen pencircle scaled dotlabeldiam;
  

endfig;
\end{mplibcode}
\end{document}

