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
  path T; T = origin -- 377 dir 10 -- 233 dir 70 -- cycle;
  pair m;
  m = whatever * (point 0 of T - point 1 of T) rotated 90 shifted point 1/2 of T 
    = whatever * (point 1 of T - point 2 of T) rotated 90 shifted point 3/2 of T 
    = whatever * (point 2 of T - point 3 of T) rotated 90 shifted point 5/2 of T; 
    
  drawoptions(withcolor 3/4);
    draw unitsquare scaled 5 rotated angle (point 1 of T-point 0 of T) shifted point 1/2 of T;
    draw unitsquare scaled 5 rotated angle (point 2 of T-point 1 of T) shifted point 3/2 of T;
    draw unitsquare scaled 5 rotated angle (point 0 of T-point 2 of T) shifted point 5/2 of T;
  drawoptions(dashed evenly scaled 1/4 withcolor 1/2);
    draw through(point 1/2 of T, m, 10);
    draw through(point 3/2 of T, m, 10);
    draw through(point 5/2 of T, m, 10);
  drawoptions();
    draw fullcircle scaled 2 abs (point 0 of T - m) shifted m withcolor 2/3 red;
    draw T;

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
    
    mark_equal(point 0 of T, point 1 of T, 1);
    mark_equal(point 1 of T, point 2 of T, 2);
    mark_equal(point 2 of T, point 0 of T, 3);

endfig;
\end{mplibcode}
\end{document}

