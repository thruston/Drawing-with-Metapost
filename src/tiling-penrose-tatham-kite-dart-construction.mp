\documentclass[border=5mm]{standalone}
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

  P0 = image(
    label.lft(kite, 27 left);
    label.rt (dart, 27 right);
  );

  pickup pencircle scaled 1/4;

  P1 = image(
    half_kite(0, origin, 34 dir 198, 0);
    dotlabel.ulft("$a$", origin);
    dotlabel.ulft("$b$", 34 dir 198);
  ) shifted (-5, 68);
  P2 = image(half_kite(1, origin, 34 dir 198, 0)) shifted (-5, -55);

  P3 = image(
    half_kite(0, origin, 34 dir -18, 1);
    dotlabel.urt("$a$", origin);
    dotlabel.urt("$b$", 34 dir -18);
  ) shifted (5, 68);
  P4 = image(half_kite(1, origin, 34 dir -18, 1)) shifted (5, -55);
  P5 = image(
    drawarrow 4 up -- 44 down;
    draw P1; draw P2; draw P3; draw P4;
  );

  P6 = image(half_dart(0, origin, 55 dir 234, 0);
    dotlabel.ulft("$a$", origin);
    dotlabel.ulft("$b$", 55 dir 234);
  ) shifted (-5, 60);
  P7 = image(half_dart(1, origin, 55 dir 234, 0)) shifted (-5, -55);
  P8 = image(half_dart(0, origin, 55 dir 306, 1);
    dotlabel.urt("$a$", origin);
    dotlabel.urt("$b$", 55 dir 306);
  ) shifted (5, 60);
  P9 = image(half_dart(1, origin, 55 dir 306, 1)) shifted (5, -55);
  P10 = image(
    drawarrow 6 up -- 44 down;
    draw P6; draw P7; draw P8; draw P9;
  );

  label(P0, origin);
  label(P5, 134 left);
  label(P10, 134 right);
endfig;
\end{mplibcode}
\end{document}

