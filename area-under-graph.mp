prologues:=3;outputtemplate:="%j%c.eps";
beginfig(1);
path xx, yy, f;
u = 1cm;
xx = (1/4 left -- 17/4 right) scaled u;
yy = (1/4 down -- 9/4 up)    scaled u;

s = 1/8;
f = ( (15/32,32/15) for x = 1/2 step s until 33/8: .. (x,1/x) endfor) scaled u;

path A;
A = buildcycle(yy shifted (1u,0), f, yy shifted (2.71828u,0), xx);
fill A withcolor .9[blue,white];
drawoptions(withcolor .8 white);
for x=1 upto 4: draw yy shifted (x*u,0) cutafter (xx shifted (0, ypart point 0 of f)); endfor
for y=1 upto 2: draw xx shifted (0,y*u) cutafter (yy shifted (xpart point infinity of f,0)); endfor
drawoptions();


draw f withcolor .67 red;
drawarrow xx;
drawarrow yy;


endfig;
end

