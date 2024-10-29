\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibnumbersystem{double}
\begin{mplibcode}
vardef fizz(expr X) =
  pair m, n; m = right; n = origin;
  numeric x; x = X;
  forever:
    exitif x = 0;
    m := m zscaled (-1/2, -1/2);
    if odd x:
      n := n + m;
    fi
    x := x div 2;
  endfor
  n
enddef;
beginfig(1);  
  numeric s, t; s = 256; t = 4;
  for n=0 upto (s/t*s/t-1):
    draw fizz(n) scaled s
      withpen pencircle scaled t
      withcolor ((7+n mod 8)/16)[1/2 blue, white];
  endfor;
  path xx, yy;
  xx = (left--right) scaled (s+8);
  yy = xx rotated 90;
  for i=-1 upto 1:
    draw xx shifted (0, s*i) withpen pencircle scaled 1/8;
    draw yy shifted (s*i, 0) withpen pencircle scaled 1/8;
    if i=0:
      dotlabel.lrt("$-i$", (i, -1) scaled s);
      dotlabel.lrt("$+i$", (i, +1) scaled s);
    else:
      dotlabel.lrt("$" & decimal i & "-i$", (i,-1) scaled s);
      dotlabel.lrt("$" & decimal i & "$", (i, 0) scaled s);
      dotlabel.lrt("$" & decimal i & "+i$", (i, 1) scaled s);
    fi
  endfor
endfig;
\end{mplibcode}
\end{document}
