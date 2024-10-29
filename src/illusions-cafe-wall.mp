\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  numeric u; u = 21;
  picture strip;
  strip = image(
    for i=-10 upto 10:
      fill unitsquare shifted (2i,0) scaled u;
      draw unitsquare shifted (2i,0) scaled u withcolor 1/2;
    endfor
    for i=0, 1:
      draw ((-20, i) -- (20, i)) scaled u withcolor 1/2;
    endfor
  );
  for i=0 upto 9:
    draw strip shifted (4 normaldeviate, i*u);
  endfor
  clip currentpicture to unitsquare shifted 1/2 left xscaled 29.2 yscaled 10 scaled u;
endfig;
\end{mplibcode}
\end{document}
