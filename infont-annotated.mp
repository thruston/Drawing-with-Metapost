\documentclass[border=2mm]{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
picture p, pp;
p  = "proof" infont "pplri8r" scaled 4;
pp = "proof" infont "pplri8r" scaled 8;
(wd, ht) = urcorner pp;
(xx, dp) = llcorner pp;
xheight = ypart urcorner ("x" infont "pplri8r" scaled 8); 

beginfig(3);
drawoptions( withpen pencircle scaled .5 withcolor .7[.74 red, white]);
draw origin -- (0,ht) -- (wd, ht) -- (wd, dp) -- (0,dp) -- cycle;
for y=0,xheight:
  draw (0,y) -- (wd,y);
endfor
draw bbox pp dashed withdots scaled 1/4;
drawoptions();
draw pp withcolor .5 white;
fill fullcircle scaled 4 shifted center pp withcolor .7[3/4 red,white];

vardef east primary p = 1/2[urcorner p, lrcorner p] enddef;
vardef west primary p = 1/2[ulcorner p, llcorner p] enddef;
vardef eastx primary p = lrcorner p shifted (+1,3) enddef;
vardef westx primary p = llcorner p shifted (-1,3) enddef;

picture c[]; ahangle := 30; string s[];
c0 = "center"   infont "pplr8r" shifted center pp shifted (21,27);
c1 = "urcorner" infont "pplr8r" shifted urcorner pp shifted (13,8);
c2 = "ulcorner" infont "pplr8r" shifted ulcorner pp; c2 := c2 shifted (-13-xpart urcorner c2,8);
c3 = "llcorner" infont "pplr8r" shifted llcorner pp; c3 := c3 shifted (-13-xpart urcorner c3,-13);
c4 = "lrcorner" infont "pplr8r" shifted lrcorner pp shifted (13,-13);
c5 = "bboxmargin" infont "pplr8r" scaled 0.8;
draw c0 withcolor .67 red; drawarrow center c0 .. {dir -120} center pp shifted ( 1, 3) cutbefore bbox c0;
draw c1 withcolor .67 red; drawarrow westx c1 .. {dir -120} urcorner pp shifted ( 1, 1);
draw c2 withcolor .67 red; drawarrow eastx c2 .. {dir  -60} ulcorner pp shifted (-1, 1);
draw c3 withcolor .67 red; drawarrow eastx c3 .. {dir  +60} llcorner pp shifted (-2,-2);
draw c4 withcolor .67 red; drawarrow westx c4 .. {dir +120} lrcorner pp shifted ( 1,-1);
label.bot(c5, point 1/2 of bbox pp) withcolor 1/4[.67 red, white];

c6 = ("x-height" infont "pplr8r"); c6 := c6 shifted (-13-xpart urcorner c6,xheight-2.2);
c7 = ("origin" infont "pplr8r"); c7 := c7 shifted (-13-xpart urcorner c7,-2.2);
draw c6 withcolor .67 blue; drawarrow (-12,xheight) -- (-1,xheight);
draw c7 withcolor .67 blue; drawarrow (-12,0) -- (-1,0);
endfig;
\end{mplibcode}
\end{document}
