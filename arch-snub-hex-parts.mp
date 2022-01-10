input colorbrewer-rgb
input archimedean-tools
path t[], h;
h = poly 6 of (origin -- 21 dir 30);
for i=1 upto 6:
    t[i] = poly 3 of subpath (i, i-1) of h;
endfor
picture P[], unit[];
for k=1 upto 2:
    pair u, v;
    if k=1:
        u = point 2 of h - point 2 of t6;
        t7 := poly3 of subpath (0, -1) of t6;
        t8 := poly3 of subpath (0, -1) of t3;
    else:
        u = point 3 of h - point 2 of t6;
        t7 := poly3 of subpath (2, 1) of t6;
        t8 := poly3 of subpath (2, 1) of t3;
    fi

    v = u rotated -60;

    unit[k] = image(
        for i=1 upto 6:
            fill t[i] withcolor Blues 8 if odd i: 2 else: 3 fi;
        endfor
        for i=7 upto 8:
            fill t[i] withcolor Oranges 8 if odd i: 3 else: 2 fi;
        endfor
        fill h withcolor Oranges 8 2;
        forsuffixes $=h, t1, t2, t3, t4, t5, t6, t7, t8:
          draw $ withpen pencircle scaled 1/4 withcolor 3/4;
          pair m; m = median($);
          for i=1 upto length $:
            draw m -- point i - 1/2 of $ withcolor 3/4;
          endfor
        endfor
    );

    numeric n; n=4;
    P[k] = image(
        for i=-n upto n:
            for j=-n upto n:
                draw unit[k] shifted (i*u + j*v - floor (j/2) * u);
            endfor
        endfor
        clip currentpicture to superellipse(168 right, 168 up, 168 left, 168 down, 0.78);
    );
endfor
