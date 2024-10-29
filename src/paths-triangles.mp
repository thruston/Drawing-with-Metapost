\documentclass{standalone}
\usepackage{dwmpcode}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\def \kw#1{\mathop{\hbox{\bf #1\thinspace}}}
\def \id#1{\mathord{\hbox{\it #1\/}}}
\begin{document}
\begin{mplibcode}
beginfig(1);
path xx, yy; xx = left scaled 8 -- right scaled 89; yy = down scaled 8 -- up scaled 55;
path t; t = origin -- (55,0) -- (55,34) -- cycle; 
picture p[];
p1 = image(
ahangle := 30;
drawarrow xx withcolor .67 white;
drawarrow yy withcolor .67 white;
fill t withcolor .8[blue,white]);

p2 = image(
draw p1;
draw t;
dotlabel.rt(btex $(55,34)$ etex scaled 0.8, point 2 of t);
) shifted 144 right;
draw p1; draw p2;
label.bot(btex \mpl{fill t withcolor 0.8[blue,white];} etex scaled 0.8, point 1/2 of bbox p1);
label.bot(btex \mpl{draw t;} etex scaled 0.8, point 1/2 of bbox p2);
endfig;
\end{mplibcode}
\end{document}
