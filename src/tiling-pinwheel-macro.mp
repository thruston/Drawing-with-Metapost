input colorbrewer-rgb
vardef pinwheel(expr level, a, b, c, s) = 
  if level = 0:
    fill a--b--c--cycle withcolor s;
    draw a--b--c--cycle;
  else:
    save d, e, f, g; pair d, e, f, g; 
    d = 1/2[a,b]; e = 1/5[c,b]; f = 1/2[a,e]; g = 1/2[b,e];
    pinwheel(level - 1, f, d, e, Blues 9 2);
    pinwheel(level - 1, f, d, a, Blues 9 3);
    pinwheel(level - 1, e, a, c, Blues 9 4);
    pinwheel(level - 1, g, e, d, Blues 9 5);
    pinwheel(level - 1, g, b, d, Blues 9 6);
  fi
enddef;
