\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path C; C = fullcircle scaled 125 shifted 20 up rotated 16;
for t=0, 1, 4: draw center C -- point t of C withcolor 2/3 blue; endfor
draw C withcolor 3/4 red; dotlabel.urt("Start", point 0 of C);
input pics-graph-paper-inch

label.ulft(btex \vbox{\hsize 134pt\raggedright 
Here is an example that adds graph paper behind a drawing.

The first three lines make the example drawing, the
final \mpl{input} adds the graph paper.
\par} etex, llcorner currentpicture shifted 10 left);

endfig;
\end{mplibcode}
\end{document}

