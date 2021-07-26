\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

prologues := 3;
outputtemplate := "%j%c.eps";
vardef poly_on(expr a,b,n) = 
  save s,t,c; pair c;
  s = 360/n;
  t = 90-180/n;
  c = whatever[a,b rotatedabout(a,+t)] 
    = whatever[b,a rotatedabout(b,-t)];
  for i=0 upto n-1: a rotatedabout(c,i*s) -- endfor cycle
enddef;

vardef make_uniform_tiling_shd(expr u, reps, scolor, hcolor, dcolor) =
  save x,y,s, h, d, t; path s[], h[], d; picture t;
  (x,y) = dir 15;
  d = for i=0 upto 11: (x/2y, 1/2) scaled u rotated 30i -- endfor cycle;
  for i=0 upto 2: s[i] = unitsquare scaled u shifted point -1 of d rotated (60+60i); endfor
  for i=0 upto 1: h[i] = poly_on(point 9+2i of d, point 8+2i of d, 6); endfor
  t = image(
  fill d withcolor dcolor;  
  for i=0 upto 2: fill s[i] withcolor scolor; endfor
  for i=0 upto 1: fill h[i] withcolor hcolor; endfor

  draw d;
  for i=0 upto 2: draw s[i]; endfor
  for i=0 upto 1: draw h[i]; endfor
  );
  save dx, dy; pair dx, dy; 
  dx = (u,0) + point -1/2 of d - point 11/2 of d;
  dy = dx rotated 60;
  for i=-reps upto reps:
    for j=-reps upto reps:
      draw t shifted (i*dx) shifted (j*dy);
    endfor
  endfor
enddef;

def rgb(expr r,g,b) = (r/255, g/255, b/255) enddef;
color b[];
b1 = rgb(255,255,217);
b2 = rgb(237,248,177);
b3 = rgb(199,233,180);

beginfig(2);
picture tt; tt = image(make_uniform_tiling_shd(4mm, 7, b1, b2, b3); fill fullcircle scaled 3 withcolor red;); 
clip tt to fullcircle scaled 12cm; draw tt;
endfig;
\end{mplibcode}
\end{document}

