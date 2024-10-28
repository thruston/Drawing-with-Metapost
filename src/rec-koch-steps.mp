\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef koch(expr level, a, b) = 
  if level = 0:
    a -- b
  else:
    save p, q, r; pair p, q, r; 
    p = 1/3[a,b]; r = 2/3[a,b]; q = r rotatedabout(p, 60);
    koch(level-1, a, p) &
    koch(level-1, p, q) &
    koch(level-1, q, r) &
    koch(level-1, r, b) 
  fi
enddef;
beginfig(1);
  wd = 300;
  for n=0 upto 4:
    numeric y; y = -1/3 wd * n;
    path k; k = koch(n, origin, (wd, 0)) shifted (0, y);
    draw k withcolor 2/3 blue;
    label.urt("\small\textsf{Level " & decimal n & "}", point infinity of k);
    label.top("$\scriptstyle " & decimal length k & "/" & decimal arclength k & "$", (wd/2, y));
  endfor
  input show_name
endfig;
\end{mplibcode}
\end{document}

