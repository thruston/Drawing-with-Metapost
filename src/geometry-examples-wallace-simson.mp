\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path circumcircle; circumcircle = fullcircle scaled 240;

pair A, B, C, P;
A = point 4.1 of circumcircle;
B = point 1.9 of circumcircle;
C = point 7.4 of circumcircle;
P = point 1 of circumcircle;

pair pedal[];
pedal1 = whatever[A,B]; P - pedal1 = whatever * (A-B) rotated 90;
pedal2 = whatever[B,C]; P - pedal2 = whatever * (B-C) rotated 90;
pedal3 = whatever[C,A]; P - pedal3 = whatever * (C-A) rotated 90;

path wsline;
wsline = 1.5[pedal1,pedal3] -- 1.1[pedal3, pedal1];

drawoptions(withpen pencircle scaled 3/8 withcolor 3/4);
  draw B -- 1.5[B,pedal1];
  forsuffixes $ = 1, 2, 3:
    draw unitsquare scaled 5 
      rotated (angle (P-pedal$)-90) shifted pedal$;
    draw P -- pedal$;
  endfor
drawoptions();

draw circumcircle withcolor 2/3 blue;
draw A--B--C--cycle;
draw wsline withcolor 2/3 red;

labeloffset := 4;
dotlabel.lft ("$A$", A);
dotlabel.top ("$B$", B);
dotlabel.lrt ("$C$", C);
dotlabel.urt ("$P$", P);
dotlabel.ulft("$P_1$", pedal1);
dotlabel.lft ("$P_2$", pedal2);
dotlabel.llft("$P_3$", pedal3);

label.bot("\textsc{The Wallace-Simson line}", point 0 of wsline);
endfig;
\end{mplibcode}
\end{document}
