\documentclass{standalone}
\usepackage{graphicx}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input picture_frame
beginfig(1);
  picture F; 
  F = thelabel(TEX("\includegraphics[width=200pt]{youth.jpg}"), origin);
  draw F; draw frame F; 
endfig;
\end{mplibcode}
\end{document}
