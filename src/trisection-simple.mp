\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    path ray;
    numeric theta;
    ray = origin -- 200 right;
    theta = 42;
    draw ray;
    draw ray rotated 1/3 theta withcolor 2/3 red;
    draw ray rotated 2/3 theta withcolor 2/3 red;
    draw ray rotated theta;
    dotlabel.llft("$0$", origin);
    label("$\theta/3$", 72 right rotated 1/6 theta) withcolor 2/3 blue;
    label("$\theta/3$", 72 right rotated 3/6 theta) withcolor 2/3 blue;
    label("$\theta/3$", 72 right rotated 5/6 theta) withcolor 2/3 blue;
endfig;
\end{mplibcode}
\end{document}

