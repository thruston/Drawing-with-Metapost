\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  numeric w, h, n; w = 377; h = 80; n = 500;

  draw (origin--right) scaled w;
  draw (origin--right) scaled w shifted (0,+h/2) withcolor 3/4;
  draw (origin--right) scaled w shifted (0,-h/2) withcolor 3/4;

  pair zenith, nadir; zenith = nadir = origin;
  color gain, lose; gain = .67 blue; lose = .85 red;
  for i=1 upto 8:
    path walk;
    numeric y; y = 0;
    walk = origin for x=w/n step w/n until w: 
      hide(
        y := y if uniformdeviate 1 < 1/2: + else: - fi 1;
        if y > ypart zenith: zenith := (x,y) ; fi
        if y < ypart nadir:  nadir  := (x,y) ; fi
      ) 
      -- (x,y) 
    endfor;
    undraw walk withpen pencircle scaled 3/4;
    draw walk withcolor (1/2+y/h)[lose, gain];
  endfor
  draw origin withpen pencircle scaled 2;
  drawarrow (12 up -- 2 up) shifted zenith withcolor gain;
  drawarrow (12 down -- 2 down) shifted nadir  withcolor lose;
endfig;
\end{mplibcode}
\end{document}
