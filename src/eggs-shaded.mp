\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path egg, spot; 
egg = (for t=-180 step 15 until 180 - eps:
  (0.78 cosd(1/4 t) * sind(t), -cosd(t)) ..
endfor cycle) scaled 100;
spot = fullcircle scaled 4 shifted 3/4 point 3 of egg;
vardef fade_filled(expr egg, spot, dark, light, n) = image(
  for i = 0 upto n:
    fill interpath(i/n, egg, spot) withcolor ((i/n)**1/3)[dark,light];
  endfor) 
enddef;
beginfig(1);
  color a; a = 1/256(150, 100, 60); 
  color b; b = 1/256(256, 220, 180);
  draw fade_filled(egg, spot, a, b, 256) rotated -30;
endfig;
\end{mplibcode}
\end{document}

