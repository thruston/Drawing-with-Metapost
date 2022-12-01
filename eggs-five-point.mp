\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

color eggshell, darker_eggshell;
eggshell = 3/4[1/4[red, green], white];
darker_eggshell = 1/2[1/4[red, green], white];

numeric a; a = 56;    
path r[], s[];
for i=1 upto 4:
    r[i] = fullcircle scaled 2a shifted (0, a * i);
endfor
r5 = r2 rotatedabout(point 2 of r2, 60);
r6 = r2 rotatedabout(point 2 of r2, -60);


z1 = subpath (4, 8) of r5 intersectionpoint (point 6 of r6 -- 8[point 6 of r6, point 2/3 of r2]);
z2 = subpath (0, 4) of r4 intersectionpoint (point 6 of r6 -- 8[point 6 of r6, point 2 of r3]);
z3 = whatever [z1, point 6 of r6] = whatever [point 2 of r3,  point 10/3 of r1];
z4 = z3 reflectedabout(up, down);
z7 = 1/2[point 10/3 of r1, point 2/3 of r1];
z5 = whatever [z3, point 2/3 of r1] = whatever [z7, point 10/3 of r3];
z6 = z5 reflectedabout(up, down);

s1 = fullcircle scaled 2 length (z2 - point 6 of r6) shifted point 6 of r6 cutbefore z1 cutafter z2;
s3 = fullcircle rotated angle (point 2/3 of r1 - z3) scaled 2 length (z1-z3) shifted z3 cutafter z1;
s5 = fullcircle rotated angle (z7 - z5) scaled 2 (length (z1-z3) - length (z3-z5)) shifted z5 cutafter point 0 of s3;

s2 = reverse s1 reflectedabout(up, down);
s4 = reverse s3 reflectedabout(up, down);
s6 = reverse s5 reflectedabout(up, down);


path egg;
egg = s5 -- s3 -- s1 .. point 2 of r4 .. s2 -- s4 -- s6 .. point 6 of r1 .. cycle;

fill egg withpen pencircle scaled 2 withcolor eggshell;
picture P; P = currentpicture;

drawoptions(withpen pencircle scaled 1/4 withcolor darker_eggshell);
for i=1 upto 6: 
    draw r[i];
endfor
draw point 2 of r3 -- point 2/3 of r1 -- point 10/3 of r1 -- cycle;
draw z5 -- point 10/3 of r3; 
draw z6 -- point  2/3 of r3; 
draw point  2/3 of r1 withpen pencircle scaled 2;
draw point 10/3 of r1 withpen pencircle scaled 2;
draw point  2/3 of r3 withpen pencircle scaled 2;
draw point 10/3 of r3 withpen pencircle scaled 2;

drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
draw point 6 of r6 -- point 8 of s1;
draw point 6 of r6 -- point 0 of s1;
draw point 6 of r5 -- point 8 of s2;
draw point 6 of r5 -- point 0 of s2;

draw z3 -- point 0 of s3;
draw z4 -- point 8 of s4;
draw z5 -- point 0 of s5;
draw z6 -- point 8 of s6;

for $=z3, z4, z5, z6, z7, point 2 of r3, point 6 of r5, point 6 of r6:
    draw $ withpen pencircle scaled 2;
endfor

draw egg;

drawoptions();

draw P shifted 240 right;

endfig;
\end{mplibcode}
\end{document}

