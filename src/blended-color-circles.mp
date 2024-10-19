\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{fontspec}
\setmainfont{Helvetica}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path C[], B[];

% arrange each circle so that point 0 is outside the others
C1 = fullcircle scaled 100 rotated 90 shifted 40 up;
C2 = C1 rotated 120;
C3 = C2 rotated 120;

% the illusion of blended colours is helped by buildcycle
B0 = buildcycle(C1, C2, C3);
B1 = buildcycle(C1, C2);
B2 = buildcycle(C2, C3);
B3 = buildcycle(C3, C1);

picture P;
for x=0 upto 1:
  for y=0 upto 1:
    P := image(
      s := 1/2 + x/4;
      k := 0 + y/4;
      fill C1 withcolor s*(1,0,0,k);
      fill C2 withcolor s*(0,1,0,k);
      fill C3 withcolor s*(0,0,1,k);
      fill B3 withcolor s*(1,0,1,k);
      fill B2 withcolor s*(0,1,1,k);
      fill B1 withcolor s*(1,1,0,k);
      fill B0 withcolor s*(1,1,1,k);
      undraw C1; undraw C2; undraw C3;
    ) shifted (200x, 180y);
    draw P;
    label.bot(("shade: " & decimal s & ", k: " & decimal k)
                infont "phvr8r", point 1/2 of bbox P);
  endfor
endfor
endfig;
\end{mplibcode}
\end{document}
