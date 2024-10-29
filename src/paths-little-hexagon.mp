\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
    draw for i=0 upto 5: 20 dir 60i -- endfor cycle;
endfig;
\end{mplibcode}
\end{document}
