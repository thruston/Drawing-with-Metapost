prologues := 3;
outputtemplate := "%j%c.eps";

vardef invert_point(expr p, k) = 
  if abs(p)>0:
    unitvector p scaled (k/abs(p)) scaled k
  else:
    origin
  fi
enddef;

vardef invert_path(expr P, k) = 
  for t=0 step 1/16 until length P-1/16:
     invert_point(point t of P, k) --
  endfor
  if cycle P:
     cycle
  else:
     invert_point(point infinity of P, k)
  fi
enddef;

vardef invert(expr P, C) = 
    save o, r; pair o; numeric r;
    o = 1/2[point 0 of C, point 4 of C];
    r = abs (o - point 0 of C);
    if pair P:
        invert_point(P, o, r)
    elseif path P:
        for t=0 upto 31: 
            invert_point(point t/32 * length P of P, o, r) .. 
        endfor
        if cycle P: cycle else: invert_point(point infinity of P, o, r) fi
    fi
enddef;  

vardef invert_point(expr P, o, r) = 
    save p, d; pair p; numeric d;
    p = P - o; d = abs p;
    if d > 0:
        o + unitvector p scaled (r/d*r) 
    else:
        errmessage("Inversion undefined at center.")
    fi
enddef;

vardef pole(expr Line, Circle) = 
    save p, o, r; pair o, p; numeric r;
    o = center Circle;
    r = 1/2 abs (point 4 of Circle - point 0 of Circle);
    p = whatever [point 1 of Line, point 0 of Line];
    p - o = whatever * direction 0 of Line rotated 90;
    invert_point(p, o, r)
enddef;


vardef three_point_circle(expr a,b,c) = 
  save m; pair m; 
  m = whatever [a,b] rotatedaround(.5[a,b],90) 
    = whatever [b,c] rotatedaround(.5[b,c],90);
  fullcircle scaled 2 length(m-a) shifted m
  enddef;

