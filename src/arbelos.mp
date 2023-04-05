\RequirePackage{luatex85}
\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
% invert path or pair P in circle C
vardef invert(expr P, C) = 
  save I, r; pair I; numeric r;
  I = center C;
  r = abs(point 0 of C shifted -I); 
  if pair P: if abs(P-I) > 0: unitvector(P-I) scaled (r/abs(P-I)*r) shifted fi I
  elseif path P:
     save T; numeric T;
     T = length P;
     for t=0 upto T-1: invert(point t of P, C) .. endfor if cycle P: cycle else: invert(point T of P, C) fi
  fi
enddef;  
beginfig(1);
    pair A,B,C;
    A = origin; C = 244 right;  B = 7/8[A, C];

    path c[];
    c1 = fullcircle scaled 2 abs(A-C); % large circle for the inversions
    c2 = fullcircle scaled abs(A-C) shifted 1/2[A,C];
    c3 = fullcircle scaled abs(A-B) shifted 1/2[A,B];
    c4 = fullcircle scaled abs(B-C) shifted 1/2[B,C];
    c5 = invert(c4,c1);

    numeric d; d = abs(point 0 of c5 - point 4 of c5); % diameter of c5

    drawoptions(withcolor 3/4 white);
    draw c4; draw c5;
    draw invert(subpath(0, 3/2) of c2, c1);
    draw invert(subpath(0, 3/2) of c3, c1);
    drawoptions();

    draw subpath(-1/4,1) of c1 withcolor 3/4[1/2 red,white];
    label.bot("\textit{circle of inversion}", point -1/4 of c1) withcolor 1/4[1/2 red, white];

    for i=1 upto 72:
        path c, c';
        c = c5 shifted (0, i*d);
        c' = invert(c, c1);
        if i<5: 
            drawoptions(withcolor 3/4 white);
            draw c; draw origin -- center c;
            fill fullcircle scaled dotlabeldiam shifted center c;
            fill fullcircle scaled dotlabeldiam shifted center c';
            drawoptions();
        fi
        draw c' withpen pencircle scaled 1/4 withcolor 2/3 blue;
    endfor

    forsuffixes $=2,3,4: draw subpath (0,4) of c$ 
        withpen pencircle scaled 1/4 withcolor 2/3 blue;
    endfor

    draw A--C;
    dotlabel.lft("$A$", A); dotlabel.llft("$B$", B); dotlabel.rt("$C$", C);
endfig;
\end{mplibcode}
\end{document}
