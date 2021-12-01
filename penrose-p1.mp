prologues := 3;
outputtemplate := "%j%c.eps";

input colorbrewer-rgb

vardef inflate(expr level, shade, pentagon) = 
    if level=0:
        fill pentagon withcolor shade;
        draw pentagon withpen pencircle scaled 1/8;
    else:
        save p, c, smaller;
        pair p, c; path smaller;
        c = 1/5 (origin for i=0 upto 4: + point i of pentagon endfor);
        p = whatever[point 0 of pentagon, point 2 of pentagon]
          = whatever[point 1 of pentagon, point 4 of pentagon];
        smaller = for i=0 upto 4: p rotatedabout(c, 72i) -- endfor cycle;
        inflate(level-1, Reds 7 2, smaller);
        for i=0 upto 4:
            inflate(level-1, Greens[7][1+i], 
                smaller reflectedabout(point 0 of smaller, point 1 of smaller)
                        rotatedabout(c, 72i));
        endfor
    fi
enddef;

beginfig(1);


    path P; P = for i=0 upto 4: 400 up rotated 72i -- endfor cycle;

    inflate(2, white, P);



endfig;
end.

