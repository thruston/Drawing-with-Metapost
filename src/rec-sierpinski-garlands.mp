\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb

vardef garland(expr level, shape) =
  if level = 0:
    fill shape withcolor filler; draw shape withpen pencircle scaled 1/8;
  else:
    save little_shape; path little_shape; 
    little_shape = shape scaled factor;
    for i=1 upto length shape:
      garland(level - 1, little_shape shifted (point i of shape - point i of little_shape));
    endfor
  fi
enddef;
vardef sf(expr n) = 
  numeric s; s = 0;
  for k=1 upto floor (n/4):
    s := s + cosd(360 / n * k);
  endfor
  1 / (2 * (1 + s))
enddef;
beginfig(1);  
  color filler; numeric factor; path poly;
  for n=5 upto 9:
    filler := Reds[7][n-3]; factor := sf(n);
    poly := for i=1 upto n: 64 up rotated (360/n*i) -- endfor cycle;
    draw image(garland(3, poly)) shifted (144n, 0);
  endfor
  input show_name
endfig;
\end{mplibcode}
\end{document}
