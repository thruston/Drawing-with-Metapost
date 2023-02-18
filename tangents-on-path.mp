\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path p; numeric s; s = 144;
p := (origin {1, 3} .. (1, 0) .. {1, 2} (2, 0)) scaled s; 

ahangle := 20;
ahlength := 6;
picture P[];
P1 = image(
    draw p withcolor 0.54 red;
    for t=0 upto length p: draw fullcircle scaled dotlabeldiam shifted point t of p; endfor
    label.bot(TEX("\mpl{point 0 of p}") scaled 0.8, point 0 of p shifted 16 right);
    label.urt(TEX("\mpl{point 1 of p}") scaled 0.8, point 1 of p);
    label.top(TEX("\mpl{point 2 of p}") scaled 0.8, point 2 of p shifted 16 left);
);
P2 = image(
    draw p withcolor 0.54 red;
    drawoptions(withcolor 1/2);
    for t=0 upto length p:
        drawarrow precontrol t of p -- postcontrol t of p;
        fill fullcircle scaled 2 shifted precontrol t of p;
        draw fullcircle scaled 4 shifted point t of p;
    endfor
    label.bot(TEX("\mpl{precontrol 0 of p}")  scaled 0.8, precontrol 0 of p shifted (24, -2));
    label.top(TEX("\mpl{postcontrol 0 of p}") scaled 0.8, postcontrol 0 of p shifted (24, 4));
    label.top(TEX("\mpl{precontrol 1 of p}")  scaled 0.8, precontrol 1 of p);
    label.bot(TEX("\mpl{postcontrol 1 of p}") scaled 0.8, postcontrol 1 of p);
    label.bot(TEX("\mpl{precontrol 2 of p}")  scaled 0.8, precontrol 2 of p);
    label.top(TEX("\mpl{postcontrol 2 of p}") scaled 0.8, postcontrol 2 of p shifted (-24, 2));
    drawoptions();
);
P3 = image(
    draw p withcolor 0.54 red;
    drawoptions(withcolor 1/2);
    for t=0 step 1/4 until length p:
        pair s; s = 16 unitvector(direction t of p);
        drawarrow (-s -- s) shifted point t of p;
        draw point t of p withpen pencircle scaled 2;
    endfor
    drawoptions();
    numeric x, y; x = 8; y = -12;
    label.rt(TEX("\mpl{pair s;}") scaled 0.7, (x, y+10));
    label.rt(TEX("\mpl{for t=0 step 1/4 until length p:}") scaled 0.7, (x, y));
    label.rt(TEX("\quad\mpl{s := 16 unitvector(direction t of p);}") scaled 0.7, (x, y-10));
    label.rt(TEX("\quad\mpl{drawarrow (-s -- s) shifted point t of p);}") scaled 0.7, (x, y-20));
    label.rt(TEX("\quad\mpl{draw point t of p withpen pencircle scaled 2;}") scaled 0.7, (x, y-30));
    label.rt(TEX("\mpl{endfor}") scaled 0.7, (x, y-40));
);
draw P1;
draw P2 shifted 144 down;
draw P3 shifted 248 down;
endfig;
\end{mplibcode}
\end{document}

