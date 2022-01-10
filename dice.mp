\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
vardef dice(expr pip_count, pip_color) = 
  save d,r,p, ul, ur, lr, ll; 
  r=1/8; path d; picture p;
  %d = (for i=0 upto 3: subpath (r+i,1+i-r) of unitsquare .. endfor cycle) scaled 30;
  d = for i=0 upto 3: quartercircle scaled 3 shifted (15,15) rotated 90i -- endfor cycle;
  p = image(draw fullcircle scaled 6; fill fullcircle scaled 6 withcolor pip_color);
  pair ul, ur, ll, lr;
  ul = 1/5[ulcorner d, lrcorner d];
  lr = 4/5[ulcorner d, lrcorner d];
  ur = 1/5[urcorner d, llcorner d];
  ll = 4/5[urcorner d, llcorner d];
  image(fill d withcolor background; draw d;
  if odd(pip_count):
     draw p shifted center d;
  fi;
  if pip_count > 1:
     draw p shifted ul;
     draw p shifted lr;
  fi;
  if pip_count > 3:
     draw p shifted ur;
     draw p shifted ll;
  fi;
  if pip_count = 6:
     draw p shifted 1/2[ul,ur];
     draw p shifted 1/2[ll,lr];
  fi)
enddef;

beginfig(1);
for i=0 upto 4:
  draw dice(1+floor uniformdeviate 6, red) rotated (2 normaldeviate) shifted (36i,0);
endfor
endfig;
\end{mplibcode}
\end{document}