beginfig(1);
    path C, CI; pair P, Q;
    path C'; pair Q';

    C = fullcircle scaled 80;
    P = (60, 72);
    Q = (90, -30);

    CI = fullcircle scaled 144 shifted P;


    forsuffixes $=P, Q: dotlabel.rt(str $, $); endfor

    draw CI withcolor 1/2 white;
    fill C withcolor 7/8[blue, white];
    draw C; 

    C' = invert(C, CI);
    Q' = invert(Q, CI);

    z0 = Q' - center C';
    z1 = C' intersectionpoint halfcircle scaled abs z0 rotated angle -z0 shifted 1/2[Q', center C'];
    z2 = C' intersectionpoint halfcircle scaled abs z0 rotated angle +z0 shifted 1/2[Q', center C'];
    path t, t';
    t = 8[z1,Q'] -- 8[Q', z1];
    t' = 8[z2,Q'] -- 8[Q', z2];

    draw t withcolor red;  
    draw invert(t, CI) .. cycle withcolor blue;
    draw invert(t', CI) .. cycle withcolor blue;

    draw C' withcolor red;
    drawdot Q' withpen pencircle scaled 3 withcolor red;

endfig;

beginfig(2);

    path c, ell;
    c = fullcircle scaled 100;

    ell = (left--right) scaled 200 rotated 60 shifted 80 right;

    draw c; draw ell;

    z0 = pole(ell, c);
    z1 = whatever [point 0 of ell, point 1 of ell] = whatever[center c, z0];

    draw invert(ell, c) .. cycle withcolor 1/2[blue, white];

    drawarrow center c -- z1;



    drawdot z0 withpen pencircle scaled dotlabeldiam withcolor red;
    drawdot center c withpen pencircle scaled dotlabeldiam;
    drawdot center c withpen pencircle scaled 3/4dotlabeldiam withcolor white;
endfig;


% beginfig(4);
% path K, C, C';
% pair p, p';
% 
% K = fullcircle scaled 120;
% 
% p = 36 right rotated 22;
% p' = invert(p, K);
% 
% C  = three_point_circle(p, p', point 0 of K);
% C' = three_point_circle(p, p', point 3 of K);
% 
% path ra_mark;
% ra_mark = subpath(1,3) of unitsquare rotated -90 scaled 4;
% drawoptions(withcolor .5 white);
% draw ra_mark shifted point 0 of K;
% draw ra_mark rotated angle direction 3 of K shifted point 3 of K;
% 
% drawoptions(withpen pencircle scaled dotlabeldiam);
% drawdot p;
% drawdot p';
% drawdot origin;
% 
% 
% drawoptions();
% 
% draw K withpen pencircle scaled 1;
% draw C;
% draw C' dashed evenly;
% 
% pair u, v; path t[];
% (whatever,a) = p' intersectiontimes C;
% (whatever,b) = p' intersectiontimes C';
% u = unitvector(direction a of C);
% v = unitvector(direction b of C');
% t1 = (-20v -- 42v) shifted p';
% t2 = (-20u -- 42u) shifted p';
% 
% draw t1; label.urt(btex $T_1$ etex, point 1 of t1);
% draw t2; label.top(btex $T_2$ etex, point 1 of t2);
% 
% endfig;
% 
% beginfig(1);
% 
% path C, C'; 
% pair P, P', Q; 
% 
% k = 150;
% draw subpath (-1.4,1.4) of fullcircle scaled 2k withcolor .8[red,white];
% 
% C = fullcircle scaled 72 shifted 100 right;
% P = point 1 of C;
% C' = invert_path(C, k);
% P' = invert_point(P, k);
% Q = (origin -- P) intersectionpoint subpath (2,4) of C;
% 
% draw origin -- P';
% draw origin -- center C' withcolor .5 white;
% draw P'     -- center C' withcolor .5 white;
% draw Q      -- center C  withcolor .5 white;
% 
% draw C; 
% draw C' withcolor .78 blue; 
% 
% fill fullcircle scaled 3;
% fill fullcircle scaled 3 shifted P;
% fill fullcircle scaled 3 shifted Q;
% fill fullcircle scaled 3 shifted P';
% fill fullcircle scaled 3 shifted center C;
% fill fullcircle scaled 3 shifted center C';
% 
% label(btex $O$  etex, origin + (-6,3));
% label(btex $P$  etex, P      + (+3,7));
% label(btex $P'$ etex, P'     + (-3,7));
% label(btex $Q$  etex, Q      + (-3,7));
% label(btex $C$  etex, point 5.5 of C + (-3,-7));
% 
% endfig;
% 
% 
% 
% 
% beginfig(2);
% 
% k := 80;
% path I;
% pair O, P, P', Q;
% 
% I = fullcircle scaled 2k;
% O = origin;
% P = 132 right;
% P' = invert_point(P,k);
% Q = I intersectionpoint (fullcircle scaled abs(P) shifted 1/2[O,P]); 
% 
% draw I withcolor .8[red,white];
% draw origin -- P -- Q -- cycle withcolor .5 white;
% draw P'--Q dashed evenly withcolor .5 white;
% 
% forsuffixes $=O,P,P',Q: fill fullcircle scaled 3 shifted $; endfor
% 
% 
% endfig;
% 
% beginfig(3);
% numeric u, k;
% u:=5;
% k:=20;
% for x=-2 upto 1:
%   for y=-4 upto 3:
%     fill invert_path(unitsquare scaled u shifted ((2x+y mod 2,y) scaled u),k);
%   endfor
% endfor
% drawdot origin withpen pencircle scaled 4 withcolor red;
% 
% endfig;
% 
% beginfig(5);
% 
%     path c,h;
%     c = fullcircle scaled 2cm shifted (1cm,0);
%     h = fullcircle scaled 8cm shifted (-4cm,0);
% 
%     draw halfcircle scaled 4cm shifted (-2cm,0);
%     
%     draw h withcolor 2/3 red;
%     for i=0 upto 9:
%         draw        c shifted (0,i*2cm);
%         draw invert(c shifted (0,i*2cm),h);
%     endfor
% endfig;
% 
% 
% 
% beginfig(9);
% 
% vardef inversion (expr O,k,M) =
%   if pair M:
%     (O + k*unitvector(M-O)/abs(M-O))
%   elseif path M:
%     for i=0 step length(M)/100 until length(M):
%       inversion(O,k,point i of M) ..
%     endfor
%     cycle
%   fi
% enddef;
% 
%   u:=4cm;
%   path p[],A,B;
% 
%   z0 = (5u,0) rotated 10;
% 
%   A = fullcircle scaled 2u;
%   B = A scaled 3;
%   draw inversion( z0, 2 (u**2), A )
%        withpen pencircle scaled 1pt;
%   draw inversion( z0, 2 (u**2), B )
%        withpen pencircle scaled 1pt;
% 
%   draw A withcolor .67 red;
% 
%   p0 = fullcircle scaled 2u shifted (2u,0);
%   for i=0 upto 5:
%     if i<>0:
%       p[i] = p[i-1] rotated (360/6);
%     fi;
%     draw inversion( z0, 2 (u**2), p[i] );
%   endfor;
% 
% 
% 
% endfig;
end.
