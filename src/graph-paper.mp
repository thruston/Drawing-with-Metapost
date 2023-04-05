\documentclass[border=1mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef grid(expr ll, ur, grid_unit) = 
  save llx, lly, urx, ury, G; numeric llx, lly, urx, ury;
  (llx, lly) = ll; (urx, ury) = ur;
  picture G; G = image(
  for x = floor(llx / grid_unit) + 1 upto floor(urx / grid_unit):
    draw (x * grid_unit, lly) -- (x * grid_unit, ury);
  endfor
  for y = floor(lly / grid_unit) + 1 upto floor(ury / grid_unit):
    draw (llx, y * grid_unit) -- (urx, y * grid_unit);
  endfor
  fill fullcircle; % <-- you might not want this
  ); G enddef;

input colorbrewer-rgb
beginfig(1);
    path C;
    C = fullcircle scaled 120 shifted 12 up rotated 6;
    for t=0, 1.23, 4: draw center C -- point t of C withcolor Blues 8 8; endfor
    draw C withcolor Reds 8 8;
    dotlabel.urt("Start", point 0 of C);

    picture P; P = currentpicture; currentpicture := nullpicture;
    draw grid(llcorner P, urcorner P, 1mm) withpen pencircle scaled 1/4 withcolor Blues 8 1;
    draw grid(llcorner P, urcorner P, 1cm) withpen pencircle scaled 1/4 withcolor Blues 8 2;
    draw P;
endfig;
\end{mplibcode}
\end{document}

