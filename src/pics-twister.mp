\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input compass-rose
input colorbrewer-rgb
beginfig(1);
picture O; 
O = compass_rose(Blues 8 8, Reds 8 7) scaled 1/2;
%O = thelabel(TEX("\TeX"), origin) scaled 3;

numeric s; pair p; 
s = 108; 
p = origin;
draw O shifted p; draw bbox O withcolor 3/4[red, white]; label.urt("\small\texttt{bbox P}", point -1 of bbox O) withcolor 3/4[red, white];
p := (1s, 0); draw O rotated 30 shifted p; label("\small\texttt{rotated 30}",     p shifted 54 down);
p := (2s,+15); draw O shifted p;            label("\small\texttt{shifted 15 up}", p shifted 54 down);

p := ( 0, -1s); draw O scaled 3/4 shifted p;  label("\small\texttt{scaled 3/4}", p shifted 54 down);
p := (1s, -1s); draw O xscaled 3/4 shifted p;  label("\small\texttt{xscaled 3/4}", p shifted 54 down);
p := (2s, -1s); draw O yscaled 3/4 shifted p;  label("\small\texttt{yscaled 3/4}", p shifted 54 down);

p := ( 0, -2s); draw O slanted 3/4 shifted p;  label("\small\texttt{slanted 3/4}", p shifted 54 down);
p := (1s, -2s); draw O zscaled 3/4 dir 21 shifted p;  label("\small\texttt{zscaled 3/4 dir 21}", p shifted 54 down);
p := (2s, -2s); draw O reflectedabout(up, down) shifted p;  label("\small\texttt{reflectedabout(up, down)}", p shifted 54 down);

endfig;
\end{mplibcode}
\end{document}

