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

vardef half_thick(expr level, a, b, side) = 
  save T; path T; T = wide[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withcolor Purples[9][2+2side];
    draw subpath (1, 3) of T;
  else:
    half_thick(level - 1, point phi of T, point 0 of T, 1-side);
    half_thick(level - 1, point 1 of T, point 2 of T, side);
    half_thin(level - 1, point 2 of T, point -phi of T, side);
  fi
enddef;

vardef half_thin(expr level, a, b, side) = 
  save T; path T; T = tall[side] zscaled (b-a) shifted a;
  if level = 0:
    fill T withcolor Blues[9][2+2side];
    draw subpath (1, 3) of T;
  else:
    half_thick(level - 1, point 0 of T, point 2 of T, 1-side);
    half_thin(level - 1, point 1 of T, point 2-phi of T, side);
  fi
enddef;

picture thin, thick, P[];

pair a, b; a = -b = 13 down;
thin = image(
  half_thin(0, a, b, 0);
  half_thin(0, a, b, 1);
  label.bot("Thin", 42 down); undraw 28 up;
);

for s=0, 1:
  P[1+s] = image(
    half_thin(0, a, b, s); 
    dotlabel.bot("$a$", a); 
    dotlabel.top("$b$", b);
    label("$" & decimal s & "$", (17 * (2s-1), 0));
  );
  P[3+s] = image(half_thin(1, a, b, s));
endfor

P5 = image(
  begingroup; interim labeloffset := 8; save arr;
  path arr; arr = 21 up -- 21 down; drawarrow arr;
  label.ulft(P1, point 0 of arr); label.urt(P2, point 0 of arr);
  label.llft(P3, point 1 of arr); label.lrt(P4, point 1 of arr);
  endgroup;
);

pair a, b; a = -b = 28 down;
thick = image(
  half_thick(0, a, b, 0);
  half_thick(0, a, b, 1);
  label.bot("Thick", 42 down);
);

for s=0, 1:
  P[6+s] = image(
    half_thick(0, a, b, s); 
    dotlabel.bot("$a$", a); 
    dotlabel.top("$b$", b);
    label("$" & decimal s & "$", (11 * (2s-1), 0));
  );
  P[8+s] = image(half_thick(1, a, b, s));
endfor

P10 = image(
  begingroup; interim labeloffset := 8; save arr;
  path arr; arr = 8 up -- 8 down; drawarrow arr;
  label.ulft(P6, point 0 of arr); label.urt(P7, point 0 of arr);
  label.llft(P8, point 1 of arr); label.lrt(P9, point 1 of arr);
  endgroup;
);

beginfig(1);
  label(thin, 53 left);  label(P5, 132 left);
  label(thick, 53 right); label(P10, 132 right);
endfig;
\end{mplibcode}
\end{document}

