\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}

path h[], snake;
h0 = for i = 1 upto 6: dir 60i -- endfor cycle;
for i = 1 upto 6:
    h[i] = h0 shifted (point 0 of h0 - point 2 of h0) rotated 60i;
endfor
snake = point 0 of h3 -- point 1 of h2 -- point 2 of h1 
                      -- point 1 of h6 -- point 2 of h5 -- point 3 of h0 
                      -- point 1 of h4 -- point 0 of h5;
snake := snake shifted - point 0 of h3;
snake := snake rotated - angle (point 0 of h5 - point 0 of h3);
snake := snake scaled (1 / length (point 0 of h5 - point 0 of h3));

vardef rattle(expr level, a, b) = 
  if level > 0:
    save s; path s; s = snake zscaled (b-a) shifted a;
    reverse rattle(level - 1, point 1 of s, a) &
            rattle(level - 1, point 1 of s, point 2 of s) &
            rattle(level - 1, point 2 of s, point 3 of s) &
            rattle(level - 1, point 3 of s, point 4 of s) & 
    reverse rattle(level - 1, point 5 of s, point 4 of s) & 
    reverse rattle(level - 1, point 6 of s, point 5 of s) &
            rattle(level - 1, point 6 of s, b)
  else:
    a -- b
  fi
enddef;
beginfig(1);
  pair a, b; path s;
  a = 124 left; b = 124 right; s = rattle(4, a, b);
  fill s -- b + (40, 0) -- b + (40, 224) 
         -- a - (40, -224) -- a - (40,0) -- cycle
         withcolor 3/4[1/4 blue, white];
endfig;
\end{mplibcode}
\end{document}

