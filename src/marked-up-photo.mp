\documentclass[border=1mm]{standalone}
\usepackage{luamplib}
\usepackage{graphicx}
\usepackage{fontspec}\setmainfont[Scale=0.6]{Helvetica}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
draw btex \includegraphics[width=5in]{glenshiel.jpg} etex;
if false:
for i=1 upto 36:
    draw (origin -- 180 up) shifted (10i, 0) withcolor if i mod 10 = 0: red else: 1/2 fi;
endfor
for i=1 upto 18:
    draw (origin -- 360 right) shifted (0, 10i) withcolor if i mod 10 = 0: red else: 1/2 fi;
endfor
fi
vardef callout@#(expr t, p, o) = 
    save T; picture T; T = thelabel.@#(t, p+o);
    draw T; drawarrow p+o -- p cutbefore bbox T;
enddef;
ahangle := 20; ahlength := 2; drawoptions(withpen pencircle scaled 1/4 withcolor 1/2 blue);
callout.top("Sgurr na Ciste Dubhe", (80, 96), (-10, 20));
callout.top("Sgurr nan Spainteach", (100, 91), (6, 12));
label.top("\tiny Cuillin Ridge, Isle of Skye", (140, 81));
label.top("Sgurr na Carnach", (190, 90));
label.top("Sgurr Fhuaran", (282, 94));
label.bot("\itshape View looking west from the summit of Saileag – 19 April 2005", point 5/2 of bbox currentpicture shifted 4 down);
endfig;
\end{mplibcode}
\end{document}

