vardef rope expr c = 
    save s, w, hemp; numeric s, w; w = +1; s = 2; color hemp; hemp = 1/256 (192, 149, 82);
    image(path a[]; numeric n; n = -1;
        for t=0 step s until arclength c: a[incr n] =
        (0,+w) rotated angle direction arctime t-3/2s of c of c shifted point arctime t-3/2s of c of c
     .. (0,+w) rotated angle direction arctime t-1/2s of c of c shifted point arctime t-1/2s of c of c
     .. (0,-w) rotated angle direction arctime t+1/2s of c of c shifted point arctime t+1/2s of c of c
     .. (0,-w) rotated angle direction arctime t+3/2s of c of c shifted point arctime t+3/2s of c of c;
     endfor
     drawoptions(withpen pencircle scaled 1/8);
     for i=1 upto n:
         path b; b = buildcycle(a[i-1], reverse a[i]);
         fill b withcolor 1/2[white, hemp]; draw b;
     endfor
     draw a[0];
     drawoptions();
    )
enddef;

