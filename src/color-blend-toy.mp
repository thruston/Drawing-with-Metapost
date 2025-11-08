\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
color brg, pbr; 
brg = 1/256 (1, 66, 37);  % British Racing Green
pbr = 1/256 (223, 52, 57);  % Pillar Box Red
path p; p = fullcircle scaled 18 yscaled 1.4 rotated -12;
for n = 0 upto 16:
  pair w; w = 20n * right;
  fill p shifted w withcolor (n/16)[pbr, brg];
  label(decimal n, w) withcolor white;
endfor
endfig;
\end{mplibcode}
\end{document}
