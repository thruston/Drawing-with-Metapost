\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
picture P[];
P1 = image(
for i = -10 upto 10:
    draw (left--right) scaled 200 shifted (0, 20i);
    draw (down--up) scaled 200 shifted (20i, 0);
endfor
clip currentpicture to fullcircle scaled 180;
draw fullcircle scaled 180;
);

P2 = image(
path unit; pair u, v; color a, b; 
unit = unitsquare scaled 24;
u = point 1 of unit - point 0 of unit;
v = point 3 of unit - point 0 of unit;
a = 3/4[red, white]; b = 3/4[blue, white];
for i=-5 upto 5:
  for j=-5 upto 5:
    fill unit shifted (i*u + j*v) 
      withcolor if odd (i+j): a else: b fi;
  endfor
endfor
for i=-5 upto 5:
  for j=-5 upto 5:
    draw subpath (0,2) of unit shifted (i*u + j*v);
  endfor
endfor
clip currentpicture to fullcircle scaled 180;
draw fullcircle scaled 180;
);
draw P1; draw P2 shifted 200 down;

endfig;
\end{mplibcode}
\end{document}

