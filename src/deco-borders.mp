\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef plain_dots(expr boxpath, gap, radius, shade) = 
    save wd, ht, u, v; numeric wd, ht, u, v;
    wd = arclength subpath (0,1) of boxpath;
    ht = arclength subpath (1,2) of boxpath;
    u = wd / round(wd/gap);
    v = ht / round(ht/gap);
    save B, R; picture B, R;
    B = image(
        draw (down -- right) xscaled 1/2u yscaled 1/2v
            withpen pencircle scaled 1/4 radius
            withcolor blue; 
    for x=1 upto round(wd/u):
        pair p; p = point arctime x * u of boxpath of boxpath;
        draw p 
            withpen pencircle scaled radius 
            withcolor shade;
        draw p shifted -1/2(u, v)
            withpen pencircle scaled radius
            withcolor shade;
        draw (left--down--right) xscaled 1/2u yscaled 1/2v shifted p 
            withpen pencircle scaled 1/4 radius
            withcolor blue; 
    endfor);
    R = image(for y=0 upto round(ht/v) - 1:
        pair p; p = point arctime y * v of reverse boxpath of reverse boxpath;
        draw p 
            withpen pencircle scaled radius
            withcolor shade;
        draw p
            shifted 1/2(-u, v)
            withpen pencircle scaled radius
            withcolor shade;
        draw (up -- left -- down) xscaled 1/2u yscaled 1/2v shifted p 
            withpen pencircle scaled 1/4 radius
            withcolor blue; 
    endfor
    draw p shifted 1/2(0, v) -- p shifted (-1/2u, v)
            withpen pencircle scaled 1/4 radius
            withcolor blue; 
    );
    image(
        draw B; draw B rotatedabout(center boxpath, 180);
        draw R; draw R rotatedabout(center boxpath, 180);
    )
enddef;

beginfig(1);
    path bb; bb = unitsquare xscaled 233 yscaled 144;
    draw plain_dots(bb, 8, 3, red);
endfig;
\end{mplibcode}
\end{document}

