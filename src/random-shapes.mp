\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  numeric desired_length, n, s;
  desired_length = 180; n = 30; s = 80;
  for r=0 upto 8:
    path shape;
    shape = for i=1 upto n: 
      (s + r * normaldeviate, 0) rotated (360/n*i) ..
    endfor cycle;  

    shape := shape scaled (desired_length/arclength shape);

    draw shape shifted (r*s, 0) withcolor (r/8)[black,red];
    label(decimal r, (r*s, 0));

  endfor
endfig;
\end{mplibcode}
\end{document}
