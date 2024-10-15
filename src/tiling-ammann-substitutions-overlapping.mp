\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

input tiling-ammann-procedures

picture P[];

path ss, rr;

ss = s scaled 36;
rr = r scaled 48; 

dotlabeldiam := 2;

P1 = image(
    square(0, point 0 of ss, point 2 of ss);
    dotlabel.ulft("$a$", point 0 of ss);
    dotlabel.urt ("$b$", point 2 of ss);
);
P2 = image(
    draw ss dashed withdots scaled 1/4;
    square(1, point 0 of ss, point 2 of ss);
);

P3 = image(
    drawarrow 20 left -- 20 right;
    label(P1, 50 left);
    label(P2, 50 right);
);

P4 = image(
    rhomb(0, point 0 of rr, point 2 of rr);
    dotlabel.ulft("$a$", point 0 of rr);
    dotlabel.urt("$b$", point 2 of rr);
);

P5 = image(
    draw rr dashed withdots scaled 1/4;
    rhomb(1, point 0 of rr, point 2 of rr);

);

P6 = image(
    drawarrow 16 left -- 20 right;
    label(P4, 50 left);
    label(P5, 50 right);

);

beginfig(1);
    label.lft(P6, 13 left);
    label.rt(P3, 13 right);
endfig;
\end{mplibcode}
\end{document}

