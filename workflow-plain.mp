\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\def\tll#1{$\vcenter{\let\\\cr\halign{\hss\textsf{##}\hss\cr#1\cr}}$}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
path paper; paper = origin {dir -16} .. (55, 0) {dir -13} -- (55,34) -- (0, 34) -- cycle;
path source, EPS, pdf;
source = paper;
EPS = paper shifted 105 right;
pdf = paper shifted 210 right;
beginfig(1);
    fill source withcolor (1,1,7/8);
    draw source;
    label("\tll{MP source}", center source);
    label.bot("\tll{Edit with\\MacVim}", point 1/2 of source shifted 8 down);

    fill EPS withcolor (15/16, 15/16, 1);
    draw EPS dashed withdots scaled 1/2; label("\textsf{EPS}", center EPS);

    fill pdf withcolor (7/8, 7/8, 1);
    draw pdf; label("\textsf{PDF}", center pdf);
    picture p, u;
    p = thelabel.bot("\tll{Preview with\\Skim.app}", point 1/2 of pdf shifted 8 down);
    u = thelabel.top("\tll{Use in \LaTeX with\\\texttt{\textbackslash includegraphics}}", point 5/2 of pdf shifted 34 up);
    draw p; draw u;

    interim ahangle := 30;
    drawarrow (origin -- 34 up) shifted point 5/2 of pdf dashed evenly scaled 1/2;
    drawarrow point 3/2 of bbox source -- point 7/2 of bbox EPS;
    label.top("\texttt{mpost}", 1/2[center source, center EPS]);
    drawarrow point 3/2 of bbox EPS -- point 7/2 of bbox pdf;
    label.top("\texttt{epstopdf}", 1/2[center EPS, center pdf]);

    drawarrow center EPS -- center u
        cutbefore bbox EPS cutafter bbox u
        dashed withdots scaled 1/2;

    draw center EPS -- center p 
        cutbefore bbox EPS cutafter bbox p
        dashed withdots scaled 1/2;

endfig;
\end{mplibcode}
\end{document}

