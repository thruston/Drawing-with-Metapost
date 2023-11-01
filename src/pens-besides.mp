\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

vardef extended(expr p) = 
  -42 unitvector(direction 0 of p) shifted point 0 of p .. p .. 
  +42 unitvector(direction 1 of p) shifted point 1 of p
enddef;

vardef chopper expr t of p =
  (up--down) scaled 42 
  rotated 1/2(angle direction t-eps of p + angle direction t+eps of p)
  shifted point t of p
enddef;

vardef beside(expr p, d) = 
  save n, a, b, aa, bb; numeric n; n = length p;
  pair a, b, aa, bb; path _part[];
  for i = 1 upto n:
    aa := postcontrol i-1 of p - point i-1 of p; 
    bb := point i of p - precontrol i of p;    
    a := unitvector(aa) rotated -90 scaled d;
    b := unitvector(bb) rotated -90 scaled d;
    _part[i] = extended(
      point i-1 of p shifted a {aa} .. point i of p shifted b {bb}
    ) cutbefore chopper i-1 of p cutafter chopper i of p;
  endfor
  _part[1] for i=2 upto n: .. _part[i] endfor if cycle p: .. cycle fi
enddef;
beginfig(1);

    path P[];

    % P1 = origin -- (48,3) -- (96,-3) -- 144 right;
    P2 = (22, 13) --- (92, 10) .. (120, 32) .. (138,50) .. (200, 69) ..
      (280, 78) .. (300, 84) .. (315, 100) .. (322, 150) ..
      (300, 186) --- (200, 187) --- (100, 188) --- (25, 188.75) -- cycle
  ;
   
    % % P1 := P1 shifted (center P2 - center P1) shifted 20 up;
    % % P2 = fullcircle scaled 120;
    % P3 = (reverse halfcircle -- origin -- down) scaled 64;
    % P4 = for i=0 upto 4: 60 up rotated 72i -- endfor cycle;
    % P5 = (left {dir 42} .. origin .. right {dir 42}) scaled 64;
    % P6 = (left {dir 42} .. right {dir 42}) scaled 64;
    % P7 = 40 left {right} .. 20 up .. 40 up {left} .. 20 up .. {right} 40 right;

    for i=1 upto 10:
        if known P[i]:
            P[i] := P[i] shifted (150i, 0);
            draw beside(P[i], 2) withcolor \mpcolor{textblue};
            draw P[i];
            draw beside(P[i], -2) withcolor \mpcolor{textred};
        fi
    endfor

endfig;
\end{mplibcode}
\end{document}

