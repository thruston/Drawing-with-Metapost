\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef make_tree(expr level, bar) = 
  draw bar;
  if level > 0:
    for t=-theta, theta:
      make_tree(level - 1, bar shifted - point 0 of bar 
        scaled r rotated t shifted point 1 of bar
      );
    endfor
  fi
enddef;
beginfig(1);
picture T[];
numeric r, theta;
r = 0.58; theta = 60; T1 = image(
    make_tree(3, origin -- 100 up); 
    label.urt("\ $r=" & decimal r & "$, $\theta=" & decimal theta & "$", origin) withcolor \mpcolor{textred};
);
r := 0.75; theta := 14; T2 = image(
    make_tree(10, origin -- 100 up);
    label.urt("\ $r=" & decimal r & "$, $\theta=" & decimal theta & "$", origin) withcolor \mpcolor{textred};
);
draw T1 shifted 32 up; 
draw T2 shifted 128 right;
endfig;
\end{mplibcode}
\end{document}

