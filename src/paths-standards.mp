\documentclass{standalone}
\usepackage{luamplib}
\def \id#1{\mathord{\hbox{\it #1\/}}}
\def \kw#1{{\hbox{\bf #1\thinspace}}}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path unitse; unitse = superellipse(1/2 right, 1/2 up, 1/2 left, 1/2 down, 13/16);  
path xx, yy; xx = 72 left -- 144 right; yy = 42 down -- 89 up;
path u, c, s;
u = unitsquare scaled 72;
c = fullcircle scaled 72;
s = unitse scaled 72;

beginfig(1);
drawarrow xx withcolor .67 white;
drawarrow yy withcolor .67 white;
draw u; label.top("$\id{unitsquare}$", point 5/2 of u);
drawoptions(withcolor .67 red);
draw c; label("$\id{fullcircle}$", 3/4[point 2 of c, point 6 of c]);
drawoptions(withcolor .67 blue);
draw s; label.lrt("$\id{superellipse}()$", point 7 of s);
drawoptions();
dotlabel.bot("$\scriptstyle (1,0)$", point 1 of u);
endfig;
\end{mplibcode}
\end{document}

