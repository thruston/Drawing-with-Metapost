\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input color-hsv-macro
beginfig(1);
  defaultfont := "phvr8r";

  numeric s[], v[];
  s0 = 1/2; v0 = 7/8;
  s1 = 7/8; v1 = 7/8;
  s2 = 7/8; v2 = 1/2;
  
  path r;
  for y=0, 1, 2:
    for h=0 step 15 until 360:
      r := fullcircle scaled 24 shifted (h, -36y if y=2: +8 fi);
      fill r withcolor hsv_color(h, s[y], v[y]);
      draw r withcolor white;
      if y=1: 
        label(decimal h infont defaultfont scaled 0.7, (h,-18)); 
      fi
    endfor
  endfor

  label.urt("Less saturation", (-20,14));
  label.lrt("Lower value", (-20,-78));

  drawarrow (-15, -21) -- (-15,12);
  drawarrow (-15, -43) -- (-15,-76);
endfig;
\end{mplibcode}
\end{document}

