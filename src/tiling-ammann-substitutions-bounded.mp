\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

input tiling-ammann-procedures

path rr, ss, tt;
rr = r scaled 48;
ss = t0 scaled 36;
tt = t1 scaled 36;

dotlabeldiam := 2;

picture P[];
P1 = image(
    bounded_rhomb(0, point 0 of rr, point 2 of rr);
    dotlabel.ulft("$a$", point 0 of rr);
    dotlabel.urt("$b$", point 2 of rr);
);
P2 = image(
    draw rr dashed withdots scaled 1/4;
    bounded_rhomb(1, point 0 of rr, point 2 of rr); 
);
P3 = image(
    drawarrow 16 left -- 20 right;
    label(P1, 50 left);
    label(P2, 50 right);
);

P4 = image(
    half_square(0, point 0 of ss, point 1 of ss, 0);
    dotlabel.ulft("$a$", point 0 of ss);
    dotlabel.urt ("$b$", point 1 of ss);
);
P5 = image(
    half_square(0, point 0 of tt, point 1 of tt, 1);
);
P6 = image(
    half_square(1, point 0 of ss, point 1 of ss, 0);
    draw ss dashed withdots scaled 1/4;
);
P7 = image(
    half_square(1, point 0 of tt, point 1 of tt, 1);
    draw tt dashed withdots scaled 1/4;
);

P8 = image(
    label.top(P4, 50 left);
    label.bot(P5, 50 left);
    label.top(P6, 50 right + 8 up);
    label.bot(P7, 50 right + 8 down);
    path a; a = 18 left -- 24 right;
    drawarrow a rotated 4 shifted 12 up;
    drawarrow a rotated -4 shifted 12 down;
);

beginfig(1);
    label.lft(P3, 13 left);
    label.rt (P8, 13 right);
endfig;
\end{mplibcode}
\end{document}

