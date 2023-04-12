\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
path h[], snake;
h0 = (for i = 1 upto 6: 40 dir 60i -- endfor cycle) rotated angle (9, -sqrt(3));
for i = 1 upto 6:
    h[i] = h0 shifted (point 0 of h0 - point 2 of h0) rotated 60i;
endfor
snake = point 0 of h3 -- point 1 of h2 -- point 2 of h1 
                      -- point 1 of h6 -- point 2 of h5 -- point 3 of h0 
                      -- point 1 of h4 -- point 0 of h5;

for i=1 upto 6:
    draw subpath (4, 9) of h[i] withcolor 3/4;
endfor

% path usnake; 
%     usnake = snake 
%         shifted - point 0 of h3
%         scaled (1/abs(point 0 of h3 - point 0 of h5));

% def zx(expr a, b) = zscaled (point b of snake - point a of snake) 
%     shifted point a of snake enddef;

% draw usnake zx(1, 0) dashed withdots scaled 1/2 withcolor 2/3 red;
% draw usnake zx(1, 2) dashed withdots scaled 1/2 withcolor 2/3 red;
% draw usnake zx(2, 3) dashed withdots scaled 1/2 withcolor 2/3 red;
% draw usnake zx(3, 4) dashed withdots scaled 1/2 withcolor 2/3 red;
% draw usnake zx(5, 4) dashed withdots scaled 1/2 withcolor 2/3 red;
% draw usnake zx(6, 5) dashed withdots scaled 1/2 withcolor 2/3 red;
% draw usnake zx(6, 7) dashed withdots scaled 1/2 withcolor 2/3 red;


draw 2/3[point 0 of h3, point 0 of h5] -- point 0 of h5 withcolor 1/2;
drawarrow point 0 of h3 -- 2/3[point 0 of h3, point 0 of h5] withcolor 1/2;
draw snake withcolor 2/3 red;
for t=1, 5, 6: 
    drawarrow subpath (t, t-2/3) of snake withcolor \mpcolor{textred};
endfor
for t=1, 2, 3, 6:
    drawarrow subpath (t, t+2/3) of snake withcolor \mpcolor{textred};
endfor

dotlabel.llft("$(0, 0)$", point 0 of h3);
dotlabel.lrt ("$(1, 0)$", point 0 of h5);
endfig;
\end{mplibcode}
\end{document}

