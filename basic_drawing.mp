prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);

u = 32;
z1 = right scaled u;
z2 = z1 rotated 90;
z3 = z2 rotated 90;
z4 = z3 rotated 90;
z5 = 1/2[z1,z2];
z6 = 1/2[z2,z3];
z7 = 1/2[z3,z4];
z8 = 1/2[z4,z1];

drawoptions (withpen pencircle  scaled 2);
picture p;
for i=0 upto 2:
for j=0 upto 2:
linecap := i;
linejoin := j;
p := image(
draw unitsquare shifted -(1/2,1/2) scaled 2u withcolor 3/4 white;
label(decimal linecap, z7) withcolor .67 blue;
label(decimal linejoin, z8) withcolor .67 red;
drawarrow z1--z3;
draw z2--z4;
drawdot(z5);
drawdot(z6);
drawarrow halfcircle scaled u rotated 180 shifted z4;
) shifted (5/2u*i, -11/4u*j);
draw p;
if (i=1) and (j=1): draw bbox p dashed withdots scaled 3/4 
                                withpen pencircle scaled 1/2 
                                ; fi
endfor
endfor

label("linecap" infont "cmtt10" scaled 1.2, (5/2u, 7/4u));
label("butt"    infont "cmtt10" , (   0, 5/4u)) withcolor .67 blue;
label("rounded" infont "cmtt10" , (5/2u, 5/4u)) withcolor .67 blue;
label("squared" infont "cmtt10" , (5/1u, 5/4u)) withcolor .67 blue;

label("linejoin" infont "cmtt10" scaled 1.2 rotated 90, (-7/4u, -11/4u));
label("mitered" infont "cmtt10"  rotated 90, (-5/4u,0)) withcolor .67 red;
label("rounded" infont "cmtt10"  rotated 90, (-5/4u,-11/4u)) withcolor .67 red;
label("beveled" infont "cmtt10"  rotated 90, (-5/4u,-11/2u)) withcolor .67 red;

endfig;
end.

