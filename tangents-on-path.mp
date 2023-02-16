\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path p;
p := (origin {1, 3} .. (1, 0) .. {1, 2} (2, 0)) scaled 192; 

ahangle := 20;
ahlength := 6;
picture P[];
P1 = image(
    draw p withcolor 0.54 red;
    for t=0 upto length p: draw fullcircle scaled 5 shifted point t of p; endfor
);
P2 = image(
    draw p withcolor 0.54 red;
    drawoptions(withcolor 1/2);
    for t=0 upto length p:
        drawarrow precontrol t of p -- point t of p -- postcontrol t of p;
        fill fullcircle scaled 2 shifted precontrol t of p;
        draw fullcircle scaled 5 shifted point t of p;
        if t = 0: 
            %label.top("$(" & decimal xpart postcontrol t of p & "," & decimal ypart postcontrol t of p & ")$", postcontrol t of p);
            label.top("$(" & decimal abs(postcontrol t of p) & "," & decimal angle postcontrol t of p & ")$", postcontrol t of p);
        elseif t = 1:
            label.top("$(" & decimal xpart precontrol t of p & "," & decimal ypart precontrol t of p & ")$", precontrol t of p);
            label.bot("$(" & decimal xpart postcontrol t of p & "," & decimal ypart postcontrol t of p & ")$", postcontrol t of p);
            % label.urt(decimal arclength (precontrol t of p -- point t of p -- postcontrol t of p), point t of p);
            % label.llft(decimal length (precontrol t of p - postcontrol t of p), point t of p);
        elseif t = 2:
            label.bot("$(" & decimal xpart precontrol t of p & "," & decimal ypart precontrol t of p & ")$", precontrol t of p);
        fi
    endfor
    drawoptions();
);
P3 = image(
    draw p withcolor 0.54 red;
    drawoptions(withcolor 1/2);
    for t=0 step 1/8 until length p:
        path s; 
        s = origin -- unitvector(direction t - eps of p) scaled 42;
        drawarrow s shifted point t of p;
        fill fullcircle scaled 2 shifted point t of p;
    endfor
    drawoptions();
);
draw P1;
draw P2 shifted 144 down;
draw P3 shifted 360 down;
endfig;
\end{mplibcode}
\end{document}

