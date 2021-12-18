\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef median primary P = 
    (origin for i=1 upto length P: + point i of P endfor) / length P
enddef;

primarydef p enlarged s = p shifted -median p scaled s shifted median p enddef;

vardef polygon(expr n, r) = 
    for i = 0 upto n - 1: (0, r) rotated (360 / n * i) -- endfor cycle
enddef;

path u, c, s;
u = polygon(5, 36);
c = polygon(6, 36) shifted 108 right;
s = polygon(7, 36) shifted 216 right;

beginfig(1);
draw origin--left scaled 50 withcolor background;
ahangle := 30; numeric r, x; r = 9/16; x = -1;
forsuffixes $=u, c, s:
  drawarrow subpath(r, r + length $) of $;
  draw fullcircle scaled 2 shifted median $ withcolor .67 red; 
  for i=0 upto length $-1: 
    fill fullcircle scaled 2 shifted point i of $ withcolor .67 red; 
    label(decimal i, point i of ($ enlarged 1.15)); 
  endfor
endfor
endfig;
\end{mplibcode}
\end{document}
