\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
vardef dice(expr pip_count, pip_color) = 
  save d,r,p, ul, ur, lr, ll; r = 1/8; 
  path d; d = for i=0 upto 3: 
     quartercircle scaled 3 shifted (15,15) rotated 90i -- 
  endfor cycle;
  picture p; p = image(
     fill fullcircle scaled 6 withcolor pip_color;
     draw fullcircle scaled 6; 
  );
  pair ul, ur, ll, lr;
  ul = 1/5[ulcorner d, lrcorner d]; ur = 1/5[urcorner d, llcorner d];
  ll = 4/5[urcorner d, llcorner d]; lr = 4/5[ulcorner d, lrcorner d];
  image(
     fill d withcolor (1, 0.96, 0.8); draw d;  
     if odd(pip_count):
        draw p shifted center d;
     fi;
     if pip_count > 1:
        draw p shifted ul; draw p shifted lr;
     fi;
     if pip_count > 3:
        draw p shifted ur; draw p shifted ll;
     fi;
     if pip_count = 6:
        draw p shifted 1/2[ul,ll]; draw p shifted 1/2[ur,lr];
     fi
  )
enddef;
beginfig(1);
for i=0 upto 4:
  draw dice(1+floor uniformdeviate 6, if odd i: red else: blue fi) 
    rotated (2 normaldeviate) shifted (36i,0);
endfor
endfig;
\end{mplibcode}
\end{document}
