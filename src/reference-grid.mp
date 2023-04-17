% Adds a reference grid, sized to the contents of currentpicture
% useful for marking up external images etc
begingroup;
    save llx, lly, urx, ury, u;
    numeric llx, lly, urx, ury, u;
    (llx, lly) = llcorner currentpicture;
    (urx, ury) = urcorner currentpicture;
    u = 10;
    drawoptions(withpen pencircle scaled 1/4);
    for x = ceiling (llx / u) upto floor (urx / u):
        draw (x * u, lly) -- (x * u, ury) withcolor if x mod u = 0: red else: 1/2 fi;
    endfor
    for y = ceiling (lly / u) upto floor (ury / u):
        draw (llx, y * u) -- (urx, y * u) withcolor if y mod u = 0: red else: 1/2 fi;
    endfor
    drawoptions();
endgroup;
