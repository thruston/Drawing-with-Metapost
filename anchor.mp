vardef anchor = image(
    numeric h; h = 34;

    path stock, fluke, shank, ring, hole;
    shank = (unitsquare shifted -(1/2, 1/2) xscaled 7 yscaled 74) shifted 1 up;
    stock = (3 down -- (h, 4) -- (h, 8) -- (-h, 8) -- (-h, 4) -- cycle) shifted point 5/2 of shank;
    ring = fullcircle scaled 15 shifted point 5/2 of stock shifted 7 up;
    hole = fullcircle scaled 9 shifted center ring;
    fluke = point 1/2 of shank shifted 4 down .. point 1 of shank  ..
    {dir  80} point 20/16 of shank shifted (23/32h, -1) {dir -100} ..
    {dir -80} point 18/16 of shank shifted (11/16h+1, 0) {dir 52} ..
    {dir 120} point 23/16 of shank shifted (23/32h, 0) {down} ..
    {dir 185} point 20/16 of shank shifted (15/32h-1, 0) {dir -35} ..
    {dir  45} point 20/16 of shank shifted (20/32h, 0) {dir 240} ..
    {left}    point 1/2 of shank shifted 8 up;
    fluke := fluke .. reverse fluke reflectedabout(up, down) .. cycle;
    filldraw shank;
    filldraw stock; filldraw ring; unfill hole;
    filldraw fluke;
) enddef;
