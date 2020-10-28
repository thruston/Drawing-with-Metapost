prologues := 3;
outputtemplate := "%j%c.eps";

vardef tangent_points(expr C, p) = 
  save x,y, r,h, theta, phi, a, b;
  z0 = center C;
  z1 = point 0 of C; 
  r = abs (z1-z0);
  h = abs (p-z0);
  if r>h:
    (0,4)
  else:
    theta = angle (p-z0) - angle (z1-z0);
    phi = angle (r/h,1+-+r/h);
    a = ((theta+phi) mod 360)/45;
    b = ((theta-phi) mod 360)/45;
    (a,b)
  fi
enddef;


beginfig(1);


    path C[];

    C1 = fullcircle scaled 200;
    C2 = fullcircle scaled 80 shifted 220 dir 20;

    numeric s[], r[], d, t;

    d = abs(center C1 - center C2);
    r1 = 1/2 abs(point 0 of C1 - point 4 of C1);
    r2 = 1/2 abs(point 0 of C2 - point 4 of C2);
    t = (r2-r1)*(r2+r1)/2d/d;
    show r1, r2, d, t;

    path axis, pole;
    axis = center C1 -- center C2;
    pole = axis rotatedabout(point 1/2 of axis, 90) 
           shifted - point 1/2 of axis
           shifted point 1/2 - (r2-r1)*(r2+r1)/2d/d of axis;

    numeric a, b, c, d;
    (a,b) = tangent_points(C1, point 0 of pole);
    (c,d) = tangent_points(C2, point 0 of pole);
    draw point a of C1 -- point 0 of pole -- point b of C1 withcolor 1/2 white;;
    draw point c of C2 -- point 0 of pole -- point d of C2 withcolor 1/2 white;;


    draw axis;
    draw pole withcolor red;

    draw C1;
    draw C2;



endfig;
end.

