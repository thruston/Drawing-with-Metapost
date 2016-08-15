prologues:=3;outputtemplate:="%j%c.mps";

primarydef p enlarged s = 
  p shifted (-center p)
  if pair s: xscaled xpart s yscaled ypart s
  else: scaled s
  fi
  shifted (center p)
  enddef;

vardef se_around_text(expr thing, place, tint) = 
save w, h, p, s, bubble, highlight; 
numeric w,h;
picture p; p = thelabel(thing infont "phvr8r", place);
path s,bubble, highlight; 
s = (superellipse(right,up,left,down,0.5)) scaled 6;
bubble = (subpath (0,2) of s) shifted point 1.5 of bbox p shifted  left ...
         (subpath (2,6) of s) shifted point 3.5 of bbox p shifted  right ...
         (subpath (6,8) of s) shifted point 1.5 of bbox p shifted  left .. cycle;

(w,h) = (urcorner bubble - llcorner bubble);
fill bubble withcolor 0.6[tint,white];
fill bubble enlarged ((w-1)/w, (h-1)/h) withcolor 0.7[tint,white];
fill bubble enlarged ((w-2)/w, (h-2)/h) withcolor 0.8[tint,white];
fill bubble enlarged ((w-3)/w, (h-3)/h) withcolor 0.9[tint,white];
fill bubble enlarged ((w-4)/w, (h-4)/h) withcolor .95[tint,white];
draw p; 
%for i=1 upto length bubble: dotlabel.top(decimal i, point i of bubble); endfor
draw bubble withcolor .5[tint,white];
enddef;

beginfig(1);

se_around_text("Hello there Flora", (10,20), blue );
se_around_text("Aha!", (100,0) , red+1/2green );
se_around_text("Sausage", (10,-20) , 1/2 red );

endfig;
end



10
2 

