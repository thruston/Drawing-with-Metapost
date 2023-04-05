\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path A, B;
A = (origin {dir 42} .. 120 right {dir 42}) rotated 6;
B = A reflectedabout (left, right) shifted 10 up;
drawarrow A; label.llft("$A$", point 0 of A);
drawarrow B; label.ulft("$B$", point 0 of B);

pair P[]; numeric n; n=0; 
path R; R := A; %take a copy of A 
forever:
  R := R cutbefore B;  % snip where we cross B
  exitif length cuttings = 0;  % stop if nothing was cut
  P[incr n] = point 0 of R; % capture the point
  R := subpath (epsilon, infinity) of R; % nudge along
endfor

draw fullcircle scaled 4 shifted P1 withcolor .54 red;
draw fullcircle scaled 4 shifted P2 withcolor .54 red;
draw fullcircle scaled 4 shifted P3 withcolor .54 red;
endfig;
\end{mplibcode}
\end{document}

