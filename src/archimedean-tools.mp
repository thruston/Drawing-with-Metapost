% a polygon of n sides on a given path
vardef poly expr n of p = 
    save x, y;
    z0 = point 0 of p;
    z1 = point 1 of p;
    for i=2 upto n-1:
        z[i] = z[i-2] rotatedabout(z[i-1], 180(2/n-1));
    endfor
    for i=0 upto n-1: z[i] -- endfor cycle
enddef;
vardef polyc expr n of p = 
    save x, y;
    z0 = point 0 of p;
    z1 = point 1 of p;
    for i=2 upto n-1:
        z[i] = z[i-2] rotatedabout(z[i-1], 180(2/n-1));
    endfor
    for i=0 upto n-1: z[i] ... endfor cycle
enddef;

% a polygon of n sides of a given length
vardef polya(expr n, s) = 
    save r, x, y; numeric r, x, y;
    (x, y) = dir (180/n);
    2r = s * x / y;
    for i=0 upto n-1:
        (left * s/2) shifted (r * down) rotated (360 / n * i) --
    endfor cycle
enddef;
vardef median(expr P) = 
    (origin for i=1 upto length P: + point i of P endfor) / length P
enddef;

