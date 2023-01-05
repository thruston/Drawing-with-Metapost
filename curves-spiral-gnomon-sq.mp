\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    drawoptions(withpen pencircle scaled 1/4 withcolor 1/4);
    path s[]; s0 = unitsquare; 
    fill s0 withcolor 1/2[2/3 blue, white]; draw s0;
    numeric a, b, t, n; a = 1; b = 1; n = 11;
    for i = 1 upto n:
        t := b; b := b + a; a := t;
        s[i] = unitsquare scaled a;
        s[i] := s[i] shifted (point i of s[i-1] - point i-1 of s[i]);
        fill s[i] withcolor (1/2 + i/32)[2/3 blue, white];
        draw s[i];
    endfor
    for i = n-1 upto n:
        draw point i-2 of s[i-2] -- point i of s[i];
    endfor
    drawoptions();
    drawarrow origin for i=0 upto n: .. point i of s[i] endfor withcolor 2/3 red;
        
    numeric a, b, t; a = 1; b = 1;
    for i = 1 upto n:
        t := b; b := b + a; a := t;
        if a > 5:
            label(TEX(decimal a) rotated angle point n of s[n], center s[i]);
        fi
    endfor
    currentpicture := currentpicture rotated - angle point n of s[n]; 

endfig;
\end{mplibcode}
\end{document}

