\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb

path unithex; 
unithex = for i = 0 upto 5: dir 60i -- endfor cycle;
unithex := unithex shifted - point 4 of unithex;

def fixed_at_point expr n of p =
  zscaled (point n of p - point n+1 of p) shifted point n+1 of p
enddef;

beginfig(1);
  path dodo, h[], s[];
  dodo = for i = 1 upto 12: 21 dir (15 + 30i) -- endfor cycle;
  h1 = unithex fixed_at_point 1 of dodo;
  h2 = unithex fixed_at_point 3 of dodo;
  s1 = unitsquare fixed_at_point 0 of dodo;
  s2 = unitsquare fixed_at_point 2 of dodo;
  s3 = unitsquare fixed_at_point 4 of dodo;

  picture colour_unit, line_unit;
  colour_unit = image(
    fill dodo withcolor Greens 9 2;
    fill h1 withcolor Greens 9 3;
    fill h2 withcolor Greens 9 3;
    fill s1 withcolor Greens 9 4;
    fill s2 withcolor Greens 9 4;
    fill s3 withcolor Greens 9 4;
  );
  line_unit = image(
    forsuffixes $=dodo, s1, s2, s3, h1, h2:
      draw $ withpen pencircle scaled 1/4;
      pair m; m = center $;  % all shapes have even number of sides
      for i=1 upto length $:
        cutdraw m -- point i - 1/2 of $
          if odd i: cutbefore fullcircle scaled (length $ / 4) shifted m fi 
          withpen pencircle scaled 1/4
          withcolor Reds 4 3;
      endfor
    endfor
  );

  pair u, v;
  u = point 3 of s2 - point 8 of dodo;
  v = u rotated 60;

  numeric n; n = 4;
  forsuffixes @ = colour_unit, line_unit:
    for i=-n upto n:
      for j=-n upto n:
        draw @ shifted (i*u + j*v - floor(i/2) * v);
      endfor
    endfor
  endfor

  clip currentpicture to bbox dodo scaled 2n yscaled sqrt(3/4);
endfig;
\end{mplibcode}
\end{document}
