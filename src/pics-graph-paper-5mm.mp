input automatic-grid
begingroup; save P; picture P; P = currentpicture; clearit;
draw grid(P, 5mm) withpen pencircle scaled 1/4 withcolor (3/4, 3/4, 7/8);
draw grid(P, 10cm) withpen pencircle scaled 1/4 withcolor (1/2, 1/2, 3/4);
draw P; endgroup;
