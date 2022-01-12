\documentclass[margin=1mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
pair a, b, c, d, e, f, g; 
a = origin; b = 180 right; c = 90 up;
d = 2/5[b, c]; e = 4/5[b,c]; f = 1/2[e, a]; g = 1/2[a, b];

fill a--b--c--cycle withcolor 15/16[blue, white];
draw a--b--c--a--e--g--f; draw g--d;
dotlabel.llft("$a$", a);
dotlabel.lrt ("$b$", b);
dotlabel.ulft("$c$", c);
dotlabel.urt ("$d$", d);
dotlabel.urt ("$e$", e);
dotlabel.ulft("$f$", f);
dotlabel.bot ("$g$", g);
endfig;
\end{mplibcode}
\end{document}
