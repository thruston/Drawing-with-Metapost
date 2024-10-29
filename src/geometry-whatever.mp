\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\hbox to 5in{$\vcenter{%
\begin{mplibcode}
beginfig(1);
  z1 = (10, 50); 
  z2 = (80, 190);
  z3 = (0, 170);
  z4 = (60, 10);

  z0 = whatever [z1, z2] = whatever [z3, z4];

  draw z1--z2; draw z3--z4;

  forsuffixes @=0,1,2,3,4: 
    dotlabel.rt(TEX("$z_" & decimal @ & "$"), z@) 
      withcolor 2/3 if @=0: red else: blue fi; 
  endfor
endfig;
\end{mplibcode}
}\quad\vcenter{
\smallmpexternal[firstline=7,lastline=21]{geometry-whatever.mp}
}$\hss}
\end{document}
