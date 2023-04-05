\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(3);
path t;  t = (0,0) -- (220,42) -- (180,-90) -- cycle;
pair centroid;
centroid = 2/3[point 0 of t,point 3/2 of t];

path s[];
for i=0 upto 5:
  s[i] = point 1/2 i of t -- point 1/2 + 1/2 i of t -- centroid -- cycle;
endfor

color c[];
c[0] = (1,0.96863,0.73725);
c[1] = (0.99608,0.76863,0.3098);
c[2] = (0.85098,0.37255,0.054902);

picture a,b;
a = image(
for i=0 upto 2:
  fill s[2i]   withcolor .6[c[i],white]; 
  fill s[2i+1] withcolor .4[c[i],white];
endfor
for i=0 upto 2:
draw point i of t -- point 3/2+i of t;
endfor
draw t;);
b = image(
for i=0 upto 2:
  fill s[2i]   withcolor .6[c[i],white]; 
  fill s[2i+1] rotatedabout(point i+1/2 of t, 180) withcolor .4[c[i],white];
endfor
for i=0 upto 2:
  draw point i of t -- centroid -- centroid rotatedabout(point i+1/2 of t,180) -- cycle;
endfor
draw t;);
draw a;
draw b shifted 222 right;
endfig;
\end{mplibcode}
\end{document}

