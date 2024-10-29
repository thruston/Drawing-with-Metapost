\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

def gcd(expr a, b) = if b = 0: a else: gcd(b, a mod b) fi enddef;

beginfig(1);

    for s = 20 upto 31:
        pair z; z = (75s mod 300, if s < 20: 80 elseif s < 24: 0 elseif s < 28: -80 else: -160 fi); 
        path S; S = superellipse(36 right, 36 up, 36 left, 36 down, 1/32 s);
        if (23 < s) and (s < 28):
            fill S shifted z withcolor 15/16[blue, white];
        fi
        draw S shifted z;
        numeric n, d, g; g = gcd(s, 32); n = s/g; d = 32/g;
        label("$\frac{" & decimal n & "}{" & decimal d & "}$", z);
    endfor


endfig;
\end{mplibcode}
\end{document}

