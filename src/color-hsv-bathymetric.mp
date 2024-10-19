\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input color-hsv-macro
beginfig(1);
defaultfont := "phvr8r"; defaultscale := 3/4;
path h,d,b; numeric n; n = 10;
h = ((-2,0)--(0,0)--(-1,3)--(-2,3)--cycle) scaled 64;
d = h rotated 180;
b = subpath (0,1) of h -- point 1+1/n of d -- 
    (xpart point 0 of h, ypart point 1+1/n of d) -- cycle;
fill b withcolor hsv_color(123, 1/8, 7/8);
draw subpath (2.13,4) of b;
for i=1 upto n:
  fill point 4-(i-1)/n of h -- point 1+(i-1)/n of h --
       point 1+i/n of h -- point 4-i/n of h -- cycle
       withcolor hsv_color(42, 1/4 + 3/4 * i/n, 1 - i/3n);
  fill point 4-(i-1)/n of d -- point 1+(i-1)/n of d --
       point 1+i/n of d -- point 4-i/n of d -- cycle
       withcolor hsv_color(200, i/n - 1/n, 1 - i/3n);
endfor
string s;
for i=1 upto n-1: 
  draw point 4-i/n of h -- point 1+i/n of h; 
  draw point 4-i/n of d -- point 1+i/n of d; 
  s := decimal if i < 4: (i**2+1) else: (10 + (i-3)*10) fi & "00";
  label.rt(s, point 1+i/n of h);
  label.lft(s, point 1+i/n of d);
endfor
label.rt("Metres", point 2 of h);
label.lft("Metres", point 2 of d);
label.lft("Hypsometric tints" infont defaultfont 
    scaled defaultscale rotated 90, point 7/2 of h);
label.rt("Bathymetric tints" infont defaultfont
    scaled defaultscale rotated -90, point 7/2 of d);
label.lft("sea level", point 0 of h);
label("areas below sea level", center b);
draw h; draw d;
endfig;
\end{mplibcode}
\end{document}
