\documentclass[border=5mm]{standalone}
\usepackage{fontspec}
\setmainfont{Lato Light}
\usepackage{lete-sans-math}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\begin{document}
\begin{mplibcode}
input geometry-tangent-times
beginfig(1);
path sun, moon, earth, lunar_orbit;
numeric r[]; 
r0 = 25; r1 = 1/3 r0; r2 = 2 r0;
z0 = origin; z1 = 68 left; z2 = 320 left;


earth = fullcircle scaled 2 r0 shifted z0;
 moon = fullcircle scaled 2 r1 shifted z1;
  sun = fullcircle scaled 2 r2 shifted z2;

lunar_orbit = subpath(3.4, 4.6) of fullcircle scaled 2 abs(z1-z0) shifted z0; 

  % interior tangents
  numeric t, u;
  (t, u) = tangent_times(fullcircle scaled 2(r2-r1) shifted z2, z1);
  numeric v, w;
  (v, w) = tangent_times(fullcircle scaled 2(r2+r1) shifted z2, z1);

  path ray[];
  ray1 = point t of sun -- 2[point t of sun, point t of moon] cutafter earth;
  ray2 = point u of sun -- 2[point u of sun, point u of moon] cutafter reverse earth;
  ray3 = point v of sun -- 1.4[point v of sun, point v+4 of moon] cutafter earth;
  ray4 = point w of sun -- 1.4[point w of sun, point w+4 of moon] cutafter reverse earth;

  path umbra, penumbra;

  umbra =   subpath (u, t+8) of moon -- point 1 of ray1 -- point 1 of ray 2 -- cycle;
  penumbra = subpath (w+4, v+4) of moon --
     point 1 of ray3 {direction 1 of ray3 rotated 90} ..
     point 1 of ray4 {direction 1 of ray4 rotated 90} -- cycle;

  
  fill penumbra withcolor 7/8;
  fill umbra withcolor 3/4;

  forsuffixes @=1,2,3,4: draw ray@ dashed evenly scaled 1/2 withpen pencircle scaled 1/4; endfor

    ahangle := 30;
  drawarrow lunar_orbit dashed evenly;

  unfill moon;
  forsuffixes $=earth, moon:
    fill subpath (-2, 2) of $ -- cycle withcolor 1/2; 
    draw $;
  endfor;
  draw sun;
  label("Earth", z0 + (0, r0 + 16));
  label("Moon", z1 + (0, r0 + 16));
  label("Sun", z2);

  vardef pinlabel@#(expr t, z, dz) = 
    draw z--(z+dz) withpen pencircle scaled 1/4;
    label@#(t, z+dz);
  enddef;

  pinlabel.bot("Umbra", 3/4[z0,z1], 36 down);
  pinlabel.bot("Penumbra", .7[z0, point 4 of earth], 50 down); 


endfig;
\end{mplibcode}
\end{document}

