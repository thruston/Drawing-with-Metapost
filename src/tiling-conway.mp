\documentclass[margin=1mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input tiling-pinwheel-macro
beginfig(1);
pair a, b, c, d, e, f, g; 
a = origin; b = 180 right; c = 1/2 b rotated 90;
d = 1/2[a,b]; e = 1/5[c,b]; f = 1/2[a,e]; g = 1/2[b,e];
pinwheel(1,a,b,c,"");

dotlabel.llft("$a$", a);
dotlabel.lrt ("$b$", b);
dotlabel.ulft("$c$", c);
dotlabel.bot ("$d$", d);
dotlabel.urt ("$e$", e);
dotlabel.ulft("$f$", f);
dotlabel.urt ("$g$", g);
endfig;
\end{mplibcode}
\end{document}
