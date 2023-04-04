\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
vardef freehand_through@#(expr a, b) =
    save t; pair t; t = @# * unitvector(b - a) rotated (4 + normaldeviate);
    a - t .. a {t} .. b {t} .. b + t
enddef;

vardef mid_arc@#(expr p, a, b) =
    save c; path c; c = fullcircle scaled (2*@#) shifted p cutbefore a cutafter b;
    point arctime 1/2 arclength c of c of c
enddef;

beginfig(1);
defaultfont := "eurm10"; color sepia; sepia = (0.44, 0.26, 0.08);
pair A, B, C;
A = (0,-30); B = (180,0);  C = (120,90);

path a, b, c;
a = freehand_through 7 (A, B);
b = freehand_through 8 (B, C);
c = freehand_through 6 (C, A);

drawoptions(withcolor sepia);
draw a; draw b; draw c;

drawoptions(withcolor .67 blue);
label.bot ("a", point 3/2 of a);
label.rt  ("b", point 3/2 of b);
label.ulft("c", point 3/2 of c);

drawoptions(withcolor .5 red);
label(char 11, mid_arc 16 (A, a, c));
label(char 12, mid_arc 14 (B, b, a));
label(char 13, mid_arc 14 (C, c, b));

drawoptions();
endfig;
\end{mplibcode}
\end{document}

