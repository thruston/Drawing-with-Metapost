\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
numeric u; u = 42;

path xx, yy;
xx = (-3u, 0) -- (5u, 0);
yy = xx rotated 90;

path ee, ll, nn;
numeric minx, maxx, s;
minx = -3;  maxx = 1/256 mlog(4.5); s = 1/4;
ee = (for x = minx step s until maxx - s: 
    (x, mexp(256x)){1, mexp(256x)} ... 
endfor (maxx, mexp(256 maxx)){1, mexp(256 maxx)}) scaled u;
ll = ee reflectedabout(origin, dir 45);    
nn = (for x=1 step s until 4-s: (x, 1/x) ... endfor (4, 1/4)) scaled u;
nn := reverse nn reflectedabout(origin, dir 45) & nn;

draw unitsquare xscaled mexp(256) scaled u withcolor 7/8;
draw unitsquare yscaled mexp(256) scaled u withcolor 7/8;

path T[];
numeric p; p = directiontime dir 45 of ee; 
T1 = (precontrol p of ee -- postcontrol p of ee) shifted - point p of ee scaled 1/2 u shifted point p of ee;
T2 = (precontrol p of ll -- postcontrol p of ll) shifted - point p of ll scaled 1/2 u shifted point p of ll;
drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw T1; draw T2; draw interpath(1/2, T1, T2) dashed evenly;
drawoptions();

draw nn; label.urt("$1/x$", point 0 of nn);
draw ee withcolor 2/3 blue; label.top("$e^x$", point infinity of ee) withcolor 2/3 blue;
draw ll withcolor 3/4 red; label.top("$\ln(x)$", point infinity of ll) withcolor 3/4 red;
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);

dotlabel.lft("$e$", (0, mexp(256) * u));
dotlabel.bot("$e$", (mexp(256) * u, 0));
dotlabel.ulft("$1$", (0, u));
dotlabel.lrt("$1$", (u, 0));


endfig;
\end{mplibcode}
\end{document}

