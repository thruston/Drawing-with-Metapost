\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
ahangle := 30;
beginfig(1);

path h; pair A, B, C, D, O; numeric theta;

h = halfcircle scaled 320;

O = origin;
A = point 4 of h;
B = point 0 of h;
C = point 5/4 of h;
D = (xpart C, ypart A);

2theta = angle C;

draw unitsquare scaled 8 rotated angle (C-D) shifted D withcolor 3/4;
draw unitsquare scaled 8 rotated angle (A-C) shifted C withcolor 3/4;

draw A--C--B withcolor Reds 7 7;
draw O--C--D withcolor Reds 7 7;

drawoptions(withcolor Blues 7 6);
draw h; 
label.ulft("$x^2 + y^2 = 1$", point 3 of h);
drawoptions();

primarydef o through p = (1+o/arclength(p))[point 1 of p, point 0 of p] -- (1+o/arclength(p))[point 0 of p, point 1 of p] enddef;
drawarrow 16 through (A--B);
drawarrow 16 through (O--point 2 of h);

dotlabel.bot("$A$", A);
dotlabel.bot("$B$", B);
dotlabel.urt("$C \smash{\;\bigl(\cos2\theta, \sin2\theta\bigr)}$", C);
dotlabel.bot("$D$", D);
dotlabel.llft("$O$", O);

label("$\theta$", 28 dir 1/2 theta shifted A);
label("$2\theta$", 20 dir theta);

label("$x$", B shifted 24 right);
label("$y$", point 2 of h shifted 24 up);

draw thelabel.top("$2\cos\theta$", origin) rotated theta      shifted 1/2[A, C];
draw thelabel.top("$2\sin\theta$", origin) rotated (theta-90) shifted 1/2[B, C];

label.bot("$\triangle ACD \sim \triangle ABC$", point 1/2 of bbox currentpicture shifted 24 down);

path bb; bb = bbox currentpicture shifted 12 down;

label.bot(btex \vbox{\openup 4pt\halign{\hfil $#$\hfil\cr
CD \Big/ AC = BC \Big/ AB\cr
\sin 2\theta \big/ 2 \cos\theta = 2 \sin\theta \big/ 2\cr
\sin 2\theta = 2\sin\theta \cos\theta\cr}} etex, point 1/4 of bb);

label.bot(btex \vbox{\openup 4pt\halign{\hfil $#$\hfil\cr
AD \Big/ AC = AC \Big/ AB\cr
\bigl(1 + \cos 2\theta \bigr) \big/ 2 \cos\theta = 2 \cos\theta \big/ 2\cr
\cos 2\theta = 2\cos^2\theta - 1\cr}} etex, point 3/4 of bb);

endfig;
\end{mplibcode}
\end{document}

