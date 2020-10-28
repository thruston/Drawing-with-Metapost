prologues := 3;
outputtemplate := "%j%c.eps";

path circulus;
numeric m;
m = 0.13260824492;
circulus = for t=0 upto 7:
    (1/2, 0) rotated 45t .. controls ((1/2,m) rotated 45t) and ((1/2, -m) rotated 45(t+1)) ..
endfor cycle;


beginfig(1);

    path A, B, C;
    A = fullcircle scaled 200;
    B = circulus scaled 200;
    C = circulus scaled 100 shifted point 0 of B shifted 50 right;

    draw A withpen pencircle scaled 1 withcolor 1/2 white;
    draw B withpen pencircle scaled 1/2 withcolor 1/2 red;
    draw C withcolor 3/4 white;


    for t=1 upto length(B):
        dotlabel.top(decimal t, point t of B);
    endfor

    for t=0 step 1 until 360:
        numeric p, q;
        (p, q) = B intersectiontimes C rotated t;
        if p = -1:
            draw C rotated t withcolor red;
        fi
    endfor

endfig;
end.

