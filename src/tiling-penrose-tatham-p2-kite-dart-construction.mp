\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

input colorbrewer-rgb

numeric phi; phi = 0.61803398875;

path wide[], tall[];  
wide0 = origin -- right -- phi * dir 36 -- cycle; 
wide1 = origin -- right -- phi * dir -36 -- cycle; 
tall0 = origin -- right -- (1+phi) * dir 72 -- cycle;
tall1 = origin -- right -- (1+phi) * dir -72 -- cycle;

vardef half_dart(expr level, a, b, side) = 
  save T; path T; T = wide[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withcolor Purples[9][3+side];
    draw subpath (0, 2) of T;
  else:
    half_dart(level - 1, point 1 of T, point   2 of T, side);
    half_kite(level - 1, point 2 of T, point phi of T, 1-side);
  fi
enddef;

vardef half_kite(expr level, a, b, side) = 
  save T; path T; T = tall[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withcolor Blues[9][2+side];
    draw subpath (0, 2) of T;
  else:
    half_dart(level - 1, point 2     of T, point 2+phi of T, side);
    half_kite(level - 1, point 2+phi of T, point 0     of T, side);
    half_kite(level - 1, point 2+phi of T, point 1+phi of T, 1-side);
  fi
enddef;

beginfig(1);

  picture kite, dart, P[];

  kite = image(
    half_kite(0, origin, 34 dir 198, 0);
    half_kite(0, origin, 34 dir -18, 1);
    label.bot("Kite", 55 down);
  );

  dart = image(
    half_dart(0, origin, 55 dir 234, 0); 
    half_dart(0, origin, 55 dir 306, 1);
    currentpicture := currentpicture shifted 4 down;
    undraw origin;
    label.bot("Dart", 55 down);
  );


  pickup pencircle scaled 1/4;

  pair a, b; a = origin; b = 21 dir 198;
  P1 = image(half_kite(0, a, b, 0); dotlabel.ulft("$a$", a); dotlabel.ulft("$b$", b));
  P2 = image(half_kite(1, a, b, 0));

  b := b reflectedabout(up, down);
  P3 = image(half_kite(0, a, b, 1); dotlabel.urt("$a$", a); dotlabel.urt("$b$", b));
  P4 = image(half_kite(1, a, b, 1));
  P5 = image(begingroup; save arr; path arr; arr = (up--down) scaled 12;
    drawarrow arr;
    interim labeloffset := 8;
    label.ulft(P1, point 0 of arr); label.urt(P3, point 0 of arr);
    label.llft(P2, point 1 of arr); label.lrt(P4, point 1 of arr);
  endgroup);

  b := 34 dir 234;
  P6 = image(half_dart(0, a, b, 0); dotlabel.ulft("$a$", a); dotlabel.ulft("$b$", b));
  P7 = image(half_dart(1, a, b, 0));

  b := b reflectedabout(up, down);
  P8 = image(half_dart(0, a, b, 1); dotlabel.urt("$a$", a); dotlabel.urt("$b$", b));
  P9 = image(half_dart(1, a, b, 1));
  P10 = image(begingroup; save arr; path arr; arr = (up--down) scaled 12;
    drawarrow arr;
    interim labeloffset := 8;
    label.ulft(P6, point 0 of arr); label.urt(P8, point 0 of arr);
    label.llft(P7, point 1 of arr); label.lrt(P9, point 1 of arr);
  endgroup);

  label(kite, 42 left);
  label(dart, 42 right);
  label(P5, 134 left);
  label(P10, 134 right);
endfig;
\end{mplibcode}
\end{document}

