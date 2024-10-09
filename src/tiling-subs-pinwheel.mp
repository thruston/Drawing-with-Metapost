\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
vardef pinwheel(expr level, a, b, c, s) = 
  if level = 0:
    fill a--b--c--cycle withcolor s;
    undraw a--b--c--cycle withpen pencircle scaled 1/16;
  else:
    save d, e, f, g; pair d, e, f, g; 
    d = 2/5[b, c]; e = 4/5[b,c]; f = 1/2[e, a]; g = 1/2[a, b];
    pinwheel(level - 1, f, g, e, Blues 9 2);
    pinwheel(level - 1, f, g, a, Blues 9 3);
    pinwheel(level - 1, e, a, c, Blues 9 4);
    pinwheel(level - 1, d, e, g, Blues 9 5);
    pinwheel(level - 1, d, b, g, Blues 9 6);
  fi
enddef;
beginfig(1);
  pair a, b, c; a = origin; b = 460 right; c = 1/2 b rotated 90;
  pinwheel(5, a, b, c, ""); 
  draw currentpicture rotatedabout(1/2[b,c], 180);
  currentpicture := currentpicture rotated 90;
endfig;
\end{mplibcode}
\end{document}
