\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
pair a, b, c, d, e, f, g; 
a = origin; b = 100 right; c = 50 up;
d = 2/5[b, c]; e = 4/5[b,c]; f = 1/2[e, a]; g = 1/2[a, b];

fill a--b--c--cycle withcolor 15/16[blue, white];
draw a--b--c--a--e--g--f; draw g--d;
label.lft("$1$", 1/2 c);
label.bot("$2$", 1/2 b);
label.urt("$\sqrt5$", 1/2[b,c]);
endfig;
\end{mplibcode}
\end{document}

