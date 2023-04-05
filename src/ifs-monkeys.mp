\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
z0 = origin; z11 = right;
z9 = 1/3[z0, z11];
z10 = 2/3[z0, z11];
x2 = x7 = x8 = x9;
x3 = x5 = x10;
y7 = y5;
z7 = 1/3[z2, z9];
z8 = 2/3[z2, z9];
y2 = y3; z2 = whatever * dir 60;
z1 = 1/2 z2; z6 = 1/2[z2, z5]; z4 = 3/2[z2, z5];
path a, b, c, d; 
a = z0 for i=1 upto 10: -- z[i] endfor;
b = a reflectedabout(left, right);
c = (z11 for i=10 downto 1: -- z[i] endfor) reflectedabout(1/2 right, z6);
d = c reflectedabout(left, right);

path I, G; I = (a--z11) scaled 1024;
numeric n; n = 0;
G := b zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- c zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- a zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- c zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- c zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- b zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- d zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- d zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- a zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- d zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I 
  -- a zscaled (point incr n of I - point n-1 of I) shifted point n-1 of I -- point n of I;

n := length G;
G := G scaled (1/abs point n of G);

draw I withpen pencircle scaled 2 withcolor red;
for i=0 upto length I:
    draw G zscaled (point i+1 of I - point i of I) shifted point i of I
        if i = 0: reflectedabout(point 0 of I, point 1 of I) fi;
endfor





endfig;
\end{mplibcode}
\end{document}

