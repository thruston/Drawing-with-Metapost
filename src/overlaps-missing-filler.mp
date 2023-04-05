\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(2);
  path A, B; 
  A = fullcircle scaled 2.5cm; 
  B = fullcircle scaled 1.8cm shifted (1cm,0);
  fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;
  label.rt(btex Where has the fill colour gone? etex, point 0 of B shifted (1cm,0));
  label.ulft(btex $A$ etex, point 3 of A);
  label.urt(btex $B$ etex, point 1 of B);
endfig;
\end{mplibcode}
\end{document}
