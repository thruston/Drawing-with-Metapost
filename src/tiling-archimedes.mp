\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
numeric u; u = 10;
path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
picture P[];
% (4,6,12)
numeric dx; dx = u*(1+ cosd(15)/sind(15));
picture unit; unit = image(
  path s; s = unitsquare shifted -(1/2,1/2) scaled u shifted (dx/2,0);
  for t=0 upto 2: 
    draw s rotated 120t; 
    for tt=1 upto 3:
      draw subpath(3,4) of s rotated (120t+30tt);
    endfor
  endfor
);
P1 = image(
  draw unit withpen pencircle scaled 4 withcolor .8[red,white];
  for x=-5dx step dx until 5dx:
    for y=-5dx step dx until 5dx:
      draw unit shifted (x,0) shifted ((y,0) rotated 60);
    endfor
  endfor
  clip currentpicture to box; draw box dashed withdots scaled 1/4;
  label.bot("$(4, 6, 12)$", point 1/2 of bbox currentpicture);
);
numeric dx; dx = u*(cosd(180/8)/sind(180/8));
path octagon; octagon = for t = 0 upto 7: 1/2(dx,u) rotated 45t -- endfor cycle; 
P2 = image(
  draw octagon withpen pencircle scaled 4 withcolor .8[red,white];
  for x=-5dx step dx until 5dx:
    for y=-5dx step dx until 5dx:
      draw octagon shifted (x,y);
    endfor
  endfor
  clip currentpicture to box; draw box dashed withdots scaled 1/4;
  label.bot("$(4, 8^2)$", point 1/2 of bbox currentpicture);
);

numeric dx; dx = u*(cosd(180/12)/sind(180/12));
path unit; unit = for t=0 upto 11: 1/2(dx,u) rotated 30t -- endfor cycle;
P3 = image(
  draw unit withpen pencircle scaled 4 withcolor .8[red,white];
  for x=-5dx step dx until 5dx:
    for y=-5dx step dx until 5dx:
      draw unit shifted (x,0) shifted ((y,0) rotated 60);
    endfor
  endfor
  clip currentpicture to box; draw box dashed withdots scaled 1/4;
  label.bot("$(3, 12^2)$", point 1/2 of bbox currentpicture);
);

% path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
% clip currentpicture to box; draw box dashed evenly;

% endfig;

% beginfig(4);
% % (6^3)
% save dx; dx = 3u;
% picture unit; unit = image(
%    for t=0 upto 2: 
%      draw origin -- (u,0) rotated 120t; 
%    endfor
% );

% draw unit withpen pencircle scaled 4 withcolor .8[red,white];

% for x=-5dx step dx until 5dx:
%   for y=-5dx step dx/3 until 5dx:
%     draw unit shifted (x,0) shifted (y,0) shifted ((y,0) rotated 60);
%   endfor
% endfor

% path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
% clip currentpicture to box; draw box dashed evenly;

% endfig;

% (3,4,6,4)
numeric dx; dx = u*(1+cosd(30)/sind(30));
picture unit; unit = image(
  path s; s = unitsquare shifted -(1/2,1/2) scaled u shifted (dx/2,0);
  for t=0 upto 2: 
    draw s rotated 120t; 
  endfor
);
P4 = image(
  draw unit withpen pencircle scaled 4 withcolor .8[red,white];
  for x=-5dx step dx until 5dx:
    for y=-5dx step dx until 5dx:
      draw unit shifted (x,0) shifted ((y,0) rotated 60);
    endfor
  endfor
  clip currentpicture to box; draw box dashed withdots scaled 1/4;
  label.bot("$(3, 4, 6, 4)$", point 1/2 of bbox currentpicture);
);

% beginfig(6);
% % (3,6,3,6)
% save dx; dx = 2u;
% path unit; unit = for t=0 upto 5: (u,0) rotated 60t -- endfor cycle;

% draw unit withpen pencircle scaled 4 withcolor .8[red,white];

% for x=-5dx step dx until 5dx:
%   for y=-5dx step dx until 5dx:
%     draw unit shifted (x,0) shifted ((y,0) rotated 60);
%   endfor
% endfor

% path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
% clip currentpicture to box; draw box dashed evenly;

% endfig;

% beginfig(7);
% % (4^4)
% save dx; dx = 4u;
% path unit; unit = unitsquare shifted -(1/2,1/2) scaled 2u;

% draw unit withpen pencircle scaled 4 withcolor .8[red,white];

% for x=-5dx step dx until 5dx:
%   for y=-5dx step dx until 5dx:
%     draw unit shifted (x,0) shifted (y/2,y/2);
%   endfor
% endfor

% path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
% clip currentpicture to box; draw box dashed evenly;

% endfig;

% beginfig(8);
% % (3^4,6)
% save dx; dx = 2u;
% picture unit; unit = image( 
%   for t=0 upto 5: draw ((2u,0) -- (u,0) 
%                  -- (u,0) rotated 60
%                  -- (u,0) rotated 60 shifted (u,0)
%                  ) rotated 60t; endfor
%   );

% draw unit withpen pencircle scaled 4 withcolor .8[red,white];

% for x=-5dx step dx until 5dx:
%   for y=-5dx step dx until 5dx:
%     draw unit shifted (x,0) shifted ((x/2,0) rotated -60)
%               shifted ((y,0) rotated 60) shifted (y/2,0);
%   endfor
% endfor

% path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
% clip currentpicture to box; draw box dashed evenly;

% endfig;
% beginfig(9);
% % (3^2,4,3,4)
% save dx; dx = u;
% picture unit; unit = image( 
%   for t=0 upto 3: draw ( (u/2,-u/2) -- (u/2+u*sqrt(3)/2,0) -- (u/2,u/2) -- cycle) rotated 90t; endfor
%   );

% draw unit withpen pencircle scaled 4 withcolor .8[red,white];

% for x=-5dx step dx until 5dx:
%   for y=-5dx step dx until 5dx:
%     draw unit shifted (x,0) shifted ((x,0) rotated 30)
%               shifted (0,y) shifted ((0,y) rotated 30);
%   endfor
% endfor

% path box; box = unitsquare shifted -(1/2,1/2) scaled 12u;
% clip currentpicture to box; draw box dashed evenly;

% endfig;
beginfig(1);
  draw P1;
  draw P2 shifted (12.5u, 0);
  draw P3 shifted (0, -14.4u);
  draw P4 shifted (12.5u, -14.4u);

endfig;
\end{mplibcode}
\end{document}
