\documentclass{standalone}
\usepackage{fontspec}
\setmainfont[Numbers=OldStyle]{TeX Gyre Pagella}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
numeric i, deaths[], ymax, dmax; i = 0; dmax = 0;
for n = 1,0,2,0,0,2,0,0,
        1,0,1,2,3,70,127,
        76,71,45,37,32,30,24,
        18,15,6,13,6,8,6,
        5,2,3,0,0,2,3,
        0,0,2,0,2,1,0:
  deaths[incr i] = n;
  if n > dmax:
    dmax := n;
  fi
endfor
ymax = 20 * ceiling (dmax / 20);
numeric i, day_number[]; i = 0;
for n = 19,
        20,21,22,23,24,25,26,
        27,28,29,30,31, 1, 2,
         3, 4, 5, 6, 7, 8, 9,
        10,11,12,13,14,15,16,
        17,18,19,20,21,22,23,
        24,25,26,27,28,29,30:
  day_number[incr i] = n;
endfor
numeric days; days = i;
numeric u, v; days * u = 5in = ymax * 2v;

path xx, yy;
xx = origin -- (days * u, 0);
yy = origin -- (0, dmax * v);

beginfig(1);
  background := 1/32(32, 32, 31);
  for x = 1 upto days:
    cutdraw (x * u, 0) -- (x * u, deaths[x] * v) 
      withpen pencircle scaled 2 
      withcolor 5/8[2/3 red, white];
    draw (origin -- 2 down) shifted (x * u, 0);
    if x mod 7 = 2:
      label.bot("\small" & decimal day_number[x], (x * u, -2));
    fi
    if x = 1:
      label.lrt("\small August", (x * u + 1, -12));
    elseif x = 15:
      label.lrt("\small September", (x * u + 1/2 u, -12));
    fi
  endfor
  for y = 10 step 10 until ymax:
    draw (origin -- 2 left) shifted (0, y * v);
    undraw xx shifted (0, y * v) withpen pencircle scaled 1/2;
    if y mod 20 = 0:
      label.lft(decimal y, (-2, y * v));
    fi
  endfor
draw xx; draw yy;

label.lrt(btex \vbox{\openup 0pt\halign{#\hss\cr
  Deaths from\cr cholera, each\cr day during\cr the epidemic\cr
}} etex, (u, ymax * v + 6));

z0 = (21u, deaths[21] * v ) shifted 2 up;
z1 = z0 shifted (13, 34);
draw z0 -- z1 withpen pencircle scaled 1/4;
label.urt(btex \vbox{\openup 0pt\halign{#\hss\cr
 Handle removed from\cr
 the Broad Street pump,\cr 
 Friday 8 September 1854\cr
}} etex, z1 shifted 17 left);

picture p; p = currentpicture; currentpicture := nullpicture;
bboxmargin := 8;
fill bbox p withcolor background; 
draw p;
label.lrt("\tiny\texttt{Source: tufte-snow.mp}", llcorner currentpicture);
% input ruler-inch
endfig;
\end{mplibcode}
\end{document}

