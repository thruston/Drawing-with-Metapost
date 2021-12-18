\documentclass{standalone}
\usepackage{luamplib}
\def \id#1{\mathord{\hbox{\it #1\/}}}
\def \kw#1{{\hbox{\bf #1\thinspace}}}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path unitse; unitse = (superellipse(right,up,left,down,.8)) scaled 1/2;
path xx, yy; xx = (left -- right) scaled 144; yy = (down -- up) scaled 89;
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
label.bot(btex \vbox{\hsize 3.6in \centering \small
Note that, unaccountably, $\id{superellipse}()$ is defined
in \texttt{plain.mp} with a \kw{def} rather than a \kw{vardef}. 
This means you need to enclose it in a group before you can
transform it in any way. Using parentheses is probably simplest.
\par} etex, point 1/2 of bbox currentpicture shifted 12 down);
endfig;
\end{mplibcode}
\end{document}

