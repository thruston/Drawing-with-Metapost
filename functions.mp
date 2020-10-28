prologues := 3;
outputtemplate := "%j%c.eps";

def f(expr x) = sqrt(x*x+1) enddef;

vardef hyperbola(expr alpha, omega, N) = 
    save x, y, s, h; 
    numeric x, y, s, h;
    h = (omega-alpha)/N;
    x = alpha;
    y = f(x);
    s = x/y;
    (x,y)
        for i=1 upto N:
            .. controls (x+1/3h, y+1/3h*s)
            hide(
                x := x + h;
                y := f(x);
                s := x/y;
            )
            and (x-1/3h, y-1/3h*s) .. (x,y)
        endfor
enddef;


beginfig(1);

   draw hyperbola(-2,4,8) scaled 1cm withcolor 1/2[red, blue];

   for x=-2 step 1/8 until 4: 
       drawdot (x,f(x)) scaled 1cm withpen pencircle scaled 1;
   endfor

    draw (left--right) scaled 4cm;
    draw (down--up) scaled 4cm;

endfig;
end.

