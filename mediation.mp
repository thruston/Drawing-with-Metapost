prologues:=3;outputtemplate:="%j%c.eps";
% don't edit figure 1 ! it is used in DwMP like this.
pair a,b;
a = 42 up; b = 72 right;
beginfig(1);

draw (-1/4)[origin,b]--5/4[origin,b] withcolor .8 white;
draw (-1/4)[origin,a]--5/4[origin,a] withcolor .8 white;

draw (-1)[a,b]--a dashed evenly;
draw a--b withcolor .67 red;

draw b--2[a,b] dashed evenly;

dotlabel.urt(btex $a$ etex, a);
dotlabel.urt(btex $b$ etex, b);

dotlabel.urt(btex ${1\over2}[a,b]$ etex, 1/2[a,b]);
dotlabel.urt(btex $(-{1\over2})[a,b]$ etex, (-1/2)[a,b]);
dotlabel.llft(btex $-{1\over2}[a,b]$ etex, -1/2[a,b]);
label(btex Probably not what was intended\dots etex, -1/2[a,b] shifted (0,-24)) withcolor .58 blue;
dotlabel.urt(btex ${3\over2}[a,b]$ etex, (3/2)[a,b]);

dotlabel.lrt(btex $(0,0)$ etex, origin);

endfig;

beginfig(2);

path t,s,p,c;
t = origin--a--b--cycle;
s = unitsquare scaled 40 shifted 92 right;
p = (for i=0 upto 4: down scaled 21 rotated 72i -- endfor cycle) 
    shifted 180 right shifted 21 up;
c = fullcircle scaled 42 shifted 250 right shifted 21 up;

forsuffixes $=t,s,p,c:
draw $; 
draw point 0 of $ -- point 1/2 length $ of $ 
dashed withdots scaled 1/3
withcolor .67 red;
endfor

label(btex Dotted lines drawn with
{\tt point 0 of p -- point 1/2 length p} etex, 
(134,-16));

endfig;
end

