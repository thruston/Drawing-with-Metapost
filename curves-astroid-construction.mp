\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path xx, yy, base;

pair A, M, N, O, P, Q, R;
numeric t; t = 0.6;

base = fullcircle scaled 500;
xx = 12 left -- point 0 of base + 12 right;
yy = 12 down -- point 2 of base + 12 up;

O = origin;
A = point 0 of base;
R = (0, ypart point t of base);
Q = (xpart point t of base, 0);
M = 1/2[R, Q];
N = 1/2[M, point t of base];

P = whatever[R, Q]; P - point t of base = whatever * (R-Q) rotated 90;

path qa; qa = point 0 of base {left}
  for i=1/4 step 1/4 until 2:
      hide(pair a, b, p; 
        a = (xpart point i of base, 0);
        b = (0, ypart point i of base); 
        p = whatever[a, b]; p - point i of base = whatever * (a - b) rotated 90;
    ) .. p  endfor;

draw qa withcolor 3/4[1/2 red, white];

draw R -- point t of base -- O withcolor 3/4;
draw N -- P -- point t of base -- Q withcolor 3/4;
draw fullcircle scaled abs(M - point t of base) 
    shifted N withcolor 3/4;
draw R -- Q;

draw subpath (-1, 3) of base
    cutbefore xx shifted 1/2 point 0 of yy
    cutafter yy shifted 1/2 point 0 of xx
    withcolor 3/4[2/3 blue, white];

ahangle := 30;
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);

labeloffset := 5;
dotlabel.bot("$S$", A);
dotlabel.llft("$O$", O);
dotlabel.lft("$B$", R);
dotlabel.bot("$A$", Q);
dotlabel.bot("$P$", P);
dotlabel.bot("$M$", M);
dotlabel.top("$N$", N);
dotlabel.urt("$T$", point t of base);

draw P withpen pencircle scaled 2 withcolor 3/4[1/2 red, white];

drawoptions(withcolor 5/8[1/2 blue, white]);
label("$\scriptstyle  \theta$", 16 dir 1/2 angle point t of base shifted O);
label("$\scriptstyle 2\theta$", 12 dir 0 shifted M);
label("$\scriptstyle 4\theta$",  8 dir angle (Q-R) shifted N);
drawoptions();

endfig;
\end{mplibcode}
\end{document}

