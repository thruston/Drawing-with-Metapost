\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric alpha; alpha = 34;
    transform t;
    origin transformed t = origin;
    right transformed t = dir -alpha;
    up transformed t = dir alpha;

    path xx, yy;
    xx = (origin--right) scaled 144;
    yy = (origin--up) scaled 144;

    numeric a, s; s = 1/64; a = 3/2;
    path hh;
    for x = 8 * a * s step s until 8/a:
        hh := if known hh: hh ... fi (a * x, a / x);
    endfor;
    hh := hh scaled 16;     
    path C; C = fullcircle scaled 2a scaled sqrt(2) scaled 16;
    pair F; F = (xpart point 0 of C, ypart point 2 of C);

    interim ahangle := 30;
    picture P[];
    P1 = image(
        draw point 0 of C -- F -- point 2 of C withcolor 3/4[blue, white];
        draw subpath (-1/2, 5/2) of C withcolor 3/4[blue, white];
        drawarrow xx withcolor 1/2;
        drawarrow yy withcolor 1/2;
        draw hh withcolor 2/3 red;  dotlabel.urt("$S$", F);
    );
    P2 = image(
        hh := hh transformed t;
        C := fullcircle scaled 2 abs(point directiontime down of hh of hh);
        F := F rotated -45;
        (p, whatever) = C intersectiontimes (fullcircle scaled abs(F) shifted 1/2 F);
        draw point p of C -- F -- point -p of C withcolor 3/4[blue, white];
        draw subpath (-alpha/30, alpha/30) of C withcolor 3/4[blue, white];
        drawarrow xx transformed t withcolor 1/2;
        drawarrow yy transformed t withcolor 1/2;
        draw hh withcolor 2/3 red;  
        dotlabel.urt("$S$", F);
    );

    label.lft(P1, 10 left);
    label.rt(P2, 10 right);



    %path C;
    %C = fullcircle scaled 4 cosd(alpha) scaled 32a ; 
    %draw C withcolor 1/2;

    %pair S;
    %S = whatever[precontrol +alpha/45 of C, postcontrol +alpha/45 of C]
    %  = whatever[precontrol -alpha/45 of C, postcontrol -alpha/45 of C];
    %draw (64a * right) withpen pencircle scaled 3 withcolor 3/4[blue, white];
    %draw S withpen pencircle scaled 3/2 withcolor red;

    %draw hh withcolor 2/3 red;
    %%draw hh rotated 180 withcolor 2/3 red;

    %% path t;
    %% t = point 4 of hh -- point 80 of hh -- point 400 of hh -- cycle;
    
    %% pair a, b, c;
    %% a = whatever[point 0 of t, point 1 of t]; point 2 of t - a = whatever * (point 0 of t-point 1 of t) rotated 90;
    %% b = whatever[point 2 of t, point 1 of t]; point 0 of t - b = whatever * (point 2 of t-point 1 of t) rotated 90;

    %% draw t;  c = whatever[point 2 of t, a] = whatever[point 0 of t, b];

    %% draw c withpen pencircle scaled 3;



endfig;
\end{mplibcode}
\end{document}

