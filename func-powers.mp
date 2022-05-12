\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
input colorbrewer-rgb
numeric t, s, u, v; 
t = 3; s = 1; 
u = 50; v = 10;

path xx, yy;
xx = (left -- right) scaled t scaled u;
yy = 50 down -- 100 up;

picture P[];
for k = 1 upto 3:
    s := s * 1/2;
    P[k] = image(
        for n=2 upto 7:
            path c; c = (for x = -t step s until t-s: (x, x**n) ... endfor (t, t**n)) xscaled u yscaled v
            cutbefore xx shifted point if odd n: 0 else: 1 fi of yy
            cutafter xx shifted point 1 of yy if n > 5: shifted (0, v*n - 5v) fi;
            draw c withcolor Spectral[6][n-1];
            for i=0 upto length(c): 
                draw point i of c withpen pencircle scaled 1;
            endfor
            label("$\scriptstyle x^" & decimal n & "$", point infinity of c shifted 3 right shifted 6 unitvector(direction infinity of c));
            label("Step: $\frac1{" & decimal (1/s) & "}$", (30, 80));
        endfor
        for i=1,2: 
            draw (i*u, 0) -- (i*u, -2); 
            label.bot(decimal i, (i*u, -2));
        endfor
        drawarrow xx;
        drawarrow yy;
    );
    draw P[k] shifted (0, -160k);
endfor
endfig;
\end{mplibcode}
\end{document}
