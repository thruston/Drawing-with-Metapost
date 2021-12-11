\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{graphicx}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
    input anchor
beginfig(1);
    label("\includegraphics{wheatleycrest.jpg}", origin);
    draw anchor;
endfig;
\end{mplibcode}
\end{document}

