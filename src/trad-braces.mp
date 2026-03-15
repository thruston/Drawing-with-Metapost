\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input braces
beginfig(1);
z1 = origin;
z2 = 180 right rotated 13;
draw z1--z2 withcolor .7 white;
dotlabel.llft("$z_1$",z1);
dotlabel.urt("$z_2$",z2);
drawoptions(withcolor 2/3 red);
label.lrt("Here", do_brace(z1, z2, -12, 3/4)); 
drawoptions();
begingroup; interim ahangle := 180; interim ahlength := 3;
drawdblarrow (z1--z2) shifted (12 up rotated angle (z2-z1)) withcolor 2/3 blue;
endgroup;


endfig;
\end{mplibcode}
\end{document}
