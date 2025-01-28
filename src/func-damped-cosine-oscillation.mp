\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path ee, ff, xx, yy;
ee = up for t = 1 upto 180: .. (t, mexp(-4t)) endfor;
ff = up for t = 1 upto 180: .. (t, mexp(-4t) * cosd(8t)) endfor;

ee := ee xscaled 1.6 yscaled 72;
ff := ff xscaled 1.6 yscaled 72;

xx = origin -- (10 + xpart point length ff of ff, 0);
yy = 84 down -- 84 up;

drawarrow xx; label.rt("$t$", point 1 of xx);
drawarrow yy; label.top("$x$", point 1 of yy);

drawoptions(dashed evenly withpen pencircle scaled 1/4);
  draw ee; 
  draw ee reflectedabout (left, right);

drawoptions(withpen pencircle scaled 3/4 withcolor 2/3 red);
  draw ff;

drawoptions();

vardef pin(expr t, w, o) = 
  interim ahangle := 24;
  drawarrow w shifted o shifted 4 right -- w shifted o -- w 
    withpen pencircle scaled 1/4;
  label.rt("\strut" & t, w shifted o shifted 4 right);
enddef;

pin("$e^{-\gamma t/2}$", point 20 of ee, 16 dir 40);
pin("$e^{-\gamma t/2}\cos\omega_0t$", point 96 of ff, 24 dir 40);

% label.ulft("A damped cosine oscillation", lrcorner currentpicture);
endfig;
\end{mplibcode}
\end{document}
