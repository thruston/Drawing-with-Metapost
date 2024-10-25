\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

path S; S = origin .. (48, 10) .. (116, -10) .. (165, 10);

labeloffset := 14;

beginfig(1);
picture P[];
numeric n; n = -1;
P[incr n] = image(
  draw S; 
  label.rt("plain", point 3 of S);
);
show incr n;

P[incr n] = image(
  draw S dashed dashpattern(on 4 off 2 on 1 off 2 on 1 off 2);     
  label.rt("with a dash pattern", point 3 of S);
);

P[incr n] = image(
  cutdraw S dashed dashpattern(on 4 off 1 on 1 off 1 on 1 off 1);     
  label.rt("with a sharp dash pattern", point 3 of S);
);

P[incr n] = image(
  cutdraw S withpen pencircle scaled 2;
  undraw S withpen pencircle scaled 5/4;
  cutdraw S dashed evenly scaled 2 shifted right withpen pencircle scaled 5/4;
  label.rt("as a railway line", point 3 of S);
);

show incr n;

P[incr n] = image(
  draw S;
  for a = 2 step 6 until arclength S:
    numeric t; t = arctime a of S;
    draw (down--up) rotated angle direction t of S shifted point t of S;
  endfor
  label.rt("as a plainer railway line", point 3 of S);
);

P[incr n] = image(
  numeric A; A = arclength S;
  for a = 0 step 1/8 until A:
    draw point arctime a of S of S withcolor (a / A);
  endfor
  label.rt("fading away", point 3 of S);
);

P[incr n] = image(
  for i=0 step 1/512 until length S:
    draw point i of S withpen pencircle scaled (4 * (1 - i / length S))
      withcolor (i / length S)[1/2 blue, white];
  endfor
  label.rt("fading and diminishing", point 3 of S);
);

path star; star = for i=0 upto 4: 6 up rotated (144i) -- endfor cycle; 
P[incr n] = image(
  numeric t, i, a; t = i = a = 0;
  for k=0 upto 100:
    % show (t, arclength S);
    exitif t >= arclength S;
    a := arctime t of S;
    fill star rotated angle direction a of S shifted point a of S
      withcolor if odd incr i: blue else: red fi;
    t := t + arclength subpath (2, 3) of star;
    star := star scaled 0.94;
  endfor
  label.rt("with a fancy pattern", point 3 of S);
);

P[incr n] = image(
  numeric u, v; u = 2; v = 1;
  picture e; e = image(
    draw (-u,  v) {right} .. {right} (u, -v) withcolor blue;
    cutdraw (-u, -v) {right} .. {right} (u, +v) withpen pencircle scaled 1 withcolor background;
    draw (-u, -v) {right} .. {right} (u, +v) withcolor red;
  );
  picture f; f = image(
    draw (-u,  v) {right} .. {right} (u, -v) withcolor red;
    cutdraw (-u, -v) {right} .. {right} (u, +v) withpen pencircle scaled 1 withcolor background;
    draw (-u, -v) {right} .. {right} (u, +v) withcolor blue;
  );
  numeric t, a, T, wd, A; t = a = 0; A = arclength S; wd = xpart (lrcorner e - llcorner e);
  for k=0 upto 100:
    exitif a > A;
    t := arctime a of S;
    draw if odd k: f else: e fi rotated angle direction t of S shifted point t of S;
    a := a + .8 wd;
  endfor
  label.rt("as a twisted pair", point 3 of S);
);

for i=0 upto 28:
  if known P[i]:
    draw P[i] shifted (0, -34i);
  fi
endfor
input show_name
endfig;
\end{mplibcode}
\end{document}
