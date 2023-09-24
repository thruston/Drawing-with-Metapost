\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibnumbersystem{double}
\begin{mplibcode}

vardef cass(expr a, b, theta) = 
    save s, c, e; numeric s, c, e; s = sind(2 theta); c = cosd(2 theta); e = (b/a)**4;
    show (theta, c, e, s*s);
    % sqrt(a * a * (cosd(2 theta) + sqrt((b/a)**4 - (s*s))))
    10
enddef;

beginfig(1);
    for t=0 step 10 until 360:
        draw cass(8, 1, t) * dir t withpen pencircle scaled 1;
    endfor


endfig;
\end{mplibcode}
\end{document}

