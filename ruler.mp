% add a ruler along the lowe edge of the bounding box of the currentpicture
%
    save p, a; path p; numeric a;
    p = subpath(0,1) of bbox currentpicture;
    a = arclength p;
    for t=0 upto a / in:
        draw (origin --      4 up) shifted point arctime t * in of p of p; 
        label.top(decimal t, 4 up  shifted point arctime t * in of p of p); 
    endfor
    for t=0 upto a / cm:
        draw (origin --      4 down) shifted point arctime t * cm of p of p; 
        label.bot(decimal t, 4 down  shifted point arctime t * cm of p of p); 
    endfor
    draw p;
