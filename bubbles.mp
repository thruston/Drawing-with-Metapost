prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);

    numeric r[];
    r1 = 80;  r2 = 39;
    r3 = (r1*r2)/(r1-r2);

    x1=y1=y2=0;
    x2 = if r1 < r2: r1 ++ sqrt(r2*(r2-r1)) elseif r2 < r1: r2 ++ sqrt(r1*(r1-r2)) fi;


    path c[];
    c1 = fullcircle scaled 2r1 shifted z1;
    c2 = fullcircle scaled 2r2 shifted z2;

    (t,  u) = c1 intersectiontimes c2;
    z0 = point t of c1;

    z3 = whatever[z1, z2] = whatever [z0, z2 rotatedabout(z0, 60)];
    c3 = fullcircle scaled 2r3 shifted z3;

    (t', v) = c1 intersectiontimes c3;
    draw subpath (t, 8-t) of c1;
    draw subpath (-u, u) of c2;
    draw subpath (v, 8-v) of c3;

endfig;
end.

