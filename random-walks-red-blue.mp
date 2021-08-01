\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    randomseed := 3.1415;
    color tr, tb; tr = 0.84 red; tb = 1.2(.2,.2,.7);
    numeric w, h, n; w = 377; h = 80; n = 500;
    pair zenith, nadir; zenith = nadir = origin;
    path walk[];

    draw (origin--right) scaled w;
    draw (origin--right) scaled w shifted (0,+h/2) withcolor 3/4;
    draw (origin--right) scaled w shifted (0,-h/2) withcolor 3/4;

    for i=1 upto 8:
        numeric y; y = 0;
        walk[i] = origin for x=w/n step w/n until w: 
         hide(
           y := y if uniformdeviate 1 < 1/2: + else: - fi 1;
           if y > ypart zenith: zenith := (x,y) ; fi
           if y < ypart nadir:  nadir  := (x,y) ; fi
         ) 
         -- (x,y) 
      endfor;
      undraw walk[i] withpen pencircle scaled 3/4;
      draw walk[i] withcolor (1/2+y/h)[tr, tb];
      label.rt("$\scriptstyle" & decimal i & "$", 
        point infinity of walk[i] 
        if     i=1: shifted (-3, 3)
        elseif i=3: shifted (1,3)
        elseif i=5: shifted (-3, 3)
        elseif i=7: shifted (-1, -4) fi);
    endfor

    drawarrow (12 up   -- 2 up  ) shifted zenith withcolor tb;
    drawarrow (12 down -- 2 down) shifted nadir  withcolor tr;

    fill fullcircle scaled 2;

endfig;
\end{mplibcode}
\end{document}

