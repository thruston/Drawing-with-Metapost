numeric u; u = 1cm; 
path axis; axis = (4.5 left -- 6.5 right) scaled u;
drawarrow axis; 
for i = -4 upto 6: 
  draw (2 up -- 2 down) shifted (i * u, 0);
  label.top(TEX("\strut $" & decimal i & "$"), (i * u, 0));
endfor
