\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input archimedean-tools
beginfig(1);

    path h[];
    % 42/sqrt(3) \simeq 24.2487; 
    for i=0 upto 2:
        h[i] = poly 6 of (origin -- 42 / sqrt(3) * dir (30 + 120i));
    endfor

    picture unit;
    unit = image(
        % fill h0 withcolor Purples 8 3;
        % fill h1 withcolor Oranges 8 3;
        % fill h2 withcolor Blues 8 2;
        numeric i; i = -1;
        forsuffixes $ = Purples, Oranges, Blues:
            pair m; m = median(h[incr i]);
            for j=1 upto 3:
                fill subpath (-2i+2j, 2-2i+2j) of h[i] -- m -- cycle withcolor $[8][1+j];
            endfor
            for j=1 upto 3:
                draw m -- point 2j of h[i] withcolor $[8][1];
            endfor
        endfor
        
        % for i=0 upto 2:
        %     pair m; m = median(h[i]);
        %     for j=0 upto 2:
        %         draw point 2j+1/2 of h[i] -- m -- point 2j+3/2 of h[i];
        %     endfor
        % endfor
    );

    pair u, v;
    u = point 3 of h1 - point 1 of h0;
    v = u rotated 60;

    numeric n;
    n = 4;

    for i=-n upto n:
        for j=-n upto n:
            draw unit shifted (i*u + j*v);
        endfor
    endfor

    clip currentpicture to superellipse(168 right, 168 up, 168 left, 168 down, 0.78);



endfig;
\end{mplibcode}
\end{document}
