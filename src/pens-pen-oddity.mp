\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\def\t#1{\vbox{\let\\\cr\halign{\texttt{##}\hss\cr#1\cr}}}
\def\ts#1{\vbox{\let\\\cr\openup-4pt\halign{\small\hss\mpl{##}\hss\cr#1\cr}}}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric u; u = 16;
    pen P[];
    P1 = makepen(for i=1 upto 90: 1/2 dir 4i -- endfor cycle) scaled u;
    P10 = pencircle scaled u;
    P100 = pencircle scaled 1/2;
    P2 = pensquare scaled u;
    P20 = pensquare scaled u;
    P200 = pensquare;
    P3 = pensquare scaled 0.7071 u rotated 45;
    P30 = pensquare scaled 0.7071 u rotated 45;
    P300 = pensquare scaled 0.35355 rotated 45;
    P4 = penrazor scaled u;
    P40 = penrazor scaled u;
    P400 = penrazor;
    path crook; crook = origin -- (5u, 0) -- 7u * dir 30; 

    string cap_name[], join_name[], pen_name[];
    cap_name[butt] = "butt";
    cap_name[rounded] = "rounded";
    cap_name[squared] = "squared";
    join_name[beveled] = "beveled";
    join_name[rounded] = "rounded";
    join_name[mitered] = "mitered";
    pen_name1 = "pencircle";
    pen_name2 = "pensquare";
    pen_name3 = "pensquare\\\quad rotated 45";
    pen_name4 = "penrazor";

    for i=1, 2:
        draw (origin -- 360 right) shifted ((0, 2.25-2.8i) scaled 8u);
        label.rt("\t{" & pen_name[i] & "}", (0, 2.15-2.8i) scaled 8u);
        for cap = rounded, butt, squared:
            interim linecap := cap;
            for join = rounded, beveled, mitered:
                boolean default; default = (cap=rounded) and (join=rounded);
                interim linejoin := join;
                pair s; s = (cap, 0.8 join) shifted (0, -2.8i) scaled 8u;
                draw crook shifted s withpen P[i] 
                    withcolor 
                        (15/16 if default: - 1/8 fi)
                        if i=1: [blue, white] fi;
                draw (2.5u, 3u) shifted s withpen P[10i] withcolor 3/4;
                draw fullcircle scaled 20 shifted (2.5u, 3u) shifted s withcolor 3/4 red;
                for k=0, 1, 2:
                    draw makepath(P[i]) shifted point k of crook shifted s withcolor 1/2[blue, white];
                endfor
                draw envelope P[i] of crook shifted s; 
                draw crook shifted s withpen P[100i] withcolor red;
                if default:
                    label("\ts{linecap\\" & cap_name[cap] & "}", s + (0, 5/4u));
                    label("\ts{" & join_name[join] & "\\linejoin}", point 1 of crook shifted s shifted (0, -5/4u));
                else:
                    label("\ts{" & cap_name[cap] & "}", s + (0, u));
                    label("\ts{" & join_name[join] & "}", point 1 of crook shifted s shifted (0, -u));
                fi
            endfor
        endfor
    endfor
endfig;
\end{mplibcode}
\end{document}

