%prologues := 3;
%outputtemplate := "%j%c.%{outputformat}";
\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
interim bboxmargin := 0;
vardef boxed(expr p) = save P; picture P; P = image(draw bbox p withcolor 7/8[red, white]; draw p); P enddef;
beginfig(1);
    for i=2 upto 15:
        numeric y; y = -14i - 4 floor(i/4);
        label.lft(decimal 16i infont "phvr8r" scaled 0.6, (-6, y+2)) withcolor 0.54 red;
        for j = 0 upto 15:
            draw boxed(char (16i+j) infont "gporsonrg6r") shifted (12j + 2 floor(j/4), y); 
        endfor
    endfor
    for x = 0 upto 4:
        draw (50x-4, -18) -- (50x-4, -224) withcolor 0.54 red;
    endfor
endfig;
\end{mplibcode}
\end{document}
