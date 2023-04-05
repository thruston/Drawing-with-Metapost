vardef rope expr c = 
    save s, w, hemp, n, a, b, A; 
    color hemp; hemp = 1/256 (192, 149, 82);
    numeric s, w, n, A; 
    w = -1; n = -1; A = arclength c; s = A/floor(A/2);
    path a[]; 
    for t=0 step s until A + 1:
        a[incr n] = (0,+w) rotated angle direction arctime t-3/2s of c of c shifted point arctime t-3/2s of c of c
                 .. (0,+w) rotated angle direction arctime t-1/2s of c of c shifted point arctime t-1/2s of c of c
                 .. (0,-w) rotated angle direction arctime t+1/2s of c of c shifted point arctime t+1/2s of c of c
                 .. (0,-w) rotated angle direction arctime t+3/2s of c of c shifted point arctime t+3/2s of c of c;
    endfor
    image(
        for i=1 upto n:
            path b; b = buildcycle(a[i-1], reverse a[i]);
            fill b withcolor 1/2[white, hemp]; 
            draw b withpen pencircle scaled 1/8;
        endfor
    )
    enddef;

