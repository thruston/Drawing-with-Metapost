\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef make_tree(expr bar) = 
  save a; numeric a; a = abs(point 1 of bar - point 0 of bar);
  cutdraw bar withpen pencircle scaled 1.2(1/8 a) withcolor background;
  cutdraw bar withpen pencircle scaled (1/8 a) withcolor 1/256(57, 35, 32);
  if a > leaf:
    save s; pair s; s = 1/32 a * r * unitvector(direction 1 of bar) rotated 90;
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
    draw point 1 of bar withpen pencircle scaled 1 withcolor 2/3 green;
  fi
enddef;
beginfig(1);
numeric stem, leaf, r, theta;
r = 0.75; theta = 14;   
stem = 100; leaf = 3; % max(1, round(stem * (r ** 12)));
make_tree(origin -- stem * up);
endfig;
\end{mplibcode}
\end{document}

