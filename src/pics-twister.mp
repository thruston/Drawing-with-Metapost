\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
vardef compass_rose(expr shade, highlight) = image(
  drawoptions(withcolor shade);
    draw thelabel("NW" infont defaultfont scaled 3/4, 64 up) rotated +45;
    draw thelabel("NE" infont defaultfont scaled 3/4, 64 up) rotated -45;
    draw thelabel("SE" infont defaultfont scaled 3/4, 64 down) rotated +45;
    draw thelabel("SW" infont defaultfont scaled 3/4, 64 down) rotated -45;
    draw fullcircle scaled 144 withpen pencircle scaled 2;
    for r = 53, 54, 59, 60, 69: draw fullcircle scaled 2r; endfor
    for t=0 step 15 until 350: draw ((53,0) -- (60,0)) rotated t; endfor
    for t=0 step 45 until 350: draw ((69,0) -- (80,0)) rotated t; endfor
    save s; path s; s = 8 right -- 60 up -- 8 left -- cycle;
    for t=0 upto 3: filldraw s rotated (45 + 90t); endfor
    s := s scaled 1.414;
    for t=0 upto 3: 
      s := s rotated 90t;
      fill s withcolor background; 
      fill subpath (-1/2, 1) of s -- cycle if t=0: withcolor highlight fi;
      draw s;
    endfor
    unfill fullcircle scaled 28; draw fullcircle scaled 28;
    draw origin withpen pencircle scaled dotlabeldiam;
    label("N" infont "cmbx12", 92 up);
    label("S" infont "cmbx12", 92 down);
    label("E" infont "cmbx12", 92 right);
    label("W" infont "cmbx12", 92 left);
  drawoptions();
) enddef;
input colorbrewer-rgb
beginfig(1);
  picture O; O = compass_rose(Blues 8 8, Reds 8 7) scaled 1/2;

  numeric s; pair p; s = 108; p = origin;
  draw O shifted p; 
  draw bbox O withcolor 3/4[red, white]; 
  label.urt(TEX("\small\texttt{bbox P}"), point -1 of bbox O) withcolor 3/4[red, white];
  
  p := (1s, 0); draw O rotated 30 shifted p; label(TEX("\small\texttt{rotated 30}"),     p shifted 54 down);
  p := (2s,+15); draw O shifted p;            label(TEX("\small\texttt{shifted 15 up}"), p shifted 54 down);

  p := ( 0, -1s); draw O scaled 3/4 shifted p;  label(TEX("\small\texttt{scaled 3/4}"), p shifted 54 down);
  p := (1s, -1s); draw O xscaled 3/4 shifted p;  label(TEX("\small\texttt{xscaled 3/4}"), p shifted 54 down);
  p := (2s, -1s); draw O yscaled 3/4 shifted p;  label(TEX("\small\texttt{yscaled 3/4}"), p shifted 54 down);

  p := ( 0, -2s); draw O slanted 3/4 shifted p;  label(TEX("\small\texttt{slanted 3/4}"), p shifted 54 down);
  p := (1s, -2s); draw O zscaled 3/4 dir 21 shifted p;  label(TEX("\small\texttt{zscaled 3/4 dir 21}"), p shifted 54 down);
  p := (2s, -2s); draw O reflectedabout(up, down) shifted p;  label(TEX("\small\texttt{reflectedabout(up, down)}"), p shifted 54 down);
endfig;
\end{mplibcode}
\end{document}
