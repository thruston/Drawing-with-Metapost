prologues := 3;
outputtemplate := "%j%c.eps";

vardef repr secondary t = 
  if  numeric t: decimal t
  elseif pair t: "(" & decimal xpart t & "," & decimal ypart t & ")"
  elseif string t: t
  else: str t
  fi
enddef;

%input TEX;
beginfig(1);

n:=27;
R:=100;

  path p; 
  
  p = for t=0 step 360/n until 360: right scaled R rotated t -- endfor cycle;

  % --- Fill and draw polygon and the diameters ---
  fill p withcolor .9white+.5blue;
  draw p;
  for i=0 upto n-1:
    fill fullcircle scaled 3 shifted point i of p;
    write "label(btex $" & char (65+i) & "_0$ etex,(" 
                & repr point i of p scaled .84 & "));" to ".mplabels";
                endfor
  write EOF to ".mplabels";
  input ".mplabels";
 
  picture t; t := thelabel(btex $e^2$ etex,origin);
  label(t,(15,5));

endfig;
beginfig(2);
path c; c = fullcircle scaled 100; draw c withcolor .67 red;
for i=0 upto 7:
  fill fullcircle scaled 3 shifted point i of c;
  z[i] = point i of c scaled 1.15;
  write "label(btex $p_" & decimal i & "$ etex,(" 
        & decimal x[i] & "," & decimal y[i]
        & "));" to ".mplabels";
endfor
write EOF to ".mplabels";
input ".mplabels";
endfig;
end.

