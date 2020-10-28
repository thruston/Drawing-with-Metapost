prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);
 
vardef acosd(expr a) = angle (a,1+-+a) enddef;
vardef asind(expr a) = angle (1+-+a,a) enddef;

theta = 30;

show acosd(.8);
show asind(.6);

show xpart dir theta;
show ypart dir theta;
show cosd(theta);
show sind(theta);



endfig; end.


