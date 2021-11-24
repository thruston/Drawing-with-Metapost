\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

input colorbrewer-rgb

phi = (sqrt 5 + 1) / 2;
psi = (sqrt 5 - 1) / 2;

vardef inflate_tall(expr level, a, b, c) = 
    save d;
    if level = 0:
        fill a--b--c--cycle withcolor Reds 7 2;
        draw a--b--c withpen pencircle scaled 1/8 withcolor white;
    else:
        pair d; d = psi[b,a]; 
        inflate_wide(level - 1, c, d, b);
        inflate_tall(level - 1, d, c, a);
    fi
enddef;
vardef inflate_wide(expr level, a, b, c) = 
    save d, e;
    if level = 0:
        fill a--b--c--cycle withcolor Reds 7 3;
        draw a--b--c withpen pencircle scaled 1/8 withcolor white;
    else:
        pair d, e; d = psi[a,b]; e = psi[a,c];
        inflate_wide(level - 1, e, d, a);
        inflate_wide(level - 1, c, e, b);
        inflate_tall(level - 1, d, e, b);
    fi
enddef;



beginfig(1);

    pair a, b, c;
    b = 0.5877852522924008 up scaled 800;
    c = -a = 0.80901699437 right scaled 800;
    picture P;
    P = image(inflate_wide(9, a, b, c));
    draw P; draw P reflectedabout(left, right);

    clip currentpicture to (unitsquare shifted -(1/2, 1/2) xscaled 610 yscaled 377);


endfig;
\end{mplibcode}
\end{document}

