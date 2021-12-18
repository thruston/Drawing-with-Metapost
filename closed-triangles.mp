\documentclass{standalone}
\usepackage{luamplib}
\def \kw#1{\mathop{\hbox{\bf #1\thinspace}}}
\def \id#1{\mathord{\hbox{\it #1\/}}}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path xx, yy; xx = left scaled 8 -- right scaled 89; yy = down scaled 8 -- up scaled 55;
path t; t = origin -- (55,0) -- (55,34) -- cycle; 
picture p[];
p1 = image(
drawarrow xx withcolor .67 white;
drawarrow yy withcolor .67 white;
fill t withcolor .8[blue,white]);

p2 = image(
draw p1;
draw t;
dotlabel.rt(btex $(55,34)$ etex scaled 0.8, point 2 of t);
) shifted 144 right;
draw p1; draw p2;
label.lrt(btex $\kw{fill} t \kw{withcolor} 0.8[\id{blue},\id{white}];$etex scaled 0.8, point 0 of bbox p1);
label.lrt(btex $\dots\;\kw{draw} t; $etex scaled 0.8, point 0 of bbox p2);
endfig;
\end{mplibcode}
\end{document}
