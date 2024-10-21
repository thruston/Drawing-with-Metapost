\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def perpendicular expr t of p = 
  direction t of p rotated 90 shifted point t of p
enddef;

vardef block(expr wd, dp, theta, r) = 
  save base, ray, b;
  path base, ray[]; numeric b;

  base = origin for i=1 upto 31: 
    -- (i/32 * wd, r * normaldeviate) 
  endfor -- (wd,0) -- (wd,-dp) -- (0,-dp) -- cycle;

  image(
    fill base withcolor .8[blue,white];
    draw base withcolor .67 blue;

    for i = 2 upto 6:
      ray[i] = (left--right) scaled 2/3 wd rotated -theta 
                             shifted (i/8 * wd,0);
      b := ypart (ray[i] intersectiontimes base);
      ray[i] := point 0 of ray[i] -- point b of base -- point 0 of ray[i] 
                 reflectedabout(point b of base, perpendicular b of base);
      drawarrow ray[i];
    endfor   

    label("$r=" & decimal r & "$", center base);
  ) 
enddef;
beginfig(0);
  draw block(108, 16, 45, 0); 
  draw block(108, 16, 45, 0.42) shifted 180 right;
endfig;
\end{mplibcode}
\end{document}
