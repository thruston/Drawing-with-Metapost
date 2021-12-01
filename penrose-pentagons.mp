prologues := 3;
outputtemplate := "%j%c.eps";
input archimedean-tools
beginfig(1);

    path p[];
    p0 = for i=0 upto 4: 21 up rotated 72i -- endfor cycle;
    p1 = poly 5 of reverse p0;
    p2 = poly 5 of subpath (4, 3) of p1;
    p3 = poly 5 of subpath (3, 2) of p1;
    p4 = poly 5 of subpath (4, 3) of p2;

    p5 = poly 5 of subpath (4, 3) of p4;
    p6 = poly 5 of subpath (3, 2) of p4;
    p7 = poly 5 of subpath (2, 1) of p4;
    
    p8 = poly 5 of subpath (4, 3) of p5;
    p9 = poly 5 of subpath (3, 2) of p5;

    p10 = poly 5 of subpath (4, 3) of p6;
    p11 = poly 5 of subpath (3, 2) of p6;

    p12 = poly 5 of subpath (3, 2) of p11;

    p13 = poly 5 of subpath (5, 4) of p12;
    p14 = poly 5 of subpath (4, 3) of p12;
    p15 = poly 5 of subpath (3, 2) of p12;
    p16 = poly 5 of subpath (2, 1) of p12;

    p17 = poly 5 of subpath (4, 3) of p13;
    p18 = poly 5 of subpath (4, 3) of p17;
    p19 = poly 5 of subpath (4, 3) of p18;

    p20 = poly 5 of subpath (3, 2) of p19;
    p21 = poly 5 of subpath (2, 1) of p19;

    p22 = poly 5 of subpath (3, 2) of p20;
    p23 = poly 5 of subpath (3, 2) of p22;
    p24 = poly 5 of subpath (3, 2) of p23;
    p25 = poly 5 of subpath (3, 2) of p24;
    p26 = poly 5 of subpath (3, 2) of p25;
    p27 = poly 5 of subpath (3, 2) of p26;
    p28 = poly 5 of subpath (3, 2) of p27;
    
    p29 = poly 5 of subpath (4, 3) of p21;
    p30 = poly 5 of subpath (2, 1) of p29;
    p31 = poly 5 of subpath (4, 3) of p27;
    p32 = poly 5 of subpath (3, 2) of p13;
    p33 = poly 5 of subpath (3, 2) of p32;
    p34 = poly 5 of subpath (5, 4) of p33;
    p35 = poly 5 of subpath (3, 2) of p14;
    p36 = poly 5 of subpath (5, 4) of p35;
    p37 = poly 5 of subpath (4, 3) of p23;
    p38 = poly 5 of subpath (4, 3) of p37;
    p39 = poly 5 of subpath (4, 3) of p38;

    color c[];
    forsuffixes $=1, 5, 6, 7, 13, 18, 22, 24, 27, 29, 33, 35, 37: 
        c$ = 15/16 white; 
    endfor
    forsuffixes $=2,3, 8, 9, 10, 11, 16, 14, 15, 17, 20, 21, 25, 28, 30, 31, 32, 34, 36, 38: 
        c$ = 3/4[red, white];
    endfor
    forsuffixes $=0, 4, 12, 19, 23, 26, 39:
        c$ = 3/4[blue, white];
    endfor

    fill p0 withcolor c0;

    for k=0 upto 0:
        for i=1 upto infinity:
            exitif not known p[i];
            fill p[i] rotated 72k withcolor if known c[i]: c[i] else: 7/8 fi;
        endfor
    endfor
    for k=0 upto 4:
        for i=1 upto infinity:
            exitif not known p[i];
            %label(decimal i, median(p[i]) rotated 72k);
            draw p[i] rotated 72k;
        endfor
    endfor

    

endfig;
end.

