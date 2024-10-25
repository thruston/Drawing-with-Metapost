\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  path Y, L, C, P, S;
  
  % solve parameters for cycloid
  vardef u(expr x) = x - sind(57.295779513 x) enddef;
  vardef v(expr x) = 1 - cosd(57.295779513 x) enddef;
  vardef f(expr t) = u(t) < v(t) enddef;
  tolerance := epsilon; a = solve f(2,3);
  s = 1/64 a;
  Y = (origin for t = s step s until a+eps:
    -- (u(t), -v(t))  % negative v(t) so curve is inverted
  endfor) scaled 160;  
  z0 = point 0 of Y;
  z1 = point infinity of Y;

  % define the four other paths
  L = z0 -- z1;  
  C = quartercircle rotated 180 scaled 2x1 shifted (x1, y0);
  P = z0{1,-2} ... (1/2[x1, x0], 1/4[y1, y0]){1,-1} ... z1 {1, 0};
  S = z0{1,-6} ... (1/2[x1, x0], 1/64[y1, y0]){1, -6/32} ... z1 {1, 0};

  draw z0 -- (x0,y1) -- z1 withcolor 3/4;
  drawoptions(withcolor 2/3 red);         
    draw L; dotlabel.urt("Line", point 1/4 of L);
  drawoptions(withcolor 1/2 green);       
    draw C; dotlabel.urt("Circle", point 1 of C);
  drawoptions(withcolor 1/4[red, green]); 
    draw P; dotlabel.urt("Parabola", point 1/2 of P);
  drawoptions(withcolor 3/4[red, green]); 
    draw S; dotlabel.llft("Sixth degree", point 3/4 of S);
  drawoptions(withcolor 1/2 blue);        
    draw Y; dotlabel.urt("Cycloid", point 50 of Y);
  drawoptions();

  dotlabel.urt("$A$", z0);
  dotlabel.urt("$B$", z1);
endfig;
\end{mplibcode}
\end{document}
