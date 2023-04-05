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
data = (1978, 18)
    -- (1979, 19)
    -- (1980, 20)
    -- (1981, 22)
    -- (1982, 24)
    -- (1983, 26)
    -- (1984, 27)
    -- (1985, 27.5);
numeric u, v;
u = xpart urcorner textext("1980\kern 0.75em");
v = 8;
p = data shifted -(xpart point 0 of data, 0) xscaled u yscaled v;
draw (xpart point 0 of p, 20) -- p -- (xpart point infinity of p, 20);
draw (xpart point 0 of p, 0) -- (xpart point infinity of p, 0);

for t=0 upto length p: 
    numeric x, y; (x, y) = point t of p;
    undraw (x, y) withpen pencircle scaled 2 dotlabeldiam;
    draw (x, y) withpen pencircle scaled dotlabeldiam;
    label("\strut" & decimal ypart point t of data, (x, y + 8));
    draw (x, 0) -- (x, 4);
    label("\strut" & decimal xpart point t of data, (x, 12));
endfor

dotlabel.rt(btex \vbox to 6pt{\halign{\small #\hss\cr
13.7 mpg, average\cr for all cars on\cr road, 1978\cr}\vss} etex, 
(xpart point 0 of p, 13.7v));
dotlabel.lft(btex \vbox to 6pt{\halign{\small #\hss\cr
19.5 mpg, expected\cr average for all cars\cr on road, 1985\cr}\vss} etex, 
(xpart point infinity of p, 19.5v));

label.top(btex \vbox{\halign{\hss\textsc{#}\hss\cr
required fuel economy standards:\cr
new cars built from 1978 to 1985\cr}} etex,
point 5/2 of bbox currentpicture shifted 21 up);

picture p; p = currentpicture; currentpicture := nullpicture;
bboxmargin := 12;
fill bbox p withcolor 1/32(32, 32, 31);
draw p;

endfig;
\end{mplibcode}
\end{document}

