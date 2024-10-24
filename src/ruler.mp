% add a ruler along the left hand and lower edges 
% of the bounding box of the currentpicture
path B, p; pair o; B = bbox currentpicture;
for s=-1, 1:
  p := subpath (0, s) of B;
  a := arclength p;
  o := if s < 0: left else: down fi;
  for i=0 upto 3:
    exitif not known u[i];
    for j=0 upto floor(a/u[i]):
      pair t; t = point arctime j*u[i] of p of p;
      draw (origin -- (7 - 2i) * o) shifted t;
      if i=0: label(decimal j, t shifted 12 o); fi
    endfor
  endfor
  draw p;
endfor 
