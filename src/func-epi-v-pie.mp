\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

numeric minx, maxx, s, u, v;
minx = 13/8; s = 1/16; maxx = 19/4; u = 89; v = 3072; 

def f(expr x) = 1/256 mlog(x) / x enddef;

path ff, xx, yy;
ff = for x=minx step s until maxx-s: (x, f(x)) .. endfor (maxx, f(maxx));
ff := ff xscaled u yscaled v;
xx = origin -- right scaled (maxx-minx) scaled u;
yy = origin -- up scaled 0.09v;
xx := xx shifted point 0 of ff shifted 20 down;
yy := yy shifted point 0 of ff shifted 20 left;

numeric pi, e, fpi, fe;
pi = 3.141592653589793 u;  fpi = f(3.141592653589793) * v;
e = 2.718281828459045 u;   fe = f(2.718281828459045) * v;
path ee, pp;
ee = (e, ypart point 0 of xx) -- (e, fe) -- (xpart point 0 of yy, fe);
pp = (pi, ypart point 0 of xx) -- (pi, fpi) -- (xpart point 0 of yy, fpi);
draw ee dashed withdots scaled 1/4 withcolor 2/3 red;
draw pp dashed withdots scaled 1/2 withcolor 2/3 red;
draw ff withcolor 3/4 blue;
drawarrow xx;
drawarrow yy;

for x=2 upto 4: 
    draw (down--up) scaled 2 shifted (x * u, ypart point 0 of xx);
    label.bot("$" & decimal x & "$", (x * u, ypart point 0 of xx - 2));
endfor
for y=.31, .32, .33, .34, .35, .36, .37, .38: 
    draw (left--right) scaled 2 shifted (xpart point 0 of yy, y*v);
endfor
for y=.32, .35, .38: 
    label.lft("$" & decimal y & "$", (xpart point 0 of yy-2, y*v));
endfor

drawoptions(withcolor 1/2 red);
label.bot("$e$", point 0 of ee shifted 4 down);
label.lft("$1/e$", point 2 of ee shifted 2 left);

label.bot("$\pi$", point 0 of pp shifted 4 down);
label.lft("$\ln\pi/\pi$", point 2 of pp shifted 2 left);

drawoptions(withcolor 2/3 blue);
label.urt("$\displaystyle y={\ln x\over x}$", point 42 of ff);

drawoptions();
label.rt("$x$", point 1 of xx);
label.top("$y$", point 1 of yy);
label("\dots\ hence\enspace $e^\pi > \pi^e$.", (4u, 0.38v));

endfig;
\end{mplibcode}
\end{document}
