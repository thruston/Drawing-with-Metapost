vardef rope expr c = 
    save s, w, hemp; numeric s, w; w = +1; s = 2; color hemp; hemp = 1/256 (192, 149, 82);
    image(draw c withpen pencircle scaled 1.08 s withcolor 1/2[hemp, white];
        for t=0 step s until arclength c: draw
        (0,+w) rotated angle direction arctime t-3/2s of c of c shifted point arctime t-3 of c of c
     .. (0,+w) rotated angle direction arctime t-1/2s of c of c shifted point arctime t-1 of c of c
     .. (0,-w) rotated angle direction arctime t+1/2s of c of c shifted point arctime t+1 of c of c
     .. (0,-w) rotated angle direction arctime t+3/2s of c of c shifted point arctime t+3 of c of c
     withpen pencircle scaled 1/4;
    endfor)
enddef;

