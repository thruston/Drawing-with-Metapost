% procedures for tiling-ammann-* drawings

input colorbrewer-rgb

def withalpha expr a = 
  withprescript "tr_alternative=2"
  withprescript "tr_transparency=" & decimal a
enddef;

path r, s;
r = origin -- (1/2, 1/2-sqrt(1/2)) -- right -- (1/2, sqrt(1/2)-1/2) -- cycle;
s = origin -- (1/2, -1/2) -- right -- (1/2, 1/2) -- cycle;
numeric p, q; 
p = sqrt(2) - 1; q = 1 - sqrt(1/2);
vardef rhomb(expr level, a, b) = 
  save R; path R; R = r zscaled (b-a) shifted a;
  if level = 0:
    fill subpath (0, 2) of R -- cycle withalpha 0.9 withcolor Blues 9 3;
    fill subpath (2, 4) of R -- cycle withalpha 0.9 withcolor Blues 9 4;
    draw R withcolor 1/2;
  else:
    rhomb(level-1, a, p[a,b]);
    rhomb(level-1, b, p[b,a]);
    rhomb(level-1, point 1 of R, point 3 of R);
    square(level-1, point 1 of R, point +p of R);
    square(level-1, point 3 of R, point -p of R);
    square(level-1, point 1 of R, point 2-p of R);
    square(level-1, point 3 of R, point 2+p of R);
  fi
enddef;
vardef square(expr level, a, b) = 
  save S; path S; S = s zscaled (b-a) shifted a;
  if level = 0:
    fill subpath (0, 2) of S -- cycle withalpha 0.9 withcolor Oranges 8 3;
    fill subpath (2, 4) of S -- cycle withalpha 0.9 withcolor Oranges 8 2;
    draw S withcolor 1/2;
  else:
    rhomb(level-1, a, q[point 1 of S, point 3 of S]);
    rhomb(level-1, a, q[point 3 of S, point 1 of S]);
    rhomb(level-1, point 1 of S, q[b,a]);
    rhomb(level-1, point 3 of S, q[b,a]);
    square(level-1, q[b,a], q[a,b]);
    square(level-1, point 1 of S, point +p of S);
    square(level-1, point 3 of S, point -p of S);
    square(level-1, b, point +1+p of S);
    square(level-1, b, point -1-p of S);
  fi
enddef;

path t[];
t0 = origin -- right -- point 3 of s -- cycle;
t1 = origin -- right -- point 1 of s -- cycle;
vardef bounded_rhomb(expr level, a, b) = 
  save R; path R; R = r zscaled (b-a) shifted a;
  if level = 0:
    fill subpath (0, 2) of R -- cycle withcolor Blues 9 4;
    fill subpath (2, 4) of R -- cycle withcolor Blues 9 5;
    draw R withcolor 1/2;
  else:
    bounded_rhomb(level-1, a, p[a,b]);
    bounded_rhomb(level-1, b, p[b,a]);
    bounded_rhomb(level-1, point 1 of R, point 3 of R);
    half_square(level-1, point 1 of R, point +p of R, 1);
    half_square(level-1, point 3 of R, point -p of R, 0);
    half_square(level-1, point 3 of R, point 2+p of R, 1);
    half_square(level-1, point 1 of R, point 2-p of R, 0);
  fi
enddef;
vardef half_square(expr level, a, b, side) = 
  save T; path T; T = t[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withalpha 0.9 withcolor Oranges[8][3+side];
    draw subpath (1, 3) of T withcolor 1/2;
  else:
    bounded_rhomb(level-1, point 0 of T, p[point 1/2 of T, point 2 of T]); 
    bounded_rhomb(level-1, point 2 of T, point sqrt(1/2) of T);  
    half_square(level-1, point 1 of T, point 2-p of T, side);
    half_square(level-1, point 2 of T, point 3-p of T, side);
    half_square(level-1, point 1-q of T, point q of T, 1-side);
  fi
enddef;
