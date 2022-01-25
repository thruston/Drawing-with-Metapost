\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
pair a,b;
a = 42 up; b = 72 right;
beginfig(1);

draw (-1/4)[origin,b]--5/4[origin,b] withcolor .8 white;
draw (-1/4)[origin,a]--5/4[origin,a] withcolor .8 white;

draw (-1)[a,b]--a dashed evenly;
draw a--b withcolor .67 red;
draw b--2[a,b] dashed evenly;

dotlabel.urt(btex $a$ etex, a);
dotlabel.urt(btex $b$ etex, b);
dotlabel.urt(btex ${1\over2}[a,b]$ etex, 1/2[a,b]);
dotlabel.urt(btex $\left(-{1\over2}\right)[a,b]$ etex, (-1/2)[a,b]);
dotlabel.llft(btex $-{1\over2}[a,b]$ etex, -1/2[a,b]);
label(btex Probably not what was intended\dots etex, -1/2[a,b] shifted (0,-24)) withcolor .58 blue;
dotlabel.urt(btex ${3\over2}[a,b]$ etex, (3/2)[a,b]);
dotlabel.lrt(btex $(0,0)$ etex, origin);
endfig;
\end{mplibcode}
\end{document}
