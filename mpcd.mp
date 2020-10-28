\documentclass[border=5mm]{standalone}
\usepackage{luatex85}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}


def drawlblarrow(expr label_for_arrow, time_on_path, offset, path_for_arrow) = 
  draw thelabel(label_for_arrow, origin)
       shifted (up scaled offset rotated angle direction time_on_path of path_for_arrow)
       shifted point time_on_path of path_for_arrow;
  _apth := path_for_arrow cutbefore fullcircle scaled 16 shifted point 0 of path_for_arrow
                          cutafter  fullcircle scaled 16 shifted point infinity of path_for_arrow;
  _finarr
enddef;

beginfig(1);
    interim ahangle := 30;
    -x0 = x1 = -x2 = x3 = y0 = y1 = -y2 = -y3 = 34;

    picture p; p = image(draw for i=0 upto 7: 5 up rotated 102.857142857i -- endfor cycle;);
    
    label("$a$", z0);
    label("$b$", z1);
    label("$c$", z2);
    label("$d$", z3);

    drawlblarrow(p, 0.5, 7, z0 -- z1);
    drawlblarrow("$g$", 0.5, 7, z1 -- z3);
    drawlblarrow("$s$", 0.5, -7, z0 -- z2);
    drawlblarrow("$t$", 0.5, -7, z2 -- z3);

endfig;
\end{mplibcode}
\end{document}

