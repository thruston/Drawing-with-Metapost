\documentclass{standalone}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
numeric a; a = 56;
path r[];  % the rings
r1 = fullcircle scaled 2a shifted (0, -3/2 a);
r2 = fullcircle scaled 2a shifted (0, -1/2 a);
r3 = fullcircle scaled 2a shifted (0, +1/2 a);
r4 = fullcircle scaled 2a shifted (0, +3/2 a);
r5 = r2 rotatedabout(point 2 of r2, -60);
r6 = r2 rotatedabout(point 2 of r2, +60);

pair o[];  % the centres of rotation for each arc
o1 = point 6 of r5;
o2 = point 2 of r3;
o3 = point 6 of r6;
o4 = whatever[o3, point 2+4/3 of r2] = whatever[o2, point 2-4/3 of r1];
o8 = whatever[o1, point 2-4/3 of r2] = whatever[o2, point 2+4/3 of r1]; 
o6 = 1/2[point 2-4/3 of r1, point 2+4/3 of r1];
o5 = whatever[o6, point 2-4/3 of r3] = whatever[o4, point 2+4/3 of r1];
o7 = whatever[o6, point 2+4/3 of r3] = whatever[o8, point 2-4/3 of r1];

pair u[], t[];  % directions and points for the egg
u0 = (o8 - o1) rotated 90;  t0 = directionpoint u0 of r6;
u1 = (o2 - o1) rotated 90;  t1 = directionpoint u1 of r4;
u2 = (o2 - o3) rotated 90;  t2 = directionpoint u2 of r4;
u3 = (o4 - o3) rotated 90;  t3 = directionpoint u3 of r5;

u4 = (o5 - o4) rotated 90;
u5 = (o6 - o5) rotated 90;
u6 = (o6 - o7) rotated 90;
u7 = (o7 - o8) rotated 90;
t4 = directionpoint u4 of fullcircle scaled 2 abs (t3 - o4) shifted o4;  
t5 = directionpoint u5 of fullcircle scaled 2 abs (t4 - o5) shifted o5;
t6 = directionpoint u6 of fullcircle scaled 2 abs (t5 - o6) shifted o6;
t7 = directionpoint u7 of fullcircle scaled 2 abs (t6 - o7) shifted o7;

path egg;
egg = for i=0 upto 7: t[i] {u[i]} .. endfor cycle;

input eggs-common

beginfig(1);
    fill egg withpen pencircle scaled 2 withcolor eggshell;
    picture P; P = currentpicture;
    
    drawoptions(withpen pencircle scaled 1/4 withcolor dark_eggshell);
    for i=1 upto 6: draw r[i]; endfor
    draw point 2+4/3 of r1 -- point 2-4/3 of r1 -- o2 -- cycle;
    draw point 2+4/3 of r3 -- o7;
    draw point 2-4/3 of r3 -- o5;
    

    drawoptions(withpen pencircle scaled 1/4 withcolor 1/2);
    draw t0 -- o1 -- t1;
    draw t2 -- o3 -- t3;
    draw o4 -- t4;
    draw o5 -- t5;
    draw o7 -- t6;
    draw o8 -- t7;
    draw egg;

    drawoptions(withpen pencircle scaled 2 withcolor 7/16);
    t8 = t0;
    for i=1 upto 8:
        draw o[i];  
        label("$\scriptscriptstyle " & decimal i &"$", 
              o[i] + 4.2 (unitvector(t[i-1]-o[i]) + unitvector (t[i]-o[i])));
    endfor
    drawoptions();
    draw numbered_points(egg);

    draw P shifted 240 right;

endfig;
\end{mplibcode}
\end{document}

