\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
def withalpha expr a =  % <-- this requires "luamplib"
  withprescript "tr_alternative=2"
  withprescript "tr_transparency=" & decimal a
enddef;
input colorbrewer-rgb
path d; d = for i=1 upto 12: 18 dir (15+30i) -- endfor cycle;

color shade[]; 
shade0 = Oranges 8 4; shade1 = Blues 8 4; 
shade2 = Greens 8 4; shade3 = Reds 8 4;

vardef unit(expr n) = image(
  fill d withalpha 0.9 withcolor shade[n mod 4];
  draw d; 
) enddef;
pair u, v;
u = point 0 of d - point 3 of d;
v = u rotated 60;
numeric n; n = 6;
for i=-n upto n:
  for j=-n upto n:
    draw unit(3i-7j) shifted ((i-floor(j/2)) * u + j * v);
  endfor
endfor
clip currentpicture to unitsquare shifted -(1/2, 1/2) scaled 42n;

picture p; p = image(
  draw d; draw point 0 of d withpen pencircle scaled 2;
  drawoptions(withcolor 3/4[red, white]);
  draw d shifted u; draw point 0 of d shifted u withpen pencircle scaled 2;
  drawoptions(withcolor 3/4[blue, white]);
  draw d shifted v; draw point 0 of d shifted v withpen pencircle scaled 2;
  drawoptions();
  drawarrow origin -- u withcolor red;
  drawarrow origin -- v withcolor blue;
);
label.bot(p, point 1/2 of bbox currentpicture shifted 13 down);
label.bot(btex \vbox{\hsize 3.4in\noindent
The vectors are chosen so that the dodecagons overlap to make 
the required triangles, squares, and hexagons.} etex,
point 1/2 of bbox currentpicture shifted 13 down);
endfig;
\end{mplibcode}
\end{document}

