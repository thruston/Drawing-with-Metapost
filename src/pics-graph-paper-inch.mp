input automatic-grid
begingroup; save P; picture P; P = currentpicture; clearit;
draw grid(P, 9) withpen pencircle scaled 4/16 withcolor 1/16(12,12,14);
draw grid(P,36) withpen pencircle scaled 5/16 withcolor 1/16(10,10,13);
draw grid(P,72) withpen pencircle scaled 6/16 withcolor 1/16( 8, 8,12);
draw P; endgroup;
