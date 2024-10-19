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
  for i=0 step 1/64 until 1:
    draw point 4-i of b -- point 1+i**2 of b withcolor 1-i**8;
  endfor
);

W = image(
  for i=0 step 1/64 until 1:
    draw point 4-i of w -- point 1+i**2 of w withcolor 3/4-i**8;
  endfor
);

for i=-7 upto 7:
  for j=-4 upto 4:
    draw if odd (i+j): W else: B fi shifted ((i,j) scaled 30);
  endfor
endfor

clip currentpicture to 
  unitsquare shifted -(.5,.5) scaled 5in yscaled 0.618;

endfig;
\end{mplibcode}
\end{document}
