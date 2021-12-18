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
    for i = 0 upto n - 1: (r, 0) rotated (360 / n * i) -- endfor cycle
enddef;

path u, c, s;
u = polygon(5, 36);
c = polygon(6, 36) shifted 108 right;
s = polygon(7, 36) shifted 216 right;

picture p[];
p1 = image(
draw origin--left scaled 50 withcolor background;
ahangle := 30; numeric r, x; r = 9/16; x = -1;
forsuffixes $=u, c, s:
  drawarrow subpath(r, r + length $) of $;
  draw fullcircle scaled 2 shifted median $ withcolor .67 red; 
  for i=0 upto length $-1: 
    fill fullcircle scaled 2 shifted point i of $ withcolor .67 red; 
    label(decimal i, point i of ($ enlarged 1.15)); 
  endfor
endfor);

p2 = image(
draw origin--left scaled 50 withcolor background;
forsuffixes $=u,c,s:
  fill median $ -- subpath (1,2) of $ -- cycle withcolor .8[blue,white];
  draw median $ -- point 1 of $;
  draw median $ -- point 2 of $;
  draw $;
endfor
);

p3 = image(
draw origin--left scaled 50 withcolor background;
forsuffixes $=u,c,s:
  r := 1/5 length $;
  fill median $ -- subpath (0,r) of $ -- cycle withcolor .8[red,white];
  draw median $ -- point 0 of $;
  draw median $ -- point r of $;
  draw $;
  endfor
);

p4 = image(
draw origin--left scaled 50 withcolor background;
forsuffixes $=u,c,s:
  fill median $ -- subpath (-1,1) of $ -- cycle withcolor .8[black,white];
  draw median $ -- point -1 of $;
  draw median $ -- point 1 of $;
  draw $;
  endfor
);

beginfig(1);
for i=1 upto 4: draw p[i] shifted (0,-108i); endfor
endfig;
\end{mplibcode}
\end{document}
