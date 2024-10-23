\RequirePackage{luatex85}
\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef invert(expr P, C) =    % invert path P or pair P in circle C
  save I, r, s, T; pair I; I = center C; r = abs(point 0 of C-I);   
  if pair P: s = abs(P-I); I if s > eps: + (P-I) / s * r / s * r fi 
  elseif path P: T = length P; for t=0 upto T-1: 
    invert(point t of P, C) .. endfor 
    if cycle P: cycle else: invert(point T of P, C) fi
  fi
enddef;  
beginfig(1);
  pair A,B,C; A = origin; C = 254 right;  B = 7/8[A, C];
  path c[];
  c1 = fullcircle scaled 2 abs(A-C); % large circle for the inversions
  c2 = fullcircle scaled abs(A-C) shifted 1/2[A,C];
  c3 = fullcircle scaled abs(A-B) shifted 1/2[A,B];
  c4 = fullcircle scaled abs(B-C) shifted 1/2[B,C];
  c5 = invert(c4,c1);

  drawoptions(withcolor 3/4 white);
    draw c4; draw c5;
    draw invert(subpath(-3/8, 3/2) of c2, c1);  % vertical lines
    draw invert(subpath(-3/8, 3/2) of c3, c1);

  drawoptions(withcolor 1/2 red);
    draw subpath(-1/4,7/8) of c1 withpen pencircle scaled 1/4;
    label.lft("\textit{circle of inversion}", point 7/8 of c1);

  numeric d; d = abs(point 0 of c5 - point 4 of c5); % diameter of c5
  for i=1 upto 48:
    path c, c'; c = c5 shifted (0, i*d); c' = invert(c, c1);
    draw c' withpen pencircle scaled 1/4 withcolor 2/3 blue;
    if i<5: 
      drawoptions(withcolor 3/4 white);
        draw c; draw origin -- center c;
        draw center c withpen pencircle scaled dotlabeldiam;
        draw center c' withpen pencircle scaled dotlabeldiam;
      drawoptions();
    fi
  endfor

  drawoptions(withcolor 2/3 blue);
    draw A--C;
    draw subpath (0,4) of c2 withpen pencircle scaled 1/4;
    draw subpath (0,4) of c3 withpen pencircle scaled 1/4;
    draw subpath (0,4) of c4 withpen pencircle scaled 1/4;
    dotlabel.lft("$A$", A); dotlabel.llft("$B$", B); dotlabel.rt("$C$", C);
endfig;
\end{mplibcode}
\end{document}
