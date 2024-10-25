\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  numeric u, minx, s, maxx;
  u = 42; minx = -3; s = 1/4; maxx = 1/256 mlog(4.5); 
  path xx; xx = (-3u, 0) -- (5u, 0);
  path yy; yy = xx rotated 90;
  path ee, ll, nn;
  ee = (for x = minx step s until maxx - s: 
    (x, mexp(256x)){1, mexp(256x)} ... 
  endfor (maxx, mexp(256 maxx)){1, mexp(256 maxx)}) scaled u;
  ll = ee reflectedabout(origin, dir 45);    
  nn = (for x=1 step s until 4-s: (x, 1/x) ... endfor (4, 1/4)) scaled u;
  nn := reverse nn reflectedabout(origin, dir 45) & nn;
  drawoptions(withcolor 7/8);
    draw unitsquare xscaled mexp(256) scaled u;
    draw unitsquare yscaled mexp(256) scaled u;
  drawoptions(withcolor 3/4);
    forsuffixes $ = ee, ll:
      path T$; T$ = (left--right) scaled 2u rotated 45 
                         shifted directionpoint dir 45 of $;
      draw T$;
    endfor
    draw interpath(1/2, T.ee, T.ll) dashed evenly;
  drawoptions(withcolor 2/3 blue);
    draw ee; label.top("$e^x$", point infinity of ee);
  drawoptions(withcolor 2/3 red);
    draw ll; label.top("$\ln(x)$", point infinity of ll);
  drawoptions();
  draw nn; label.urt("$1/x$", point 0 of nn);
  drawarrow xx; label.rt("$x$", point 1 of xx);
  drawarrow yy; label.top("$y$", point 1 of yy);
  dotlabel.lft("$e$", (0, mexp(256) * u));
  dotlabel.bot("$e$", (mexp(256) * u, 0));
  dotlabel.ulft("$1$", (0, u));
  dotlabel.lrt("$1$", (u, 0));
endfig;
\end{mplibcode}
\end{document}
