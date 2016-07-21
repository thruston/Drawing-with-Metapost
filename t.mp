prologues:=3;outputtemplate:="%j%c.eps";
beginfig(1);

pair p, q; p = (3,4) scaled cm; q = (10,3) scaled cm;
draw p--q;

drawdot (-4/3)[p,q] withpen pencircle scaled 3;

endfig;
end

