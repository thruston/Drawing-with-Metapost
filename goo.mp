prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);

    path s, t, ss;
    numeric k, r, n;
    k = 16;
    s = unitsquare shifted -(1/2, 1/2) scaled k;
    t = s rotated 45;
    r = 1/(2+sqrt(2));
    ss = for i=0 upto 3:
        point i of s -- point i + r of s --
        point i of t -- point i + r of t --
    endfor cycle;


    n = 8;
    fill s scaled 3n withcolor 3/4 red + 1/2 green;
    draw fullcircle scaled 2 withcolor red;
    for i = -n upto n:
        for j = -n upto n:
            pair A; A = ((i, j) scaled 1.41421356237 k); 
            fill ss shifted A withcolor 
                if odd ceiling (i/2): 
                    if odd ceiling (j/2): 2/3 blue else: 1/2 green fi
                else:
                    if odd ceiling (j/2): 1/2 green else: 2/3 blue fi
                fi;
            draw ss shifted A withcolor white;
        endfor
    endfor


endfig;
end.

