\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
 z0 = origin;
 z1 = 333 dir -18;
 z2 = 104 dir 45;
 z3 = 233 dir 34;
 z4 = 166 dir 12;

 z5 = whatever[z0, z1];
 z6 = whatever[z0, z1];
 z7 = whatever[z0, z1];

 z5 - z4 = whatever * (z3 - z2);
 z6 - z4 = whatever * (z3 - z2) rotated 90;
 z7 - z4 = whatever * (z1 - z0) rotated 90;

 z9 = whatever [z2,z3] = whatever [z4,z6];

 numeric t, u, o; 
 t = abs(z4-z5);
 u = abs(z6-z7);
 o = 12;
 drawoptions(withpen pencircle scaled 1/4 withcolor 1/2 white);
 draw unitsquare scaled 5 rotated angle (z6 - z4) shifted z9;
 draw unitsquare scaled 5 rotated angle (z4 - z6) shifted z4;
 draw (1+o/t)[z5,z4] -- (1+o/t)[z4,z5];
 draw (1+o/t)[z9,z6] -- (1+o/t)[z6,z9];
 drawoptions();

 draw z0--z1;
 draw z2--z3;

 interim labeloffset := 6;
 forsuffixes $=0,1,2,3,4,5,6,7:
     dotlabel.top("$\;\;" & char ($ + ASCII "A") & "$", z$)
       if $=5: withcolor 2/3 red fi
       if $=6: withcolor 2/3 blue fi
       if $=7: withcolor 1/2 green fi
       ;
 endfor
endfig;
\end{mplibcode}
\end{document}

