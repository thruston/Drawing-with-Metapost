% return a <pair> with the two times on C that
% correspond to the external tangents from p to C
vardef tangent_times(expr C, p) = 
  save m, o, G, H, a, b;
  pair m, o; path G, H; numeric a, b;
  o = center C; m = 1/2[o, p];
  H = halfcircle zscaled (p-o) shifted m;
  G = halfcircle zscaled (o-p) shifted m;
  (a, whatever) = C intersectiontimes H;
  (b, whatever) = C intersectiontimes G;
  (a, b if b < a: + 8 fi)
enddef;
