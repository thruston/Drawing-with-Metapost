prologues := 3;
outputtemplate := "%j%c.mps";

beginfig(0);
  % unit
  u := 1cm;
  
  % axes
  path xx, yy;
  xx = (origin -- 5 right) scaled u;
  yy = xx rotated 90;
  drawarrow xx; label.rt (btex $x$ etex, point 1 of xx);
  drawarrow yy; label.top(btex $y$ etex, point 1 of yy);

  % parameters, assuming y=a+bx  
  a = 0.6u; 
  b = 0.7;
  x_mean = 2.7u;

  % the regression line, and the normal curves
  path lm, Z, Zx, Zy;
  lm = (0,a) -- (5u,a+b*5u);

  % the regression mean point
  z0 = (x_mean, a+b*x_mean);

  % scale is arbitrary, so you only need the core of the probability distribution, 
  % and so the "3" is just to make it look nice
  Z  = ((-4,0) for x = -3.9 step .1 until 4: .. (x, 3 mexp(-128*(x**2))) endfor) scaled 1/2 u;
  
  margin = -2u;
  % for the x-axis you just want a copy of Z shifted down and across
  Zx = Z shifted (x0,margin);

  % for the y-axis you can make it more realistic if you scale it by the regression coefficient 
  % before you rotate it and shift it
  Zy = Z xscaled b rotated -90 shifted (margin,y0);
   
  % put in the lines connecting the measurements to the response
  alpha = 1.96 * 1/2 u;
  for i=-1 upto 1:
    draw (x0+(i*alpha),margin) -- (x0+(i*alpha),y0+(i*b*alpha)) -- (margin,y0+(i*b*alpha)) 
         cutbefore Zx cutafter Zy
         dashed if i=0: evenly else: withdots scaled 0.6 fi;
  endfor 

  % draw the lm line and the normal curves and then label them
  draw lm withcolor .67 red;
  draw Zx;
  draw Zy;

  label.bot(btex Measured value ($x$) etex, (x0,margin));
  label.lft(btex Response value ($y$) etex rotated 90, (margin,y0));
  label.top(btex $y=a+bx$ etex, point 1 of lm);

endfig;


stp = 2.50662827463;
vardef gauss(expr mu,sigma,x) = 
   if abs(x-mu) < 4sigma:
     mexp(-128*(((x-mu)/sigma)**2))/stp/sigma
   else: 
     0 
   fi 
   enddef;

vardef gauss_curve(expr mu, sigma, a, b, s) = 
  (a,gauss(mu,sigma,a)) for x=a+s step s until b: .. (x,gauss(mu,sigma,x)) endfor
  enddef;

vardef Z = (-4,0) for x = -3.9 step .1 until 4: .. (x,mexp(-128*(x**2))/2.50663) endfor enddef;

beginfig(1);

path xax, yax;
xax = origin -- right scaled 10cm;
yax = origin -- up    scaled  6cm;

path alpha, beta; 
alpha = gauss_curve(5.0,2/3,2.0, 8.0,.1) xscaled 1cm yscaled 2cm;
beta  = gauss_curve(7.2,1/2,6.2, 8.2,.1) xscaled 1cm yscaled 2cm;

path boundary;

boundary = ( origin -- 50 up ) shifted (7.7cm,0);

%path rr; rr = buildcycle(boundary, alpha, reverse xax);

%fill rr withcolor .64 blue + .6 white;

draw alpha slanted 1 rotated 40 withcolor .64 blue;
draw (origin--right) scaled 8cm rotated 40 shifted 10 right;
beta := Z xscaled (1cm*(1/2)) yscaled (2cm/(1/2)) shifted (7.2cm,0);
fill buildcycle(xax, beta, boundary) withcolor .3[white,red];
draw beta  withcolor .64 red;

draw boundary withpen pencircle scaled .2 ;

drawarrow xax; 
drawarrow yax;

endfig;

beginfig(2);

path xx, yy;
u := 1.6mm; v := 0.1mm;
transform t; t = identity rotated -35;
xx = origin -- (50u,0);
yy = origin -- (0,500v) transformed t;

drawarrow xx; drawarrow yy; 
label.rt (btex $x$ etex, point infinity of xx);
label.top(btex $y$ etex, point infinity of yy);

for x=10 step 10 until 40: 
  draw yy shifted (x*u,0) withcolor .8 white;
  draw (up--down) transformed t shifted (x*u,0);
  label.bot(decimal x, (x*u,0));
  endfor

for y=100 step 100 until 400:
  draw xx shifted ((0,y*v) transformed t) withcolor .8 white;
  draw (left--right) shifted ((0,y*v) transformed t);
  label.lft(decimal y,        (0,y*v) transformed t);
  endfor

path fit; fit = (0,225v) transformed t shifted (5u,0)  
             -- (0,425v) transformed t shifted (45u,0);

draw fit withcolor .67 red;

for x=10,20,40:
  draw gauss_curve(0,1,-2.5,+2.5,.1) slanted 3.6 rotated 90 xscaled 30 yscaled 10
       transformed t
       shifted ((0,(200+5x)*v) transformed t) shifted (x*u,0)
       withcolor .6 white + .2 red;

   draw (origin -- 20 up) 
       shifted ((0,(200+5x)*v) transformed t) shifted (x*u,0)
       withcolor .6 white + .2 red;
endfor
endfig;
beginfig(3);
  path A, B, C, xx,yy, curve;
  curve = Z xscaled 1cm yscaled 5cm;
  xx = (left--right) scaled 4.5cm;
  yy = (down--up)    scaled 4.5cm;
  A = buildcycle(xx, yy shifted (1cm,0), reverse curve, yy shifted (-1cm,0));
  B = buildcycle(xx, yy shifted (2cm,0), reverse curve, yy shifted (-2cm,0));
  fill B withcolor .95[red,white];
  fill A withcolor .68[red,white];
  draw curve withcolor .67 red;
  draw xx withcolor .5 white;
  for i=-4 upto 4: 
    draw (origin--down) scaled 4 shifted (i*cm,0) withcolor .5 white; 
    write "label(btex \hbox to 5pt{\hss$" & decimal i & "$} etex scaled 0.8,(" & decimal i & "cm,-9));" to ".mplabels";
  endfor
  write EOF to ".mplabels";
  input .mplabels;
  label.top(btex $68\%$ etex, center A);
  path vc, ic;
  vc = (left--right) scaled 2cm shifted 6 up;
  ic = (left--right) scaled 3cm shifted 18 down;
  ahangle := 30;
  drawdblarrow vc; 
  drawdblarrow ic; 
  picture l[]; 
  l1 = thelabel(btex $95\%$ etex scaled 0.8, point 1/2 of vc);
  l2 = thelabel(btex $99\%$ etex scaled 0.7, point 1/2 of ic);
  fill bbox l1 withcolor .68[red,white]; draw l1;
  unfill bbox l2; draw l2;
endfig;
end.

