\documentclass{standalone}
\usepackage{luamplib}
\def\s#1{\let\\\cr\vbox{\halign{\hfil\strut ##\hfil\cr#1\crcr}}}
\begin{document}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
z0 = origin; z1 = 100 down; z2 = 144 down;
picture L[];
L0 = thelabel(btex \vbox{\hsize 2in\parindent 0pt\raggedright
    An extended caption or label that will be set as a
    small paragraph with automatic hyphenation and
    line-wrapping.
} etex, z0);
L1 = thelabel(btex \s{Single line} etex, z1);
L2 = thelabel(btex \s{Longer text split\\onto a new line} etex, z2);
forsuffixes $=0,1,2: 
    draw L$; draw bbox L$ withcolor Blues 8 2;
    draw fullcircle scaled 2 shifted z$ withcolor Reds 8 7; 
endfor
endfig;
\end{mplibcode}
\end{document}

