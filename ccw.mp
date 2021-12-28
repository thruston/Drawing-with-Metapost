prologues := 3;
outputtemplate := "%j%c.%{outputformat}";


vardef circle_through(expr A, B, C) =
    save o; pair o;
    o = whatever * (A-B) rotated 90 shifted 1/2 [A,B]
      = whatever * (B-C) rotated 90 shifted 1/2 [B,C];
    fullcircle scaled 2 abs (A-o) shifted o
enddef;
input colorbrewer-rgb

vardef ccw(expr n, d, r) = 
    % n sides, d diameter, r randomness
    save star, a, m, p, q, s, t;  
    path star, p, q; numeric a, m, s, t;
    star = origin -- (d, 0);
    m = floor (n / 2);
    a = 360 / n * m - 180;
    for t = 1 upto n - 3:
        star := star -- point length star - 1 of star 
                        rotatedabout(point length star of star, a + r/4 * normaldeviate);
    endfor
    s = length star; t = angle (point s of star - point 0 of star);
    p = quartercircle            scaled 2d rotated t shifted point 0 of star;
    q = quartercircle rotated 90 scaled 2d rotated t shifted point s of star;
    star := star -- p intersectionpoint q -- cycle;
    for i = 1 step n - 2 until n * (n - 2):
        point i+1 of star {(point i+1 of star - point i of star) rotated 90} ..
        point i-1 of star {(point i-1 of star - point i of star) rotated 90} &
    endfor cycle
enddef;


beginfig(1);
    
    for i=1 upto 4: 
        path p; p = ccw(2i + 1, 100, 10-i);
        p := p shifted ((120i, 0) - lrcorner p); 
        fill p withcolor 1/2[Reds[9][i], white];
        draw for j=0 step i until i * length p: point j of p -- endfor cycle 
            dashed evenly scaled 1/2 
            withpen pencircle scaled 1/4 withcolor red;
        draw p withcolor 2/3 red;
    endfor
endfig;
end.
