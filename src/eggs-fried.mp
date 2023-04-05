\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
path yolk, base;
color cooked_egg_yolk, cooked_egg_white;
cooked_egg_yolk = 1/256(216, 136, 49);
cooked_egg_white = 1/256(235, 237, 233);

vardef fried_egg(expr r) = 
  save base, yolk; path base, yolk;
  yolk = for i=0 upto 17: (r + 1/8 normaldeviate) * dir 20i .. endfor cycle;
  base = (for i=0 upto 17: (2r + 1/8r * normaldeviate) * dir 20i .. endfor cycle) 
    shifted (uniformdeviate r/2, uniformdeviate r/2);
  image(
    fill base withcolor cooked_egg_white;
    fill yolk withcolor cooked_egg_yolk;
    fill subpath (6.7, 9.6) of yolk scaled 0.8 -- 
      subpath (9.6, 6.7) of yolk scaled 0.66 -- cycle 
      withcolor 1/2[cooked_egg_yolk, white];
  ) 
enddef;

for i=0 upto 1:
    draw fried_egg(40) shifted 120 dir 120i;
endfor


endfig;
\end{mplibcode}
\end{document}

