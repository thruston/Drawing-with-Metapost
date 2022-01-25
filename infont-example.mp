\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
interim bboxmargin := 2;
picture p, pp;
p  = "proof" infont "pplri8r" scaled 4;
pp = image(
draw (left -- 7 right) scaled 14 withcolor .7 white; 
draw p;
draw bbox currentpicture withcolor 3/4[red, white]);
beginfig(1);
draw bbox p withcolor 3/4[red, white];
draw p; 
draw pp shifted 120 right;
endfig;
\end{mplibcode}
\end{document}

