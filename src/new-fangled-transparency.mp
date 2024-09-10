\documentclass[border=5mm]{standalone}
\usepackage{dwmpcode}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
def withalpha expr a = 
    withprescript "tr_alternative=2"
    withprescript "tr_transparency=" & decimal a
enddef;
beginfig(1);
path r, g, b; r = fullcircle scaled 48 shifted 12 up; g = r rotated 120; b = g rotated 120;
picture P[];

for i=0 upto 7:
    numeric a; a = 1/8 + i/8;
    P[i] = image(
        fill r withcolor 1/2[white, red] withalpha a;
        fill g withcolor 1/2[white, green] withalpha a;
        fill b withcolor 1/2[white, blue] withalpha a;
        draw r withcolor 1/2;
        draw g withcolor 1/2;
        draw b withcolor 1/2;
        label.bot(TEX("\mpl{withalpha " & decimal a & "}") scaled 0.8, point 1/2 of bbox currentpicture);
    );
endfor

for i=0 upto 7:
    draw P[i] shifted 120(i div 4, -(i mod 4)) ;
endfor

endfig;
\end{mplibcode}
\end{document}

