\documentclass{standalone}
\usepackage{luamplib}
\usepackage{unicode-math}
\setmainfont[Numbers=OldStyle]{TeX Gyre Pagella}
\setmathfont{TeX Gyre Pagella Math}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path data, p;
data = (1967, 311)
    -- (1968, 332)
    -- (1969, 372)
    -- (1970, 385)
    -- (1971, 385)
    -- (1972, 393)
    -- (1973, 387)
    -- (1974, 381)
    -- (1975, 387)
    -- (1976, 400)
    -- (1977, 380);

numeric u, v;
u = xpart urcorner textext("1980\kern 0.75em");
v = 1.414;
p = data shifted -(xpart point 0 of data, 300) xscaled u yscaled v;
draw p;

for d = 300 step 20 until 400:
    numeric y; y =  (d - 300) * v;
    label.lft("\strut\scriptsize\$\,\small" & decimal d, (-12, y));
    draw (-8, y) -- (-12, y);
    if d > 370:
        draw (xpart point 3 of p, y) -- (xpart point infinity of p + 8, y)
            dashed evenly scaled 1/4 withpen pencircle scaled 1/4;
    fi
endfor
path a; a = (xpart point infinity of p + 21, (380 - 300) * v) 
         -- (xpart point infinity of p + 21, (400 - 300) * v);
interim ahangle := 180; 
interim ahlength := 2;
drawdblarrow a withpen pencircle scaled 1/4;
label("\small 5\%", point 1/2 of a shifted 12 right);

for t=0 upto length p: 
    numeric x, y; (x, y) = point t of p;
    undraw (x, y) withpen pencircle scaled 2 dotlabeldiam;
    draw (x, y) withpen pencircle scaled dotlabeldiam;
    draw (x, -8) -- (x, -12);
    label("\strut\small" & decimal xpart point t of data, (x, -20));
endfor

label.urt(btex \vbox{\halign{\small #\hfill\cr
Per capita\cr budget expenditure\cr in constant dollars\cr}} etex, 
(0, (410 - 300) * v));

picture p; p = currentpicture; currentpicture := nullpicture;
bboxmargin := 12;
fill bbox p withcolor 1/32(32, 32, 31);
draw p;

endfig;
\end{mplibcode}
\end{document}

