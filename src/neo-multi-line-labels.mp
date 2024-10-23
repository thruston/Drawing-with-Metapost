\documentclass[border=0mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
label("\vbox{\hsize 4in It is a truth universally acknowledged,"
     & " that a single man in possession of a good fortune,"
     & " must be in want of a wife.\par}", origin);
label(btex \vbox{\hsize 4in\noindent
     \textsc{It is a truth} universally acknowledged,
     that a single man in possession of a good fortune, 
     must be in want of a wife.\par} etex, 128 down);
label(btex \begin{tabular}{c}
     A way to get simple\\
     two line labels
     \end{tabular} etex, 270 down);
endfig;
\end{mplibcode}
\end{document}

