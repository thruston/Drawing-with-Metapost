\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibnumbersystem{double}
\begin{mplibcode}
beginfig(1);

vardef zinverse(expr z) = 1/abs z * dir - angle z enddef;

vardef fizz(expr X) =
    pair m, n;
    m = right;
    n = origin;
    numeric a, x;
    x = X;
    forever:
        exitif x = 0;
        m := m zscaled zinverse((-1, 1));
        a := x mod 2;
        n := n + a * m;
        x := x div 2;
    endfor
    n
enddef;
input colorbrewer-rgb
color shade[]; 
shade0 = Reds 5 4; shade1 = Oranges 5 4;
shade2 = Greens 5 4; shade3 = Blues 5 4;

beginfig(1);
    numeric s, t; s = 256; t = 4;
    for n=0 upto (s/t*s/t-1):
        numeric h, v;
        h = floor 1/8 (n mod 32);
        v = n mod 4;
        fill fullcircle scaled t shifted (fizz(n) scaled s)
            withcolor (1/2 + 1/8 v)[white, shade[h]];
    endfor;
    path xx, yy;
    xx = (left--right) scaled (s+8);
    yy = xx rotated 90;
    for i=-1 upto 1:
        draw xx shifted (0, s*i) withpen pencircle scaled 1/8;
        draw yy shifted (s*i, 0) withpen pencircle scaled 1/8;
    endfor
    dotlabel.lrt(btex $-1-i$ etex, (-1, -1) scaled s);
    dotlabel.lrt(btex $-1$ etex, (-1, 0) scaled s);
    dotlabel.lrt(btex $-1+i$ etex, (-1, 1) scaled s);
    dotlabel.lrt(btex $-i$ etex, (0, -1) scaled s);
    dotlabel.lrt(btex $+i$ etex, (0, 1) scaled s);
    dotlabel.lrt(btex $+1-i$ etex, (1, -1) scaled s);
    dotlabel.lrt(btex $+1$ etex, (1, 0) scaled s);
    dotlabel.lrt(btex $+1+i$ etex, (1, 1) scaled s);
endfig;
\end{mplibcode}
\end{document}
