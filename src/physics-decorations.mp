\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef springy(expr P, N) = 
  save n, a; 
  numeric n, a; n = N + 3; a * n = arclength P;
  subpath (0, arctime a of P) of P &
    point arctime a of P of P {up rotated angle direction arctime a of P of P}
    for i = 2 upto n - 5/2:
      ..
      point arctime i*a-a/2 of P of P 
      shifted 3 unitvector(direction arctime i*a-a/2 of P of P rotated 90)
      .. 
      {dir 250 rotated angle direction arctime i*a of P of P}
      point arctime i*a of P of P 
      shifted -3 unitvector(direction arctime i*a of P of P rotated 90)
      {dir 110 rotated angle direction arctime i*a of P of P}
    endfor .. subpath (arctime (n - 2) * a of P, length P) of P
enddef;




beginfig(1);

  drawarrow springy(origin -- 90 down, 10);

  drawarrow springy(origin -- 50 down, 10) shifted 20 right;

endfig;
\end{mplibcode}
\end{document}

