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

path t;
t = origin -- right -- center unitsquare -- cycle;


vardef trig_hi(expr level, a, b) = 
  save T; path T; T = t zscaled (b-a) shifted a;
  if level = 0:
    fill T withalpha 0.9 withcolor Oranges 8 2;
    draw subpath (1, 3) of T withcolor 1/2;
  else:
    bounded_rhomb(level-1, point 0 of T, point q of T);
    bounded_rhomb(level-1, point 2 of T, p[point 1/2 of T, point 2 of T]);
    trig_hi(level-1, point 1 of T, point 2-p of T);
    trig_hi(level-1, point 2 of T, point 3-p of T);
    trig_lo(level-1, point q of T, point 1-q of T);
  fi
enddef;

vardef trig_lo(expr level, a, b) = 
  save T; path T; T = t zscaled (b-a) shifted a;
  if level = 0:
    fill T withalpha 0.9 withcolor Oranges 8 3;
    draw subpath (1, 3) of T withcolor 1/2;
  else:
    bounded_rhomb(level-1, point 1 of T, point 1+p of T);
    bounded_rhomb(level-1, point 2 of T, point 2+p of T);
    trig_lo(level-1, point 1+p of T, point 2 of T);
    trig_lo(level-1, point 2+p of T, point 3 of T);
    trig_hi(level-1, point q of T, point 1-q of T);
  fi
enddef;

vardef bounded_rhomb(expr level, a, b) = 
  save R; path R; R = r zscaled (b-a) shifted a;
  if level = 0:
    fill subpath (0, 2) of R -- cycle withalpha 0.9 withcolor Blues 9 3;
    fill subpath (2, 4) of R -- cycle withalpha 0.9 withcolor Blues 9 4;
    draw R withcolor 1/2;
  else:
    save c, d, e;
    pair c, d, e;
    c = p[a, b];
    d = p[point 2 of R, point 3 of R];
    e = p[point 2 of R, point 0 of R];
    bounded_rhomb(level-1, a, c);
    bounded_rhomb(level-1, b, e);
    bounded_rhomb(level-1, point 2 of R, d);
    trig_lo(level-1, point p of R, point 1 of R);
    trig_hi(level-1, point 1 of R, point 2-p of R);
    trig_lo(level-1, point 2+p of R, point 3 of R);
    trig_hi(level-1, point 3 of R, point 4-p of R);
  fi
enddef;
