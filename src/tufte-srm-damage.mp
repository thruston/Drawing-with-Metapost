\documentclass{standalone}
\usepackage{fontspec}
\setmainfont[Numbers=OldStyle]{TeX Gyre Pagella}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

% 1985-01-24  51-C  53°  11
% 1984-02-03  41-B  57°   4
% 1986-01-12  61-C  58°   4
% 1984-04-06  41-C  63°   2
% 1981-04-12  1     66°   0
% 1983-04-04  6     67°   0
% 1984-11-08  51-A  67°   0
% 1985-04-12  51-D  67°   0
% 1982-11-11  5     68°   0
% 1982-03-22  3     69°   0
% 1981-11-12  2     70°   4
% 1983-11-28  9     70°   0
% 1984-08-30  41-D  70°   4
% 1985-06-17  51-G  70°   0
% 1983-06-18  7     72°   0
% 1983-08-30  8     73°   0
% 1985-04-29  51-B  75°   0
% 1985-10-30  61-A  75°   4
% 1985-08-27  51-I  76°   0
% 1985-11-26  61-B  76°   0
% 1984-10-05  41-G  78°   0
% 1985-10-03  51-J  79°   0
% 1982-06-27  4     80°   ?
% 1985-07-29  51-F  81°   0

numeric r; r = 1/5;  % adjustment of the marks where required...
path damage; damage = origin ..
(53, 11)..
(57, 4)..
(58, 4)..
(63, 2)..
(66, 0)..
(67, 0 + 2r)..
(67, 0)..
(67, 0 - 2r)..
(68, 0)..
(69, 0)..
(70, 4 + r)..
(70, 0 + r)..
(70, 4 - r)..
(70, 0 - r)..
(72, 0)..
(73, 0)..
(75, 0)..
(75, 4)..
(76, 0 + r)..
(76, 0 - r)..
(78, 0)..
(79, 0)..
(81, 0);

input tufte-manila-paper
beginfig(1);
  numeric u, v; u = 10.8; 5u = 4v; 
  damage := damage xscaled u yscaled v;

  path xx, yy;
  xx = (25u, 0) -- (85u, 0);
  yy = (0, 0) -- (0, 12v);

  for y = 0, 4, 8, 12:
    draw xx shifted (0, y * v) withpen pencircle scaled 1/4 withcolor 3/4;
    label.lft(decimal y, (25u - 4, y * v));
    label.rt (decimal y, (85u + 4, y * v));
  endfor
  for x = 25 step 5 until 85:
    draw yy shifted (x * u, 0) withpen pencircle scaled 1/4 withcolor 3/4;
    label(decimal x & "°", (x * u, -16));
  endfor

  for i = 1 upto length damage:
    draw point i of damage 
      withpen pencircle scaled (3/2 r * v)
      withcolor 2/3 red;
  endfor

  labeloffset := 8;
  label.bot("\small SRM 15", point 1 of damage);
  label.urt("\small SRM 22", point 18 of damage);

  fill unitsquare shifted -(1/2, 1/2) xscaled 3.9u yscaled 3/8v
    shifted (27.5u, 0)
    withcolor 3/4[blue, white];

  z0 = (27.5u, 0v); z1 = (31u, 3v);

  ahlength := 2; ahangle := 30; 
  drawarrow z1 -- z0 cutafter xx shifted (0, 1/2 v)
    withpen pencircle scaled 1/4 ;

  label.rt(btex \vbox to 0pt{\vskip-6pt\openup 0pt\halign{\small #\hss\cr
    26°–29° range of forecast temperatures\cr
    (as of 27 January 1986) for the launch\cr
    of space shuttle Challenger on 28 January\cr
  }\vss} etex, z1 shifted 2 left);

  label.rt(btex \vbox to 0pt{\openup 2pt\halign{#\hss\cr
    O-ring damage index,\cr
    for each launch\cr
  }\vss} etex, (23u, 14.4v));

undraw point 1 of bbox currentpicture shifted 2 down;
input show_name
endfig;
\end{mplibcode}
\end{document}

