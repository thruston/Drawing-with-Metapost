\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef extended(expr p) = 
    -42 unitvector(direction 0 of p) shifted point 0 of p .. p .. 
    +42 unitvector(direction 1 of p) shifted point 1 of p
enddef;

vardef beside(expr p, d) = 
    save n; numeric n; n = length p;
    path _part[], _trimmed[];
    for i = 1 upto n:
        pair a, b, aa, bb;
        aa = postcontrol i-1 of p - point i-1 of p; a = unitvector(aa) rotated -90 scaled d;
        bb = point i of p - precontrol i of p;      b = unitvector(bb) rotated -90 scaled d;
        _part[i] = extended(point i-1 of p shifted a {aa} .. point i of p shifted b {bb});
    endfor

    if cycle p:
        _part[0]   = _part[n];
        _part[1+n] = _part[1];
    else:
        _part[0]   = (up--down) scaled 42 rotated angle direction 0 of p shifted point 0 of p;
        _part[1+n] = (up--down) scaled 42 rotated angle direction n of p shifted point n of p;
    fi

    for i=1 upto n:
        _trimmed[i] = _part[i] cutbefore _part[i-1] cutafter _part[i+1];
    endfor
    
    _trimmed[1] for i=2 upto n: .. _trimmed[i] endfor if cycle p: .. cycle fi
enddef;
beginfig(1);

    path P[];

    P1 = (left--right) rotated 10 scaled 60;
    P2 = fullcircle scaled 120;
    P3 = (reverse halfcircle -- origin -- down) scaled 64;
    P4 = for i=0 upto 4: 60 up rotated 72i -- endfor cycle;
    P5 = (left {dir 42} .. origin .. right {dir 42}) scaled 64;
    P6 = (left {dir 42} .. right {dir 42}) scaled 64;
    P7 = 40 left {right} .. 20 up .. 40 up {left} .. 20 up .. {right} 40 right;

    draw beside(P1, 1/2);
    draw beside(P1, -1/2);

    for i=1 upto 10:
        if known P[i]:
            P[i] := P[i] shifted (0, 144i);
            draw beside(P[i], 1/2) withcolor red;
            draw beside(P[i], -1/2) withcolor red;
        fi
    endfor

endfig;
\end{mplibcode}
\end{document}

