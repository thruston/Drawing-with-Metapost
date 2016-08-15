prologues:=3;outputtemplate:="%j%c.mps";
beginfig(1);

path D;

D = for t=0 upto 11: right scaled 100 rotated 30t -- endfor cycle;

draw D;

for t=1 upto 12: 
   draw origin -- point t of D; 
   draw origin -- point t of D rotatedabout(point t-1 of D, 60);
   draw point t-1 of D -- point t of D rotatedabout(point t-1 of D, 60) -- point t of D;

endfor

endfig;

color c[];
c[0] = (1,0.96863,0.73725);
c[1] = (0.99608,0.76863,0.3098);
c[2] = 1/3[white,(0.85098,0.37255,0.054902)];


beginfig(2);

path et, ut, dt;
picture ET, UT, DT;

u = 100;
et = (origin -- (u,0) -- (u,0) rotated 60 -- cycle)
     rotated -15 shifted ((u,0) rotated 15);
ut = origin -- subpath(1,0) of et -- cycle;
dt = origin -- subpath(3,2) of et -- cycle;

ET = image(fill et withcolor c[2]; draw et);
UT = image(fill ut withcolor c[1]; draw ut);
DT = image(fill dt withcolor c[0]; draw dt);

picture A, B, Q;
A = image(
for t=0 upto 11:
   draw ET rotated 30t;     
   draw UT rotated 30t;     
   draw DT rotated 30t;     
endfor);

Q = image(
draw ET rotated 30 reflectedabout(point 1 of et rotated 30,
                                  point 2 of et rotated 30);
draw UT rotated  90 shifted point 1 of et;
draw DT rotated -30 shifted (point 2 of dt rotated 60);
);
B = image(
for t=0 upto 8:
   draw ET rotated 30t;     
   draw UT rotated 30t;     
   draw DT rotated 30t;     
endfor
for t=0 upto 2:
   draw Q rotated 90t;
endfor

);

draw A;
draw B shifted (4.2u,0);

endfig;
end

