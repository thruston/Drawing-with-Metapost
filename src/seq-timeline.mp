\documentclass{standalone}
\usepackage{unicode-math}
\setmainfont{Fira Math}
\setmathfont{Fira Math}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef make_marks(text t) = 
  save w; pair w;
  for @=t:
    w := ((scantokens(@)) * u, 0);
    draw (down--up) scaled 3 shifted w withpen pencircle scaled 1;
    label.bot("\strut$" & @ & "$", w + 3 down);
  endfor
enddef;

vardef brace(expr a, m, b) = 
  save d; numeric d; 2d = ypart (m - a); 
  a {0,d} .. a + (abs(d),d) -- 
  m - (abs(d),d) .. {0,d} m {0,-d} ..  m + (abs(d),-d) 
  -- b - (abs(d),-d) .. {0,-d} b
enddef;

beginfig(1);
  numeric u, x; u = 30; x = -23/31;
  % Annotations
  label.bot("Pre-issue period", ((x-3.5)*u, -36));
  draw brace(((x-6)*u, -20), ((x-3.5)*u, -36), ((x-1)*u, -20));
  label.bot("Post-issue period", (3.5u, -36));
  draw brace((u, -20), (3.5u, -36), (6u, -20));
  label.bot("Issue", (0, -36)); draw (0, -36) -- (0, -20);
  label.bot("Announcement", (x*u, -52)); draw (x*u, -52) -- (x*u, -20);
  label.top(btex \begin{tabular}{c}
  Some long text that needs\\
  something on the second line
  \end{tabular} etex, (3u, 24)) withcolor 1/2 red;
  draw brace((0, 10), (3u, 24), (6u, 10)) withcolor 2/3 blue;
  % base arrow with scale
  drawarrow (8 left -- 7 right) scaled u withpen pencircle scaled 1;
  label.bot("\strut Months", (7u, -3));
  make_marks("x-6", "x-1", "x", "0", "+1", "+6");
endfig;
\end{mplibcode}
\end{document}
