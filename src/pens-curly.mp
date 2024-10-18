\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}

pair r; r = dir 30;
path S; S = origin {r} .. 300 right {r};

numeric head_length, tail_length, amplitude, lambda;
head_length = tail_length = 13; amplitude = 1; lambda = 2;

vardef zigzag expr p = 
    save a, b; numeric a, b; a = arctime head_length of p; b = arctime arclength p - tail_length of p;
    subpath(0, a) of p  
    -- _ziggy(subpath(a, b) of p, false) --
    subpath(b, infinity) of p
enddef;
vardef wavy expr p = 
    save a, b; numeric a, b; a = arctime head_length of p; b = arctime arclength p - tail_length of p;
    subpath(0, a) of p 
    ... _ziggy(subpath(a, b) of p, true) ...
    subpath(b, infinity) of p
enddef;

vardef _ziggy(expr p, soft) = 
    save t, k, A, s; numeric t, k, A, s; k = 0; A = arclength p; s = A / round(A/lambda);
    
    point 0 of p 
    for i=s step s until A:
        hide(t := arctime i of p;)
        if soft: .. else: -- fi amplitude * if odd incr k: up else: down fi rotated angle direction t of p shifted point t of p
    endfor 
    cutbefore fullcircle scaled 4 lambda shifted point 0 of p
    cutafter fullcircle scaled 4 lambda shifted point infinity of p
enddef;

beginfig(1);
   draw S;
   drawarrow zigzag S shifted 30 down;
   amplitude := 2/3; lambda := 3;
   drawarrow wavy   S shifted 60 down;
endfig;
\end{mplibcode}
\end{document}

