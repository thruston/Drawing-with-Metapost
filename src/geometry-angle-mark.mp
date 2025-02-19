vardef angle_mark@#(expr a, b, c, r) = 
  save n, interval, P; numeric n, interval; picture P;
  n = if str @# = "": 1 else: @# fi;
  interval = 6 sqrt(n-1)/n;
  P = image(for i = -(n-1)/2 upto (n-1)/2:
    draw fullcircle scaled (2r + i * interval) shifted b;
  endfor); clip P to a--b--c--cycle; P
enddef;
