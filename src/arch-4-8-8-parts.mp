\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
input colorbrewer-rgb
path o, r[];
o = (for i=0 upto 7: 21 dir 45i -- endfor cycle) rotated -90/4;
pair t; t = whatever[point 0 of o, point 1 of o]
          = whatever[point 2 of o, point 3 of o];
r1 = subpath (1,2) of o -- t -- cycle;
r2 = r1 rotated 90;
r3 = r2 rotated 90;
r4 = r3 rotated 90;

picture filler; 
filler = image(
    filldraw r1 withcolor Reds 8 3;
    filldraw r2 withcolor Blues 8 3;
    filldraw r3 withcolor Reds 8 3;
    filldraw r4 withcolor Blues 8 3;
    filldraw o withcolor Purples 8 2;
);
beginfig(1);
    draw filler;  
    label.bot("\begin{tabular}{c}The \texttt{filler} picture\\(unrotated)\end{tabular}", point 1/2 of bbox filler);

    draw o shifted 120 right;
    label.bot("The octagon path \texttt{o}", point 1/2 of bbox o shifted 120 right);

endfig;
\end{mplibcode}
\end{document}
