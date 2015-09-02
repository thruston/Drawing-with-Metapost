prologues := 3;
outputtemplate := "%j%c.eps";

primarydef p enlarged s = p shifted -(center p) scaled s shifted center p enddef;

verbatimtex
\def \kw#1{\mathop{\hbox{\bf #1\thinspace}}}
\def \id#1{\mathord{\hbox{\it #1\/}}}
etex

path u, c, s;

u = unitsquare shifted -(.5,.5)           scaled 72;
c = fullcircle                            scaled 72 shifted 108 right;
s = (superellipse(right,up,left,down,.8)) scaled 36 shifted 216 right;

beginfig(0);

path xx, yy; xx = left scaled 8 -- right scaled 89; yy = down scaled 8 -- up scaled 55;
path t; t = origin -- (55,0) -- (55,34) -- cycle; 

picture p[];
p1 = image(
drawarrow xx withcolor .67 white;
drawarrow yy withcolor .67 white;
fill t withcolor .8[blue,white];);
p2 = image(
draw p1;
draw t;
dotlabel.rt(btex $(55,34)$ etex scaled 0.8, point 2 of t);
) shifted 144 right;
draw p1; draw p2;
label.lrt(btex $\kw{fill} t \kw{withcolor} 0.8[\id{blue},\id{white}];$etex scaled 0.8, point 0 of bbox p1);
label.lrt(btex $\dots\;\kw{draw} t;                                   $etex scaled 0.8, point 0 of bbox p2);

endfig;

beginfig(7);
path xx, yy; xx = (left -- right) scaled 144; yy = (down -- up) scaled 89;

drawarrow xx withcolor .67 white;
drawarrow yy withcolor .67 white;


draw unitsquare scaled 72;
draw fullcircle scaled 72 withcolor .67 red;
draw s shifted 216 left withcolor .67 blue;

label.bot(btex $\id{unitsquare}$ etex, (36,72));
label(btex $\id{fullcircle}$ etex, (0,-18)) withcolor .67 red;
label.lrt(btex $\id{superellipse}()$ etex, (28,-28)) withcolor .67 blue;

endfig;

beginfig(1);
picture p[];
p1 = image(
draw origin--left scaled 50 withcolor background;
ahangle := 30;
forsuffixes $=u,c,s:
  draw subpath(1/2,length $) of $;
  drawarrow subpath(0,1/2) of $;
  draw fullcircle scaled 2 shifted center $ withcolor .67 red; 
  for i=0 upto length $-1: 
    fill fullcircle scaled 2 shifted point i of $ withcolor .67 red; 
    label(decimal i, point i of ($ enlarged 1.15)); 
  endfor
endfor);

p2 = image(
draw origin--left scaled 50 withcolor background;
forsuffixes $=u,c,s:
  fill center $ -- subpath (1,2) of $ -- cycle withcolor .8[blue,white];
  draw center $ -- point 1 of $;
  draw center $ -- point 2 of $;
  draw $;
  endfor
);

p3 = image(
draw origin--left scaled 50 withcolor background;
forsuffixes $=u,c,s:
  r := 1/5 length $;
  fill center $ -- subpath (0,r) of $ -- cycle withcolor .8[red,white];
  draw center $ -- point 0 of $;
  draw center $ -- point r of $;
  draw $;
  endfor
);

p4 = image(
draw origin--left scaled 50 withcolor background;
forsuffixes $=u,c,s:
  fill center $ -- subpath (-1,1) of $ -- cycle withcolor .8[black,white];
  draw center $ -- point -1 of $;
  draw center $ -- point 1 of $;
  draw $;
  endfor
);

for i=1 upto 4: draw p[i] shifted (0,-108i); endfor

endfig;


end.

