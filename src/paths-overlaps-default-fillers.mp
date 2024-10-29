\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(3);
  path A, B; picture p[];
  A = fullcircle scaled 2.5cm; 
  B = fullcircle scaled 1.8cm shifted (1cm,0);
  p1 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p2 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B,180);
  p3 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p4 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B, 180);
  A := reverse A;
  p5 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p6 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B,180);
  p7 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p8 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);

  for i=1 upto 4: draw p[i]   scaled .75 shifted (80i,  0); label(decimal i,     (5mm+80i,0)); endfor
  for i=1 upto 4: draw p[i+4] scaled .75 shifted (80i,-68); label(decimal (4+i), (5mm+80i,-68)); endfor

  picture L;
  L = image(
    for i=0 upto 3: fill unitsquare scaled 2 shifted (1/2,1/2) rotated (45+90i); endfor
    label.rt("\small To rotate a circular path, you can use: \mpl{p rotatedaround(center p, 180)}",
      3 right);
  );
  label(L, point 1/2 of bbox currentpicture shifted 21 down);

endfig;
\end{mplibcode}
\end{document}

