\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef make_tree(expr bar) = 
  save a; numeric a; a = abs(point 1 of bar - point 0 of bar);
  cutdraw bar withpen pencircle scaled 1.2(1/8 a) withcolor background;
  cutdraw bar withpen pencircle scaled (1/8 a) withcolor 1/256(148,98,58);
  if a > leaf:
    save s; pair s; 
    s = 1/32 a * r * unitvector(direction 1 of bar) rotated 90;
    make_tree(
      bar shifted - point 0 of bar 
      shifted s scaled r rotated theta
      shifted point 1 of bar 
    );
    make_tree(
      bar shifted - point 0 of bar 
      shifted -s scaled r rotated -theta
      shifted point 1 of bar 
    );
  else:
    draw point 1 of bar withpen pencircle scaled 2 withcolor 2/3 green;
  fi
enddef;
beginfig(1);
  numeric leaf, r, theta;
  leaf = 3; r = 0.71; theta = 14; 
  make_tree(origin -- 100 up);
endfig;
\end{mplibcode}
\end{document}

