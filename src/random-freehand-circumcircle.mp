\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
def freehand_segment(expr p) =
  point 0 of p {direction 0 of p rotated (4+normaldeviate)} .. 
  point 1 of p {direction 1 of p rotated (4+normaldeviate)}
enddef;
def freehand_path(expr p) = 
  freehand_segment(subpath(0,1) of p)
  for i=1 upto length(p)-1:
    & freehand_segment(subpath(i,i+1) of p)
  endfor
  if cycle p: & cycle fi
enddef;
defaultfont := "eurm10";
color sepia; sepia = (0.44, 0.26, 0.08);
picture marker; marker = image(for s=-1/2, 1/2: 
  draw (left--right) scaled 2 rotated 60 shifted (s,0);
endfor);
def moved_along expr x of p = rotated angle direction x of p
                              shifted point x of p enddef;

beginfig(1);
pair A, B, C, D;
A = (0,-30); B = (180,0);  C = (120,90); D = (1/2 + 1/40 normaldeviate)[A, B]; 
path triangle, circumcircle, bisector;
triangle = freehand_path(A--D--B--C--cycle);
bisector = freehand_segment(C--D);
circumcircle = freehand_path(A..B..C..cycle);
draw triangle; 
draw bisector; 
draw circumcircle withcolor .67 red;
draw marker moved_along 1/2 of triangle withcolor .67 red;
draw marker moved_along 3/2 of triangle withcolor .67 red;
label.lft("A", A);
label.rt ("B", B);
label.top("C", C);
label.bot("D", D);
endfig;
\end{mplibcode}
\end{document}

