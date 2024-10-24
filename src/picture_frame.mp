% Toby Thurston -- 16 Apr 2021 
% Draw a kitsch picture frame round a path or picture 

color gold, dark, grey;
gold = 1/256(243, 197, 127);
dark = 1/256(144, 87, 50);
grey = 1/256(156, 147, 138);

picture ball; ball = image(for i=0 upto 16:
  fill interpath(i/16, 
    fullcircle scaled 10, 
    fullcircle scaled 3 shifted (-2, 2)
  ) withcolor (i/16)[gold, 15/16 white];
endfor) scaled 1/4;

newinternal pf_width; pf_width := 21;

vardef frame expr P = 
  save base, side, f, t, u, xx; 
  picture base, side; path f; numeric t, u, xx;
  t = arclength subpath (0,1) of bbox P;
  u = arclength subpath (1,2) of bbox P;
  xx = max(t, u) + 2 pf_width;
  f = unitsquare xscaled xx yscaled pf_width;
  % convenience / nonce function
  vardef paint_strip(expr y, wd, shade) =
    draw subpath (0, 1) of f 
      shifted (0, if y < 0: pf_width + fi y)
      withpen pencircle scaled wd
      withcolor shade
  enddef;
  base = image(
    fill f withcolor gold; % background colour
    paint_strip(2,    3,   5/4 grey);  % grey strips
    paint_strip(3.5,  1/4, grey);
    paint_strip(5,    1/4, 1/2[gold, dark]);
    paint_strip(-6.5, 1/4, 1/2[gold, dark]);
    paint_strip(-6,   1/4, 1/2[gold, dark]);
    paint_strip(-2,   2,   5/4 grey);
    % spatter with random spots
    for i=0 upto 4 * arclength(subpath (0,1) of f):
      fill fullcircle scaled uniformdeviate 3/4
        shifted (uniformdeviate xx, uniformdeviate pf_width)
        withcolor dark;
    endfor
    % decorative balls
    for x = 2 step 3 until xx:
      draw ball shifted (x, 2);
    endfor
  );
  % make two trapezium shapes
  side = base;
  clip side to (pf_width, 0) -- (pf_width + u, 0) 
    -- (2 pf_width + u, pf_width) -- (0, pf_width) -- cycle;
  clip base to (pf_width, 0) -- (pf_width + t, 0) 
    -- (2 pf_width + t, pf_width) -- (0, pf_width) -- cycle;
  % arrange the pieces into a square
  image(
    draw base rotated 180 shifted point 1 of bbox P shifted (+pf_width, 0);
    draw base rotated   0 shifted point 3 of bbox P shifted (-pf_width, 0);
    draw side rotated  90 shifted point 0 of bbox P shifted (0, -pf_width);
    draw side rotated 270 shifted point 2 of bbox P shifted (0, +pf_width);
  )
enddef;
