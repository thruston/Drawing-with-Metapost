prologues := 3;
outputtemplate := "%j%c.eps";
input ttcolors
beginfig(1);
    defaultfont := "phvr8r";
    numeric s[], v[];
    s0 = 1/2; v0 = 7/8;
    s1 = 7/8; v1 = 7/8;
    s2 = 7/8; v2 = 1/2;
    for y=0 upto 2:
        for h=0 step 15 until 360:
            fill fullcircle scaled 24 shifted (h, -32y) withcolor hsv_color(h, s[y], v[y]);
            draw fullcircle scaled 24 shifted (h, -32y) withcolor white;
            if y=1: label(decimal h infont defaultfont scaled 1/2, (h,-16)); fi
        endfor
    endfor

    label.urt("Less saturation", (-20,12));
    label.lrt("Lower value", (-20,-76));

    drawarrow (-15, -12) -- (-15,12);
    drawarrow (-15, -52) -- (-15,-76);




endfig;
beginfig(2);
    defaultscale := 3/4;
    path h,d,b; numeric n;
    h = ((-2,0)--(0,0)--(-1,3)--(-2,3)--cycle) scaled 60;
    d = h rotated 180;
    n = 10;
    b = subpath (0,1) of h -- point 1+1/n of d -- (xpart point 0 of h, ypart point 1+1/n of d) -- cycle;
    fill b withcolor hsv_color(123, 1/8, 7/8);
    draw subpath (2.13,4) of b;

    for i=1 upto n:
        fill point 4-(i-1)/n of h -- point 1+(i-1)/n of h 
             -- point 1+i/n of h -- point 4-i/n of h -- cycle
             withcolor hsv_color(42, 1/4 + 3/4 * i/n, 1 - i/3n);
        fill point 4-(i-1)/n of d -- point 1+(i-1)/n of d 
             -- point 1+i/n of d -- point 4-i/n of d -- cycle
             withcolor hsv_color(200, i/n - 1/n, 1 - i/3n);
    endfor
    string s;
    for i=1 upto n-1: 
        draw point 4-i/n of h -- point 1+i/n of h; 
        draw point 4-i/n of d -- point 1+i/n of d; 
        s := decimal if i < 4: (i**2+1) else: (10 + (i-3)*10) fi & "00";
        label.rt(s, point 1+i/n of h);
        label.lft(s, point 1+i/n of d);
    endfor
    label.rt("Metres", point 2 of h);
    label.lft("Metres", point 2 of d);
    label.lft("Hypsometric tints" infont defaultfont scaled defaultscale rotated 90, point 7/2 of h);
    label.rt("Bathymetric tints" infont defaultfont scaled defaultscale rotated -90, point 7/2 of d);
    label.lft("sea level", point 0 of h);
    label("areas below sea level", center b);
    draw h; draw d;
endfig;
end.
