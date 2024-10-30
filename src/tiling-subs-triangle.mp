\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}

vardef tall(expr level, a, b, c) = 
  if level = 0:
    fill a--b--c--cycle  withcolor 3/4[blue, white];
    draw a--c--b;
  else:
    save m; pair m; m = 1/3 (a + b + c);  % the centroid
    wide(level - 1, a, b, m);
    wide(level - 1, b, c, m);
    wide(level - 1, c, a, m);
  fi
enddef;
vardef wide(expr level, a, b, c) = 
  if level = 0:
    fill a--b--c--cycle withcolor 7/8[blue, white];
    draw a--c--b;
  else:
    save p, q; pair p, q; p = 1/3[a,b]; q = 1/3[b,a];
    wide(level - 1, c, a, p);
    tall(level - 1, p, q, c);
    wide(level - 1, b, c, q);
  fi
enddef;

beginfig(1);

  picture P[];
  for i=0,1,2: z[1+i] = 173.2 up rotated 120i; endfor
  for i=0,1,2: z[4+i] = 17.32 up rotated 120i; endfor

  P1 = image(
    pickup pencircle scaled 1/8;
    tall(6, z1, z2, z3);
  );

  P2 = image(
    tall(0, z4, z5, z6)
  );
  P3 = image(
    tall(1, z4, z5, z6)
  );
  P4 = image(
    drawarrow 10 left -- 10 right;
    label.lft(P2, 12 left);
    label.rt(P3, 12 right);
    label.top("The \textit{tall} macro dissects a tall triangle into 3 wide ones", 
    point 5/2 of bbox currentpicture shifted 6 up);
  );

  P5 = image(
    wide(0, z5, z6, origin)
  );
  
  P6 = image(
    wide(1, z5, z6, origin)
  );

  P7 = image(
    drawarrow 10 left -- 10 right;
    label.lft(P5, 12 left);
    label.rt(P6, 12 right);
    label.top("The \textit{wide} macro dissects a wide triangle into 2 wides, and 1 tall.", 
    point 5/2 of bbox currentpicture shifted 6 up);
  );

  draw P1;
  label.top(P7, point 5/2 of bbox currentpicture shifted 12 up);
  label.top(P4, point 5/2 of bbox currentpicture shifted 12 up);

  label.bot(btex \vbox{\hsize 4.2in\raggedright\noindent
      Note that only part of the perimeter of each triangle is drawn, to give
      the illusion that the completed tiling is made up of identical rhombs.} etex, 
      point 1/2 of bbox currentpicture shifted 12 down);
endfig;
\end{mplibcode}
\end{document}

