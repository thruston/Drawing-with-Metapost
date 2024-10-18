\documentclass[border=1mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef tubular@#(expr p) = image(
  draw p withpen pencircle scaled 8;
  for w = 7.5 step -.5 until 1: 
    draw p withpen pencircle scaled w withcolor (sqrt(w/8))[white, 1/2 @#]; 
  endfor
) enddef;
vardef ctubular@#(expr p) = image(
  cutdraw p withpen pencircle scaled 8;
  for w = 7.5 step -.5 until 1: 
    cutdraw p withpen pencircle scaled w withcolor (sqrt(w/8))[white, 1/2 @#]; 
  endfor
) enddef;
beginfig(1);
path half_reef;
d = 1/4;
half_reef = (-7, -d) --- (-2, -d) ... (0, -1) .. (2, 0) .. (0, 1) ... (-2, d) --- (-5, d);
half_reef := half_reef scaled 20;
draw tubular.red(half_reef);
draw tubular.blue(half_reef reflectedabout (up, down));
draw ctubular.red(subpath(3/2, 5/2) of half_reef);
draw ctubular.red(subpath(7/2, 9/2) of half_reef);
% for i=0 step 1/2 until length half_reef: dotlabel.top(decimal i, point i of half_reef); endfor

endfig;
\end{mplibcode}
\end{document}

