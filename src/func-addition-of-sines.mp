\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef pi_sixths(expr n) = 
    save s, f, q; string s, f; numeric q; 
    s = if n < 0: "-" else: "" fi; q = abs(n);
    if q mod 6 = 0:
        f = if q > 6: decimal 1/6 q else: "" fi;
    elseif q mod 3 = 0:
        f = "\frac{" & decimal 1/3 q & "}{2}";
    elseif q mod 2 = 0:
        f = "\frac{" & decimal 1/2 q & "}{3}";
    else:
        f = "\frac{" & decimal q & "}{6}";
    fi
    "$\scriptstyle" & s & f & "\pi$"
enddef;

beginfig(1);
    numeric u, pi; u = 50; pi = 3.141592653589793;

    path xx, yy;
    xx = (3.5 left -- 4 right) scaled u;
    yy = (1.2 down -- 1.3 up) scaled u;
    
    path ss, tt, uu;
    ss = origin for x=1 upto 360: -- (x, sind(x)) endfor;
    tt = origin for x=1 upto 360: -- (x, 1/2 sind(3x)) endfor;
    uu = origin for x=1 upto 360: -- (x, ypart point x of ss + ypart point x of tt) endfor;

    forsuffixes $=ss, tt, uu:
        $ := $ shifted 360 left & $;
        $ := $ xscaled (pi/180) scaled u;
        $ := $ cutbefore yy shifted point 0 of xx
               cutafter  yy shifted point 1 of xx;
    endfor

    draw ss withcolor 1/2[blue, white]; 
    draw tt withcolor 1/2[red, white];
    draw uu withcolor 1/4 green;

    label.top("$f(x)=sin(x)$", point 290 of ss) withcolor 1/2[blue, white];
    label.bot("$g(x)=\frac12 sin(3x)$", point 295 of tt) withcolor 1/2[red, white];
    label.urt("$f(x) + g(x)$", point 350 of uu) withcolor 1/4 green;
    
    drawarrow xx; label.rt("$x$", point 1 of xx);
    drawarrow yy; label.top("$y$", point 1 of yy);

    for i=-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7:
        draw (down--up) scaled 2 shifted (pi * i/6 * u, 0);
        label.bot(pi_sixths(i), (pi * i/6 * u, -2));
    endfor

endfig;
\end{mplibcode}
\end{document}
