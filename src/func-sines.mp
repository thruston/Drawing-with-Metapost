\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef pi_quarters(expr n) = 
  save s, f, q; string s, f; numeric q; 
  s = if n < 0: "-" else: "" fi; q = abs(n);
  if q mod 4 = 0: f = if q > 4: decimal 1/4 q else: "" fi;
  elseif q mod 2 = 0: f = "\frac{" & decimal 1/2 q & "}{2}";
  else: f = "\frac{" & decimal q & "}{4}";
  fi TEX("$\scriptstyle" & s & f & "\pi$")
enddef;

beginfig(1);
  numeric u, pi; u = 50; pi = 3.141592653589793;

  path xx, yy;
  xx = (3.5 left -- 3.6 right) scaled u;
  yy = (1.1 down -- 1.2 up) scaled u;

  path ss;
  ss = origin for t=1 upto 360: -- (t, sind(t)) endfor;
  ss := ss shifted 360 left & ss;
  ss := ss xscaled (pi/180) scaled u;

  drawoptions(dashed withdots scaled 1/4);
  draw ((1/4 pi, 0) .. (1/4 pi, sind(45))) scaled u;
  draw ((1/2 pi, 0) .. (1/2 pi, sind(90))) scaled u;
  draw ((3/4 pi, 0) .. (3/4 pi, sind(135))) scaled u;
  drawoptions();

  draw ss 
    cutbefore yy shifted point 0 of xx
    cutafter  yy shifted point 1 of xx
    withcolor 3/4 blue;
  
  draw ss shifted (-1/2 pi * u ,0)  
    cutbefore yy shifted point 0 of xx
    cutafter  yy shifted point 1 of xx
    withcolor 2/3 red;

  drawarrow xx; label.rt(TEX("$t$"), point 1 of xx);
  drawarrow yy; label.top(TEX("$u(t)$"), point 1 of yy);

  for i=-4, -3, -2, -1, 1, 2, 3, 4:
    draw (down--up) scaled 2 shifted (pi * i/4 * u, 0);
    label.bot(pi_quarters(i), (pi * i/4 * u, -2));
  endfor
endfig;
\end{mplibcode}
\end{document}
