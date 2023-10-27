\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef pushed(expr p, t, d) = 
  point t of p shifted (unitvector(direction t of p rotated -90) scaled d)
enddef;

vardef meeting(expr p, t, d) = 
  save aa, bb, z;
  pair aa, bb, z;
  aa = unitvector(direction t - eps of p rotated -90) scaled d;
  bb = unitvector(direction t + eps of p rotated -90) scaled d;
  if aa = bb:  % guard against co-linear points...
    z = point t of p shifted aa;
  else:
    z = whatever[point t - 1 of p shifted aa, point t of p shifted aa]
      = whatever[point t + 1 of p shifted bb, point t of p shifted bb];
  fi
  z
enddef;

vardef alongside(expr p, displacement) = 
  if cycle p:
    for t = 0 upto length p - 1:
      meeting(p, t, displacement)
      {direction t+eps of p} .. {direction t+1-eps of p} 
    endfor cycle
  else:
    pushed(p, 0, displacement)
    {direction 0 of p} .. {direction 1-eps of p}
    for t = 1 upto length p - 1:
      meeting(p, t, displacement)
      {direction t+eps of p} .. {direction t+1-eps of p} 
    endfor 
    pushed(p, length p, displacement)
  fi 
enddef;

vardef beside(expr p, displacement) = 
  path _s[]; save n; numeric n; n = 0;
  for i=0 upto length p - 1:
    _s[incr n] = pushed(p, i + 1 / 128, displacement) for j=2 upto 127: .. pushed(p, i + j / 128, displacement) endfor;
  endfor
  for i=1 upto n: drawarrow _s[i] withcolor green; endfor
  p
enddef;


beginfig(1);
  path P[];

  P1 = origin -- 100 dir 20 -- 100 right -- 140 right -- 100 dir -30 -- cycle;
  P2 = for i=1 upto 5: 70 dir 72i -- endfor cycle;
  P2 := P2 slanted 1;
  P3 = subpath (0, 4) of P1;
  P4 = subpath (0, 1) of P1;
  P5 = fullcircle scaled 50;
  P6 = (halfcircle -- origin -- down) scaled 80;
  P7 = 80 left {dir 40} .. 80 right {dir 40};

  for i=1 upto 7:
    P[i] := P[i] shifted (0, 140i);
    draw P[i];
    % for t=0 upto length P[i]:
    %   draw point t of P[i] withpen pencircle scaled 3;
    %   drawarrow (origin -- 20 unitvector(direction t-eps of P[i])) shifted point t of P[i] withcolor green;
    %   drawarrow (origin -- 20 unitvector(direction t+eps of P[i])) shifted point t of P[i] withcolor red;
    %   draw precontrol t of P[i] withpen pencircle scaled 2 withcolor green;
    %   draw postcontrol t of P[i] withpen pencircle scaled 2 withcolor red;
    % endfor
    draw alongside(P[i], 5) withcolor red;
    draw beside(P[i], -5) withcolor blue;

  endfor
endfig;
\end{mplibcode}
\end{document}

