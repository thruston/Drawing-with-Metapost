\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

path b, w;
b = ((-3,-4)--(3,-2)--(3,+2)--(-3,4)--cycle) scaled 5;
w = b reflectedabout(up, down);

numeric n;
n = 128;

picture B, W;
B = image(for i=0 step 1/n until 1:
              draw point 4-i of b -- point 1+i**2 of b
                  withcolor 1-i**8;
          endfor);

    W = image(for i=0 step 1/n until 1:
              draw point 4-i of w -- point 1+i**2 of w
                  withcolor 3/4-i**8;
          endfor);

for i=-9 upto 9:
    for j=-4 upto 4:
        draw if odd (i+j): W else: B fi shifted (i*30,j*30);
    endfor
endfor

clip currentpicture to bbox currentpicture yscaled 7/8;


endfig;
\end{mplibcode}
\end{document}
