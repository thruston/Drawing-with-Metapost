\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
vardef f(expr x) = sqrt(-1/2 - x * x + sqrt(1/4 + 2 * x * x)) enddef;
numeric s; s = 1/8;
path limb; 

limb = origin for x = s step s until 1: .. (x, f(x)) endfor {down};
limb := limb scaled 128;

path lemniscate;
lemniscate = limb 
    & reverse limb reflectedabout(left, right)
    & limb reflectedabout(up, down)
    & reverse limb rotated 180
    & cycle;

draw limb withpen pencircle scaled 2 withcolor 7/8[red, white];
drawarrow lemniscate withcolor 2/3 blue; 
endfig;
\end{mplibcode}
\end{document}

