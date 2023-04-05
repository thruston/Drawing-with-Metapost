\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
vardef gcd(expr a, b) = 
    if b = 0: a else: gcd(b, a mod b) fi 
enddef;
beginfig(1);
for n=2 upto 24: 
    for s=1 upto floor n/2:
        pair p; p = (12n - 24s, -24n);
        path gon; gon = (
            for t=0 upto n/gcd(s,n) - 1:
                10 up rotated (360/n * s * t) -- 
            endfor cycle);
        if (n mod s = 0): 
            fill gon shifted p withcolor PuBuGn[9][1+floor (n/s/6)];
            label("$" & decimal (n/s) & "$", p);
        fi
        draw gon shifted p withpen pencircle scaled 1/8;
    endfor
endfor
endfig;
\end{mplibcode}
\end{document}

