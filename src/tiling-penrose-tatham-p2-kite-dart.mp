\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

input colorbrewer-rgb

numeric phi; phi = 0.61803398875;

path wide[], tall[];  
wide0 = origin -- right -- phi * dir 36 -- cycle; 
wide1 = origin -- right -- phi * dir -36 -- cycle; 
tall0 = origin -- right -- (1+phi) * dir 72 -- cycle;
tall1 = origin -- right -- (1+phi) * dir -72 -- cycle;

vardef half_dart(expr level, a, b, side) = 
  save T; path T; T = wide[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withcolor Purples[9][3+side];
    draw subpath (0, 2) of T;
  else:
    half_dart(level - 1, point 1 of T, point   2 of T, side);
    half_kite(level - 1, point 2 of T, point phi of T, 1-side);
  fi
enddef;

vardef half_kite(expr level, a, b, side) = 
  save T; path T; T = tall[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withcolor Blues[9][2+side];
    draw subpath (0, 2) of T;
  else:
    half_dart(level - 1, point 2     of T, point 2+phi of T, side);
    half_kite(level - 1, point 2+phi of T, point 0     of T, side);
    half_kite(level - 1, point 2+phi of T, point 1+phi of T, 1-side);
  fi
enddef;

beginfig(1);
  numeric wd; wd = 5in;
  drawoptions(withpen pencircle scaled 1/8);
    half_dart(9, 1.375 wd * left, 1.375 wd * right, 0);
  drawoptions();
  clip currentpicture to unitsquare shifted 1/2 left scaled wd yscaled phi;
endfig;
\end{mplibcode}
\end{document}

