\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
beginfig(1);
numeric u; u = 56;
z1 = right scaled u;
z2 = z1 rotated 90;
z3 = z2 rotated 90;
z4 = z3 rotated 90;
z5 = 1/2[z1,z2];
z6 = 1/2[z2,z3];
z7 = 1/2[z3,z4];
z8 = 1/2[z4,z1];


string capnames[], joinnames[];
capnames[butt] = "\mpl{butt}";
capnames[rounded] = "\mpl{rounded}";
capnames[squared] = "\mpl{squared}";
joinnames[mitered] = "\mpl{mitered}";
joinnames[rounded] = "\mpl{rounded}";
joinnames[beveled] = "\mpl{beveled}";

picture p; numeric r; r = 2; interim labeloffset := 1;
for i=butt, rounded, squared:
    for j = mitered, rounded, beveled:
        linecap := i;
        linejoin := j;
        p := image(
            draw fullcircle scaled 8 shifted z5 withpen pencircle scaled 1/8 withcolor \mpcolor{textred};
            drawoptions (withpen pencircle scaled 3);
            draw unitsquare shifted -(1/2,1/2) scaled 2u withcolor 7/8;
            label.top("\mpl{linecap}", z6);
            label.bot(capnames[i], z6);
            label.top("\mpl{linejoin}", z8);
            label.bot(joinnames[j], z8);
            drawarrow z4 -- -(r, r) -- z3;
            draw z2-- (r, r) -- z1;
            drawdot(z5);
            drawarrow halfcircle scaled u rotated 180 shifted z4;
            drawoptions();
        ) shifted (5/2u*i, -11/4u*j);
        draw p;
        if (i=rounded) and (j=rounded): 
            draw bbox p dashed withdots scaled 1/4 
              withcolor \mpcolor{textgreen};
            label.urt("\small \textsf{\textit{default}}", point 3 of bbox p) withcolor \mpcolor{textgreen};
        fi
        endfor
    endfor
endfig;
\end{mplibcode}
\end{document}

