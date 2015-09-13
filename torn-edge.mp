prologues := 3;
outputtemplate := "%j%c.eps";

vardef signr suffix $ = 
   if $<0: - else: + fi uniformdeviate 1 
   enddef;
vardef walkr suffix $ = 
   $ := $ if uniformdeviate 1 < (2**-abs($)): + else: - fi signr $; 
   $ 
   enddef;

beginfig(1);
y=0;
path e; 
e = (0,y) for i=1 upto 288: -- (i,walkr y) endfor ;
draw e; 

%%path c; 
%%c = fullcircle scaled 200;
%%
%%draw c withcolor .8 white;
%%
%%path t;
%%t = 
%%for i=0 upto 500:
%%      (point i/500*length(e) of e 
%%    - (i/500)[point 0 of e, point infinity of e]) 
%%      rotated angle direction i/500*length(c) of c
%%    + point i/500*length(c) of c --
%%endfor cycle
%%; 
%%fill t scaled 1.1 withcolor .9[blue,white];
%%fill t scaled 1.08 withcolor .8[red+1/3green,white];
%%path s;
%%s = for i=0 upto 500: point i/500*length(c) of c + (0,1/2 normaldeviate) rotated angle direction i/500*length(c) of c -- endfor cycle;
%draw s scaled 1.2 withcolor blue;

endfig;

beginfig(2);
path c; c = fullcircle scaled 200;
draw c withcolor .8 white;

y=0; n = 600;
path t; t = for i=0 upto n-1:
  point i/n*length(c) of c 
  + (0, walkr y) rotated angle direction i/n*length(c) of c
  -- 
endfor cycle;
draw t withcolor .67 red;
endfig;
end.

