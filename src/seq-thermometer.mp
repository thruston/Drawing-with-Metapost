\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
vardef scale@#(expr ht, lo, hi, zero, major, minor, mark_vector) = image(
    save u; numeric u;
    u = ht / (hi-lo);
    for i = lo step minor until hi:
        if i mod major = 0:
            draw (origin -- 4 mark_vector) shifted (0, (i - zero) * u);
            label@#("$" & decimal i & "$", 6 mark_vector shifted (0, (i - zero) * u));
        else:
            draw (origin -- 2 mark_vector) shifted (0, (i - zero) * u);
        fi
    endfor
) enddef;

draw scale.lft(4in, -40, 104, 32, 10, 1, left) shifted 2 left;
draw scale.rt (4in, -40,  40,  0,  5, 1, right) shifted 2 right;

path bulb; numeric dc; 80dc = 4in;
bulb = subpath (3,9) of fullcircle scaled 12 shifted (0, -42.5dc) 
 .. (2, -40dc) -- (2, 42dc) {up} .. (-2, 42dc) -- (-2, -40dc) .. cycle;

picture Hg; Hg = image(
for t=0 step 1/4 until 44: 
    draw (left--right) scaled 4 shifted (0, t*dc) withpen pencircle scaled 1 withcolor (t/74)[white, red];
    draw (left--right) scaled 8 shifted (0,-t*dc) withpen pencircle scaled 1 withcolor (t/74)[white, blue];
endfor);  clip Hg to bulb; draw Hg;
draw bulb;

label.top("°F", (-18, 43dc));
label.top("°C", (+18, 43dc));

numeric x; x = 38;
dotlabeldiam := 3/2;
dotlabel.rt("\textit{\tiny UK record high}", (x,  40.3dc));
dotlabel.rt("\textit{\tiny Heat emergency}", (x,  37dc));
dotlabel.rt("\textit{\tiny Heatwave}",       (x,  32dc));
dotlabel.rt("\textit{\tiny Hot}",            (x,  27dc));
dotlabel.rt("\textit{\tiny Warm}",           (x,  22dc));
dotlabel.rt("\textit{\tiny Pleasant}",       (x,  17dc));
dotlabel.rt("\textit{\tiny Mild / Cool}",    (x,  11dc));
dotlabel.rt("\textit{\tiny Cold}",           (x,   7dc));
dotlabel.rt("\textit{\tiny Very cold}",      (x,   3dc));
dotlabel.rt("\textit{\tiny Freezing}",       (x,   0dc));
dotlabel.rt("\textit{\tiny Severe frost}",   (x,  -5dc));
dotlabel.rt("\textit{\tiny Bitterly cold}",  (x, -10dc));
dotlabel.rt("\textit{\tiny UK record low}",  (x, -27.2dc));
        
endfig;
\end{mplibcode}
\end{document}

