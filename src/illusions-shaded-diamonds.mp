\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
path diamond; picture shaded;
diamond = (left -- 3 down -- right -- 3 up -- cycle) scaled 13;
shaded = image(for i=0 upto 256:
  draw (left--right) scaled 15 shifted (0, 78/256 i - 39)
   withpen pencircle scaled 0.32
   withcolor (i/256)[white, Greens 8 8];
endfor);  clip shaded to diamond;

pair u, v;
u = point 2 of diamond - point 0 of diamond;
v = point 3 of diamond - point 0 of diamond;

beginfig(1);
  for i=0 upto 8:
    for j=0 upto min(8-i, 4):
      draw shaded shifted (i * u + j * v);
    endfor
  endfor
  clip currentpicture to -1/2u -- 9u -- 5u + 4v -- 4v - 1/2u -- cycle; 
  draw currentpicture rotated 180;
endfig;
\end{mplibcode}
\end{document}

