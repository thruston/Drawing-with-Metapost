\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
vardef setg(text t) = 
    save G; picture G;
    save x; numeric x; x = 0;
    G = image(
        for w = t:
            picture g; 
            g = w infont "gporsonrg6r";
            draw g shifted (x, 0);
            x := x + xpart (urcorner g - llcorner g) + 3;
        endfor
    ); G enddef;
beginfig(1);
picture homer;
homer = setg("m" & char 168 & "nin", char 138 & "eide",  "je" & char 128, 
             "Phlh" & char 240 & char 136 & "deiw", ">Aqil" & char 168 & "oc");
undraw 10 left -- 272 right;
draw homer scaled 1.732 withcolor .54 red;
endfig;
\end{mplibcode}
\end{document}

