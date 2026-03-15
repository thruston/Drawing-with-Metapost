vardef do_brace(expr a, b, offset, r) =
  save d, e, m, n, brace, hook; pair e; path brace, hook[];
  d = angle(b-a);
  e = up scaled offset rotated d shifted r[a,b];
  n = 1/2 offset; m = abs(n); 
  hook1 =                         origin {0, n} .. (m, n) {1,0};
  hook2 = (-m,-n) {1,0} .. {0, n} origin {0,-n} .. (m,-n) {1,0};
  hook3 = (-m, n) {1,0} .. {0,-n} origin;
  brace = (hook1 rotated d shifted a --
           hook2 rotated d shifted e --
           hook3 rotated d shifted b) shifted (up scaled n rotated d);
  draw brace withpen pencircle yscaled .6 xscaled .1666 rotated d;
  point 3 of brace
enddef;
vardef do_coloured_brace(expr a, b, offset, r, shade) = 
  save d, e, m, n, brace, hook; pair e; path brace, hook[];
  d = angle(b-a);
  e = up scaled offset rotated d shifted r[a,b];
  n = 1/2 offset; m = abs(n); 
  hook1 =                         origin {0, n} .. (m, n) {1,0};
  hook2 = (-m,-n) {1,0} .. {0, n} origin {0,-n} .. (m,-n) {1,0};
  hook3 = (-m, n) {1,0} .. {0,-n} origin;
  brace = (hook1 rotated d shifted a --
           hook2 rotated d shifted e --
           hook3 rotated d shifted b) shifted (up scaled n rotated d);
  draw brace withpen pencircle yscaled .6 xscaled .1666 rotated d withcolor shade;
  point 3 of brace
enddef;
