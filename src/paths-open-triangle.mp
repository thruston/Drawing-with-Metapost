\documentclass{standalone}
\usepackage{dwmpcode}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
beginfig(1);
ahangle := 30;
path xx, yy; xx = left scaled 8 -- right scaled 89; yy = down scaled 8 -- up scaled 55;
path u; u = origin {right} .. (55,0) .. (55,34) .. {-2, -1} origin; 
drawarrow xx withcolor .67 white;
drawarrow yy withcolor .67 white;
drawarrow u cutafter fullcircle scaled 4;
dotlabeldiam := 2;
dotlabel.urt("$\scriptstyle (55,34)$", point 2 of u);
dotlabel.lrt("$\scriptstyle (55,0)$", point 1 of u);
dotlabel.llft("$\scriptstyle (0,0)$", point 0 of u);
label.bot(TEX("\mpl{drawarrow u cutafter fullcircle scaled 4};") scaled 0.8,
point 1/2 of bbox currentpicture shifted 13 down);
endfig;
\end{mplibcode}
\end{document}
