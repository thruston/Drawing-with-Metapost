\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    picture U, XY, X, Y, Z;
    z1 = -z2 = (-61, 42);

    U  = thelabel("$U$", z1);
    XY = thelabel("$X\times_ZY$", origin);
    X  = thelabel("$X$", (x2, 0));
    Y  = thelabel("$Y$", (0, y2));
    Z =  thelabel("$Z$", z2);

    forsuffixes @=U, XY, X, Y, Z: draw @; endfor

    ahangle := 20;
    vardef connect@#(expr s, a, b) = 
        curved_connect@#(s, a, b, center b - center a)
    enddef;

    vardef curved_connect@#(expr s, a, b, d) = 
        save line, mark; 
        
        path line; 
        line = center a {d} .. center b;
        interim bboxmargin := 4;
        drawarrow line cutbefore bbox a cutafter bbox b;

        picture mark;
        mark = thelabel@#("$\scriptstyle " & s & "$", point 1/2 of line);
        interim bboxmargin := 1;
        unfill bbox mark; draw mark;
    enddef;

    connect.bot("p", XY, X);
    connect.rt ("q", XY, Y);
    connect.top("g", Y, Z);
    connect.lft("f", X, Z);

    curved_connect.urt("x", U, X, right);
    curved_connect.llft("y", U, Y, dir -80);

    drawoptions(dashed withdots scaled 1/2);
    connect("(x,y)", U, XY);
    drawoptions();


endfig;
\end{mplibcode}
\end{document}
