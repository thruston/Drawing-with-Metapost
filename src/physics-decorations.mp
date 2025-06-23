vardef springy(expr P, N) = 
  save n, a, s, t; 
  numeric n, a, s, t; n = N + 3; a * n = arclength P;
  subpath (0, arctime a of P) of P &
    point arctime a of P of P {up rotated angle direction arctime a of P of P}
    for i = 2 upto n - 5/2:
      hide(s := arctime i * a - a / 2 of P; t := arctime i * a of P;) 
      ..
      point s of P shifted 2 unitvector(direction s of P rotated 90)
      .. 
      reverse halfcircle yscaled 2
        rotated (180 + angle direction t of P) 
        shifted (point t of P - 2 unitvector(direction t of P rotated 90))
    endfor ... subpath (arctime (n - 2) * a of P, length P) of P
enddef;
