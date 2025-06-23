\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  path b, w;
  b = ((-3,-4)--(3,-2)--(3,+2)--(-3,4)--cycle) scaled 5;
  w = b reflectedabout(up, down);

  picture B, W;
  B = image(
    for i=0 step 1/128 until 1:
      draw point 4-i of b -- point 1+i**2 of b withcolor 1-i**3;
    endfor draw b withpen pencircle scaled 1/4;
  );

  W = image(
    for i=0 step 1/128 until 1:
      draw point 4-i of w -- point 1+i**2 of w withcolor 3/4-i**3;
    endfor undraw w withpen pencircle scaled 1/4;
  );

  for i=-6 upto 6:
    for j=-3 upto 4:
      draw if odd (i+j): W else: B fi shifted ((i,j) scaled 30);
    endfor
  endfor
endfig;
\end{mplibcode}
\end{document}
