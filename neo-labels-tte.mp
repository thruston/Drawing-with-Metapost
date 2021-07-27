\documentclass[border=0mm]{standalone}
\usepackage{fontspec}
\setmainfont{TeX Gyre Pagella}
\usepackage{luamplib}
\mplibtextextlabel{enable} % <-- added option
\begin{document}
\begin{mplibcode}
  beginfig(1);
    for x = 0 upto 1:
        draw (80x,16) -- (80x, -68) withcolor 3/4[red, white];
    endfor
    for y = 0 upto 3:
        draw (0, -20y) -- (160, -20y) withcolor 3/4[red, white];
    endfor

    string s; s = "Hand gloves";
    draw s infont defaultfont  shifted (0, 0);
    draw s infont "phvr8r"     shifted (0, -20);
    draw TEX(s)                shifted (0, -40);
    draw btex Hand gloves etex shifted (0, -60);

    dotlabel.urt(s,                     (80, 0));
    dotlabel.urt(s infont "phvr8r",     (80, -20));
    dotlabel.urt(TEX(s),                (80, -40));
    dotlabel.urt(btex Hand gloves etex, (80, -60));
  endfig;
\end{mplibcode}
\end{document}
