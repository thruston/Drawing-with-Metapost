numeric r, pi;
r = 1.25cm; % radius of the wheel
pi = 3.14159265; % constant
%
% define the cycloid
path c; 
c = (0,-r) rotated 100 shifted (r*-100/180*pi,r) 
    for t=-99 upto 460: 
      -- (0,-r) rotated -t shifted (r*t/180*pi,r) 
    endfor;
% and the axes
drawoptions(withcolor .5 white);
path xx, yy;
yy = (down -- 5 up) scaled 1/2 r;
xx = (xpart point 0 of c, 0) -- (xpart point infinity of c,0);
draw fullcircle scaled 1/4r; drawarrow xx; drawarrow yy;
drawoptions();
label.rt (btex $x$ etex, point 1 of xx);
label.top(btex $y$ etex, point 1 of yy);
% draw the cycloid on top of the axes
draw c withcolor .67 red;

% define a couple of related points: 
% z1 center of the blue wheel
% z2 intersection of rim and cycloid
t = 84; % if you change t then the wheel will "roll" along...
z1 = (r*t/180*pi,r);
z2 = (0,-r) rotated -t shifted z1;

% draw the auxiliary lines
draw (0,y2) -- z2 -- (x2,0) dashed withdots scaled .6;
draw z2 -- z1 -- (x1,0);

% draw the rolling circle 
draw fullcircle scaled 2r shifted z1 withcolor .67 blue;
% mark the centre and intersection with cycloid
fill fullcircle scaled dotlabeldiam shifted z1; 
fill fullcircle scaled dotlabeldiam shifted z2;

% some arc arrows and labels
path a[];
z3 = (x1,5/12y1); 
a1 = z3 {left} .. {left rotatedabout(z1,-t)} z3 rotatedabout(z1,-t);
drawarrow subpath (.05,.95) of a1;
label.llft(btex $\theta$ etex, point .5 of a1);

a2 = subpath (0,1) of reverse quartercircle scaled 2.2r shifted z1;
drawarrow a2 rotatedabout(z1,-100);
drawarrow a2 rotatedabout(z1,80);

% finally all the other labels
label.top(btex $r$ etex, .5[z1,z2]);
label.lft(btex $y$ etex, (0,y2));
% give all the x-axis labels a common baseline with mathstrut
label.bot(btex $\mathstrut x$ etex, (x2,0));
label.bot(btex $\mathstrut r\theta$ etex, (x1,0));
label.bot(btex $\mathstrut 2\pi r$ etex, (r*2pi,0));
% notice how nicely the coordinates work...
dotlabel.top(btex $(\pi r,2r)$ etex, (pi*r,2r));
% and a little alignment to finish
label(btex $\vcenter{\halign{&$#$\hfil\cr 
x=r(\theta-\sin\theta)\cr 
y=r(1-\cos\theta)\cr}}$ etex,(4.2r,r));
