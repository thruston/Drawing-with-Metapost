numeric pi;
% approximate value
pi := 3.14159;
% measure round a circular arc...
pi := 1/4 arclength (quartercircle scaled 16);
% up to 32 digits of precision
pi := 3.1415926535897932384626433832795;
% as many digits as are needed...
vardef getpi =
  save lasts, t, s, n, na, d, da;
  lasts=0; s=t=3; n=1; na=0; d=0; da=24;
  forever:
    exitif lasts=s;
    lasts := s;
    n := n+na; na := na+8;
    d := d+da; da := da+32;
    t := t*n/d;
    s := s+t;
  endfor
  s
enddef;
pi := getpi;

% conversions
def degrees(expr theta) = theta / pi * 180 enddef;
def radians(expr theta) = theta / 180 * pi enddef;
% trig functions that expect radians
def sin(expr theta) = sind(degrees(theta)) enddef;
def cos(expr theta) = cosd(degrees(theta)) enddef;
% inverse trig functions
def acosd(expr a) = angle (a,1+-+a) enddef;
def asind(expr a) = angle (1+-+a,a) enddef;
def acos(expr a) = radians(acosd(a)) enddef;
def asin(expr a) = radians(asind(a)) enddef;
% tangents
vardef tand(expr theta) = save x,y; (x,y)=dir theta; y/x enddef;
def atand(expr a) = angle (1,a) enddef;


% tests - run with plain `mpost` and scaled numebr system
show pi = 3.14159;
show abs(degrees(1) - 57.29577951308232) < 2 eps;
show radians(90) = 1/2 pi;
show sin(1)**2 + cos(1)**2 = 1;
show abs(acosd(1/2) - 60) < eps;
show abs(asind(1/2) - 30) < eps;
show tand(45) = 1;
show atand(1) = 45;
end
