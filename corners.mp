\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{fontspec}
\setmainfont{TeX Gyre Pagella}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    picture p, q;
    p = thelabel.rt("\fontsize{48}{48}\selectfont plain", origin);
    q = thelabel.rt("\fontsize{48}{48}\selectfont rotated", origin) rotated 30;

    picture P[];
    numeric i; i = 0;
    forsuffixes @=p,q:
        P[incr i] = image(
            fill bbox @ withcolor 15/16[red, white];
            draw llcorner @ -- lrcorner @ -- urcorner @ -- ulcorner @ -- cycle
                withcolor 7/8[red, white];
            draw llcorner @ -- urcorner @ withcolor 7/8[red, white];
            draw ulcorner @ -- lrcorner @ withcolor 7/8[red, white];
            draw @ withcolor 3/4;
            dotlabel.lft("\texttt{llcorner}", llcorner @);
            dotlabel.rt ("\texttt{lrcorner}", lrcorner @);
            dotlabel.rt ("\texttt{urcorner}", urcorner @);
            dotlabel.lft("\texttt{ulcorner}", ulcorner @);
            draw fullcircle scaled 3 shifted center @;
        );
    endfor
    labeloffset := 20;
    label.top(P1, origin);
    label.bot(P2, origin);
endfig;
\end{mplibcode}
\end{document}

