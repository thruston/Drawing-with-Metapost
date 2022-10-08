\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef through(expr a, b, o) = 
    save t; numeric t; t = 1+o/abs(a-b);
    t[b,a] -- t[a,b]
enddef;

beginfig(1);
    pair A, B, C;
    A = origin; B = 377 dir 10; C = 233 dir 70;
    pair m, a, b, c; 
    a = 1/2[A, B]; b = 1/2[B, C]; c = 1/2[C, A];
    m = whatever * (A-B) rotated 90 shifted a
      = whatever * (B-C) rotated 90 shifted b
      = whatever * (C-A) rotated 90 shifted c;
    
  drawoptions(withcolor 3/4);
    draw unitsquare scaled 5 rotated angle (B-A) shifted a;
    draw unitsquare scaled 5 rotated angle (C-B) shifted b;
    draw unitsquare scaled 5 rotated angle (A-C) shifted c;
  drawoptions(dashed evenly scaled 1/4 withcolor 1/2);
    draw through(a, m, 10);
    draw through(b, m, 10);
    draw through(c, m, 10);
  drawoptions();
    draw fullcircle scaled 2 abs (A-m) shifted m withcolor 2/3 red;
    draw A--B--C--cycle;

    dotlabel.llft("$A$", A);
    dotlabel.rt("$B$", B);
    dotlabel.ulft("$C$", C);
    draw m withpen pencircle scaled dotlabeldiam; label("$m$", m + 10 dir 12);

vardef mark_equal(expr a, b, n) = 
    save m, s; picture m; m = image(
        numeric s; 2s = n - 1; for t=-s upto s:
            draw (down--up) scaled 2 rotated -13 shifted (t,0) withpen pencircle scaled 1/4;
        endfor
    );
    draw m rotated angle (b-a) shifted 1/4[a,b];
    draw m rotated angle (b-a) shifted 3/4[a,b];
enddef;
    
    mark_equal(A, B, 1);
    mark_equal(B, C, 2);
    mark_equal(C, A, 3);

endfig;
\end{mplibcode}
\end{document}

