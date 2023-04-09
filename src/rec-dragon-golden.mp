\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
vardef acosd(expr a) = angle (a, 1 +-+ a) enddef;
numeric r, phi, theta;
phi = 0.61803398875;
r = phi**phi;
theta = acosd(1/2(1/r + r - r * r * r));

vardef dragon(expr a, b) = 
    if abs(a-b) > 1:
        save p; pair p;
        p = r[a, b] rotatedabout(a, theta); 
        dragon(a, p) & reverse dragon(b, p)
    else:
        a -- b
    fi
enddef;

beginfig(1);
    path p; p = dragon(origin, 518 right);
    draw p withpen pencircle scaled 1/8 withcolor \mpcolor{carrot};
    picture base; base = image(
        draw 10 left -- 90 right withcolor 3/4;
        path a; a = (origin -- r * dir theta -- right) scaled 80;
        draw a; 
        for t=0 upto 2: draw point t of a withpen pencircle scaled 2 withcolor .54 red; endfor
        label.ulft("$r$", point 1/2 of a);
        label.urt ("$r^2$", point 3/2 of a);
        label.bot ("$1$", 1/2[point 0 of a, point 2 of a]);
        label("$\theta$", 18 dir 1/2 theta);
    );
    label.lrt(base, ulcorner currentpicture);
endfig;
\end{mplibcode}
\end{document}

