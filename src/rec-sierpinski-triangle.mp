\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef gasket(expr t, s, limit) = 
  if length (point 1 of t - point 0 of t) < limit:
    fill t;
  else:
    save little_t; path little_t; little_t = t scaled s;
    for i=1 upto length t:
      gasket(little_t shifted (point i of t - point i of little_t), s, limit);
    endfor
  fi
enddef;
beginfig(1);  
  path T; T = for i = 1 upto 3: 220 up rotated (120i) -- endfor cycle;
  gasket(T, 1/2, 20);
endfig;
\end{mplibcode}
\end{document}
