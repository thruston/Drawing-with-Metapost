\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

pair a,b;
a = 42 up; b = 72 right;
path t,s,p,c;
t = origin--a--b--cycle;
s = unitsquare scaled 40 shifted 92 right;
p = (for i=0 upto 4: down scaled 21 rotated 72i -- endfor cycle) 
    shifted 180 right shifted 21 up;
c = fullcircle scaled 42 shifted 250 right shifted 21 up;

beginfig(2);
forsuffixes $=t,s,p,c:
    draw $; 
    draw point 0 of $ -- point 1/2 length $ of $ 
        dashed withdots scaled 1/3
        withcolor .67 red;
endfor
label.bot("\textsl{Dotted lines drawn with}: \mpl{point 0 of p -- point 1/2 length p of p}", 
    point 1/2 of bbox currentpicture);

endfig;
\end{mplibcode}
\end{document}
