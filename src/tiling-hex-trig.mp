\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
vardef make_image(expr P, n, u, v, s, arrows) = 
  save currentpicture;
  picture currentpicture;
  currentpicture := nullpicture;
  for i = -n upto n:
    for j = -n upto n:
      draw P shifted (i * u + j * v);
    endfor
  endfor;
  if arrows:
    interim ahangle := 20;
    drawarrow origin--u dashed evenly scaled 1/2 withpen pencircle scaled 1/4 withcolor Reds 8 8;
    drawarrow origin--v dashed evenly scaled 1/2 withpen pencircle scaled 1/4 withcolor Blues 8 8;
    draw origin withpen pencircle scaled 1;
  fi
  clip currentpicture to s;
  draw s dashed withdots scaled 1/2;
  currentpicture
enddef;
beginfig(1);
  path hexagon, triangle; pair u, v; numeric n;
  triangle = for i=0 upto 2: (0, 16) rotated 120i -- endfor cycle;
  hexagon  = for i=0 upto 5: (0, 16) rotated  60i -- endfor cycle;

  u = point 0 of triangle - point 1 of triangle;
  v = u rotated -60;

  path s; s = superellipse(89 right, 89 up, 89 left, 89 down, 0.78);
  n = 8;
  picture P[];
  P3 = make_image(triangle, n, u, v, s, true);
  P6 = make_image(hexagon, n, u, v, s, true);

  picture T; T = image(
    path t'; t' = triangle reflectedabout(point 0 of triangle, point 1 of triangle);
    fill triangle withcolor Reds 8 2;
    fill t'       withcolor Blues 8 2;
    draw triangle;
    draw t';
  );
  P4 = make_image(T, n, u, v, s, true);
  picture H; H = image(
    path ha, hb;
    ha = hexagon reflectedabout(point 0 of hexagon, point 1 of hexagon);
    hb = hexagon reflectedabout(point 0 of hexagon, point 5 of hexagon);
    fill hexagon withcolor Oranges 8 2;
    fill ha withcolor Blues 8 2;
    fill hb withcolor Greens 8 2;
    draw hexagon; draw ha; draw hb;
  );
  P7 = make_image(H, n, u zscaled 1.732 dir 30, v zscaled 1.732 dir 30, s, true); 

  picture dualt, dualh;
  dualt = image(
    draw triangle withcolor 1/2; 
    for i=0 upto 2: draw origin -- point i+1/2 of triangle withcolor Reds 7 6; endfor
      draw currentpicture reflectedabout(point 0 of triangle, point 1 of triangle);
    ); 
    dualh = image(
      draw hexagon withcolor 1/2; 
      for i=0 upto 5: 
        draw origin -- point i+1/2 of hexagon withcolor Reds 7 6; 
      endfor
    ); 
    P5 = make_image(dualt, n, u, v, s, false);
    P8 = make_image(dualh, n, u, v, s, false);

    draw P3 shifted (-100, +100);
    draw P4 shifted (-100, -100);
    draw P5 shifted (-100, -300);
    draw P6 shifted (+100, +100);
    draw P7 shifted (+100, -100);
    draw P8 shifted (+100, -300);
  endfig;
  \end{mplibcode}
  \end{document}

