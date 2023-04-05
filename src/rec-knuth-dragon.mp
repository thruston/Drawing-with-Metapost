
\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

vardef do_dragon(expr a, b, c, offset, depth) = 
   save m; pair m; m := c rotatedabout(.5[a,b],90);
   corners[floor (0.5+offset+2**depth)] := m;
   if depth>0:
     do_dragon(a,m,a,offset,depth-1);
     do_dragon(m,b,b,offset+2**depth,depth-1);
   fi
enddef;

beginfig(1);

depth = 8;
pair a, b;
a = origin; b = right scaled 13cm if odd(depth): rotated 45 fi;

pair corners[];
corners[floor (0.5+2**depth)] = b;
do_dragon(a,b,a,0,depth-1);

path dragon; 
dragon = a for i=1 upto 2**depth: -- corners[i] endfor;
dragon := reverse dragon rotated 180 & dragon;

path curly_track;
curly_track = point 0 of dragon {direction 0 of dragon} for t=1/2 upto length(dragon): 
                  .. {direction t of dragon} point t of dragon 
                endfor .. {direction length(dragon) of dragon} point length(dragon) of dragon;

u = length(point 1 of dragon - point 2 of dragon);
path frame; frame = llcorner dragon + (-u,-u)/2
                 -- lrcorner dragon + (+u,-u)/2
                 -- urcorner dragon + (+u,+u)/2
                 -- ulcorner dragon + (-u,+u)/2 -- cycle;

% background
fill frame withcolor (1,1,31/32);

% track
for s = .4, .8, 1:
    draw curly_track withpen pencircle scaled (2.6-2s) withcolor s[1/6 red+ 1/3 green, 1/2 red+ 1/2 green];
endfor
draw curly_track rotated 90 withcolor red;

% tiles grid
n := 0;
for x = 0 step u until length(lrcorner frame - llcorner frame):
  draw (llcorner frame -- ulcorner frame) shifted (x,0) withcolor .8 white;
  if incr n mod 10 = 0: label.bot(decimal n, llcorner frame shifted (x+u,0)); fi
endfor  
n := 0;
for y = 0 step u until length(ulcorner frame - llcorner frame):
  draw (llcorner frame -- lrcorner frame) shifted (0,y) withcolor.8 white;
  if incr n mod 10 = 0: label.lft(decimal n, llcorner frame shifted (0,y+u)); fi
endfor
for x = 0 step u until length(lrcorner frame - llcorner frame):
  draw (llcorner frame -- ulcorner frame) shifted (x-1/4, 0) withpen pencircle scaled 1/4 withcolor .3 white;
endfor  
for y = 0 step u until length(ulcorner frame - llcorner frame):
  draw (llcorner frame -- lrcorner frame) shifted (0,y+1/4) withpen pencircle scaled 1/4 withcolor.3 white;
endfor

% frame
draw frame withpen pencircle scaled 2 withcolor 3/4 red + 1/4 green;

endfig;
% input ttcolors;
% beginfig(2);
% picture q; q = image(
%    for t=0 step 90 until 270:
%      draw curly_track rotated t withcolor hsv_color(t/1.414,1,.7);
%    endfor);
% draw q; 
% draw q shifted 2b;
% draw q shifted b shifted (b rotated 90);
% draw q shifted b shifted (b rotated -90);
% endfig;
\end{mplibcode}
\end{document}

