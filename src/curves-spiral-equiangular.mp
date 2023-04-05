\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);  
    numeric a; a = 2.6; path S; 
    S = right for t=1 upto 360: .. a ** (t/64) * dir 4t endfor;
    drawarrow S;
% input ruler-cm
endfig;
\end{mplibcode}
\end{document}

