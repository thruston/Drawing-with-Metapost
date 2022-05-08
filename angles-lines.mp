\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    % define a unit
    numeric u;
    u = 1cm;

    % define the axes
    path xx, yy;
    xx = (2 left -- 10 right) scaled u;
    yy = (down -- 7 up) scaled u;

    % and the angles
    numeric theta, psi;
    psi = 28;
    theta = 50;
    
    % and some points
    pair P, Q, H, N, M, T, L;
    P = (4, 3) scaled 1cm;
    
    % now some lines
    path ell, tee, arc;
    ell = (left--right) scaled 10u rotated theta shifted P cutbefore xx;
    tee = (left--right) scaled 10u rotated psi   shifted P cutbefore xx;
    
    % this is a bit if a fiddle, but gets us a circular arc tangent to 
    % the line tee at point P, which appears to be what is wanted....
    arc = subpath (1.6, 3.2) of halfcircle rotated -180 shifted 1/2 up 
          scaled 10u shifted P rotatedabout(P, psi);

    % the rest of the points then follow...
    Q = ell intersectionpoint subpath (1.5, 3) of arc;
    H = P + whatever * dir psi;  
    xpart H = xpart Q = xpart M;  ypart M = ypart N = 0;
    xpart N = xpart P;
    L = point 0 of ell;
    T = point 0 of tee;

    % now we can get with the drawing
    draw arc dashed withdots scaled 1/4 withcolor 1/2 red;
    draw P--N dashed withdots scaled 1/2;
    draw Q--M dashed withdots scaled 1/2;

    drawarrow xx; label.rt("$x$", point 1 of xx);
    drawarrow yy; label.top("$y$", point 1 of yy);
    
    drawoptions(withcolor 2/3 blue);
    draw fullcircle scaled 32 shifted T cutafter tee;
    draw fullcircle scaled 28 shifted L cutafter ell;
    label("$\psi$", 24 right rotated 1/2 psi shifted T);
    label("$\theta$", 20 right rotated 1/2 theta shifted L);
    drawoptions();

    path boundary;
    z1 = point .95 of xx;
    z2 = point .95 of yy;
    boundary = z1--(x1,y2)--z2;

    draw ell cutafter boundary;
    draw tee cutafter boundary;

    % and finally label the points.
    label.bot("$T$", T);
    label.bot("$L$", L);
    label.bot("$N$", N);
    label.bot("$M$", M);
    dotlabel.ulft("$P$", P);
    dotlabel.lrt("$Q$", Q);
    dotlabel.lrt("$H$", H);

endfig;
\end{mplibcode}
\end{document}

