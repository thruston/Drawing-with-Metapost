\documentclass{standalone}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\usepackage{fontspec}
\setmainfont[Numbers=OldStyle]{TeX Gyre Pagella}
\begin{document}
\begin{mplibcode}
input tufte-manila-paper
beginfig(1);
path data, p; numeric n, u, v;
data = (1978, 18) -- (1979, 19) -- (1980, 20) -- (1981, 22) --
       (1982, 24) -- (1983, 26) -- (1984, 27) -- (1985, 27.5);
u = xpart urcorner textext("1980\quad"); v = 7; 
p = data shifted -(1978, 0) xscaled u yscaled v; 

draw p;
for i=0 upto length p: 
  z[i] = point i of p;  
  undraw z[i] withpen pencircle scaled 2 dotlabeldiam;
  dotlabel.top("\strut" & decimal ypart point i of data, z[i]);
  label("\strut" & decimal xpart point i of data, (x[i], 12));
  draw (x[i], 0) -- (x[i], 4);
endfor
draw (x0, 20) -- z0; draw (x7, 20) -- z7; draw (x0, 0) -- (x7, 0);

dotlabel.rt(btex \vbox to 6pt{\halign{\small #\hss\cr
  13.7 mpg, average\cr for all cars on\cr road, 1978\cr
  }\vss} etex, (x0, 13.7v));
dotlabel.lft(btex \vbox to 6pt{\halign{\small #\hss\cr
  19.5 mpg, expected\cr average for all cars\cr on road, 1985\cr
  }\vss} etex, (x7, 19.5v));
label.top(btex \vbox{\halign{\hss\textsc{#}\hss\cr
  required fuel economy standards:\cr
  new cars built from 1978 to 1985\cr}} etex,
  point 5/2 of bbox currentpicture shifted 13 up);
endfig;
\end{mplibcode}
\end{document}
