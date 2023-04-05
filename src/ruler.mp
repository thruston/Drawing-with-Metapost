% add a ruler along the left hand and lower edges 
% of the bounding box of the currentpicture
% ** meant to be embedded by something that sets u[] appropriately **
path B; B = bbox currentpicture;
for s=0, 1:
    path p; numeric a; pair o;
    p = subpath (0, 1) of if s=0: reverse fi B;
    a = arclength p;
    o = if s=0: left else: down fi;
    for i=0 upto 3:
        exitif not known u[i];
        for j=0 upto floor(a/u[i]):
            pair t; t = point arctime j*u[i] of p of p;
            draw (origin -- (6 - 2i) * o) shifted t;
            if i=0: label(decimal j, t shifted 12 o); fi
        endfor
    endfor
    draw p;
endfor
