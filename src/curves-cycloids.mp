\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
beginfig(1);
  numeric pi, r, theta; pi = 3.141592653589793; r = 42; theta = 81;
  path cycloid; 
  for t=-80 step 5 until 440:
    cycloid := if known cycloid: cycloid -- fi 
        (0, -r) rotated -t shifted (t/180*pi*r, r);
  endfor;
  path wheel; 
  z1 = (theta/180*pi*r, r);       
  wheel = reverse fullcircle scaled 2r rotated -(90 + theta) shifted z1;
  z2 = point 0 of wheel;
  path a[]; u = 1/16; % u = a little shortening
  a1 = subpath -(theta/45-u,u) of wheel shifted -z1 scaled 5/8 shifted z1;
  a2 = subpath (.3, 1.4) of wheel shifted -z1 scaled 1.08 shifted z1; 
  a3 = a2 rotatedabout(z1, 170);
  path xx, yy;
  xx = (xpart point 0 of cycloid, 0) -- (xpart point infinity of cycloid,0);
  yy = (down -- 5 up) scaled 1/2 r;

  ahangle := 30;
  drawarrow xx withcolor 1/2; label.rt (btex $x$ etex, point 1 of xx);
  drawarrow yy withcolor 1/2; label.top(btex $y$ etex, point 1 of yy);

  draw cycloid withcolor .67 red;
  draw wheel withcolor .67 blue;
  drawarrow a1; drawarrow a2; drawarrow a3;
  draw (0,y2) -- z2 -- (x2,0) dashed withdots scaled 1/4;
  draw z2 -- z1 -- (x1,0); 
  draw z1 withpen pencircle scaled dotlabeldiam;
  draw z2 withpen pencircle scaled dotlabeldiam;

  label(btex $\theta$ etex, z1 + 3/4r * dir (270 - 1/2 theta));
  label.bot(btex $\mathstrut 2\pi r$ etex, (2pi*r,0));
  label.bot(btex $\mathstrut r\theta$ etex, (x1,0));
  label.bot(btex $\mathstrut x$ etex, (x2,0));
  label.lft(btex $y$ etex, (0,y2));
  label.top(btex $r$ etex, 1/2[z1, z2]);
  dotlabel.top(btex $(\pi r,2r)$ etex, (pi*r,2r));
  label.rt(btex $\vcenter{\halign{&$#$\hfil\cr 
    x=r(\theta-\sin\theta)\cr 
    y=r(1-\cos\theta)\cr}}$ etex, (pi*r,r));
endfig;
\end{mplibcode}
\end{document}
