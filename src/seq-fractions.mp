\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef gcd(expr a, b) = if b = 0: a else: gcd(b, a mod b) fi enddef;
vardef fraction_line(expr wd, denominator) = 
  interim ahangle := 180;
  save w, g, n, d; pair w; numeric g, n, d;
  image(drawdblarrow origin -- wd * right;
    for i = 1 upto denominator - 1:
      w := (i / denominator * wd, 0);
      g := gcd(i, denominator);
      n := i / g; d := denominator / g;
      draw (up--down) scaled 1/2 ahlength shifted w;
      label("$\frac{" & decimal n & "}{" & decimal d & "}$", w + 10 up)
         withcolor 2/3 if g > 1: red else: blue fi;
    endfor)
enddef;
beginfig(1);
  for n = 2 upto 8:
    draw fraction_line(4in, n) shifted (0, -36n);
  endfor
endfig;
\end{mplibcode}
\end{document}

