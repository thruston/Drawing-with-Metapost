prologues := 3;
outputtemplate := "%j%c.%{outputformat}";


vardef pinwheel(expr level, a, b, c) = 
    if level = 0:
        fill a--b--c--cycle withcolor 1[white, (uniformdeviate 1/2, uniformdeviate 1, uniformdeviate 1/4)];
        %draw 1/3(a+b+c) + 1/4 dir uniformdeviate 360
         %   withpen pencircle scaled 1/4;
    else:
        save d, e, f, g;
        pair d, e, f, g; 
        d = 2/5[b, c]; e = 4/5[b,c]; f = 1/2[e, a]; g = 1/2[a, b];
        pinwheel(level - 1, e, a, c);
        pinwheel(level - 1, f, g, a);
        pinwheel(level - 1, f, g, e);
        pinwheel(level - 1, d, e, g);
        pinwheel(level - 1, d, b, g);
    fi
enddef;

beginfig(1);

    pinwheel(7, origin, 200 right, 100 up);
    pinwheel(7, (200,100), 100 up, 200 right);

endfig;
end.

