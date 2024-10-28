\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibshowlog{enable}
\begin{mplibcode}
% randomseed := uniformdeviate infinity;
randomseed := 134.7384;
r = 0.75; theta = 17; 
vardef make_tree(expr bar) = 
  save a; numeric a; a = abs(point 1 of bar - point 0 of bar);
  cutdraw bar withpen pencircle scaled (a/8);
  if a > 5:
    save s; pair s; s = 1/32 a * r * unitvector(direction 1 of bar) rotated 90;
    make_tree(
      bar shifted - point 0 of bar shifted s
      scaled (r + 1/16 normaldeviate) rotated (theta + 8 normaldeviate) 
      shifted point 1 of bar 
    );
    make_tree(
      bar shifted - point 0 of bar shifted -s
      scaled (r + 1/16 normaldeviate) rotated -(theta + 8 normaldeviate) 
      shifted point 1 of bar 
    );
  fi
enddef;
beginfig(1);
  for i=1 upto 4:
    picture T; T = image(make_tree(origin -- 40 up)); draw T shifted (170i, 0);
  endfor
  input show_name;
endfig;
\end{mplibcode}
\end{document}

