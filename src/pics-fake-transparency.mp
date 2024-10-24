\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
% parameters
u = 1cm;
ymax = xmax = 2.75;
xmin = ymin = -1.75;

% make a plain grid
path xx, yy;
xx = ((xmin,0) -- (xmax,0)) scaled u;
yy = ((0,ymin) -- (0,ymax)) scaled u;

drawoptions(dashed withdots scaled 1/4 withcolor 3/4 white);
for i = ceiling ymin upto floor ymax: draw xx shifted (0,i*u); endfor
for i = ceiling xmin upto floor xmax: draw yy shifted (i*u,0); endfor

drawoptions(withpen pencircle scaled .7);
xx := xx scaled 1.05;
yy := yy scaled 1.05;
drawarrow xx;
drawarrow yy;
drawoptions();

% Large A
label.urt("A" infont defaultfont scaled 8, origin) withcolor 1/4 green;
% the "transparent" box
path shape; shape = (superellipse(right, up, left, down, 0.81)) 
  shifted 1/2 right scaled 30 rotated 30;
alpha = 5/8;  % alpha: 0=invisible, 1=opaque
color filler; filler = .95[red,white];
picture bg; bg = currentpicture;  % capture the current drawing
picture fg; fg = image(         
  for e within bg:  % redraw everything with blended color
    draw e withcolor alpha[colorpart e, filler];
  endfor         
  draw shape withpen pencircle scaled 2 withcolor 3/4;
  draw subpath (2.718, 3.1415) of shape  % add decoration
      shifted - center shape scaled 7/8 shifted + center shape
      withpen pencircle scaled 2 withcolor white;
);
clip fg to shape; % finally clip the fg drawing 
fill shape withcolor filler;   % fill the shape
draw fg;           % and put the fg back on top
draw shape withcolor 3/4 blue;
endfig;
\end{mplibcode}
\end{document}
