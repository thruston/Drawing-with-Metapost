\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\hbox to 5in{$\vcenter{%
\begin{mplibcode}
input geometry-whatever-code
\end{mplibcode}
}\quad\vcenter{
\smallmpexternal{geometry-whatever-code.mp}
}$\hss}
\end{document}
