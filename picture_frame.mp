% Toby Thurston -- 16 Apr 2021 
% Draw a kitsch picture frame round a rectangular path

newinternal pf_width; pf_width := 21;

vardef frame expr P = 
    save base, side, sq, f, t, u, xx; 
    picture base, side, sq; path f; numeric t, u, xx;

    t = arclength subpath (0,1) of bbox P;
    u = arclength subpath (1,2) of bbox P;
    xx = max(t, u) + 2 pf_width;
    f = unitsquare xscaled xx yscaled pf_width;

    save gold, dark, grey;
    color gold, dark, grey;
    gold = 1/256(243, 197, 127);
    dark = 1/256(144, 87, 50);
    grey = 1/256(156, 147, 138);

    save ball; picture ball; 
    ball = image(
        for i=0 upto 16:
            fill interpath(i/16, fullcircle scaled 10, fullcircle scaled 3 shifted (-2, 2)) withcolor (i/16)[gold, 15/16 white];
        endfor
    ) scaled 1/4;

    base = image(
        fill f withcolor gold;
        draw subpath (0,1) of f shifted (0,  2) withpen pencircle scaled 3 withcolor 5/4 grey;
        draw subpath (0,1) of f shifted (0,3.5) withpen pencircle scaled 1/4 withcolor grey;
        draw subpath (0,1) of f shifted (0,  5) withpen pencircle scaled 1/4 withcolor 1/2[gold, dark];
        draw subpath (0,1) of f shifted (0, pf_width - 6.5) withpen pencircle scaled 1/4 withcolor 1/2[gold, dark];
        draw subpath (0,1) of f shifted (0, pf_width - 6) withpen pencircle scaled 1/4 withcolor 1/2[gold, dark];
        draw subpath (0,1) of f shifted (0, pf_width - 2) withpen pencircle scaled 2 withcolor 5/4 grey;

        for i=0 upto 4 * arclength(subpath (0,1) of f):
            fill fullcircle scaled uniformdeviate 3/4
                shifted (uniformdeviate xx, uniformdeviate pf_width)
                withcolor dark;
        endfor

        for x = 2 step 3 until xx:
            draw ball shifted (x, 2);
        endfor
    );

    side = base;
    clip side to (pf_width, 0) -- (pf_width + u, 0) -- (2 pf_width + u, pf_width) -- (0, pf_width) -- cycle;
    clip base to (pf_width, 0) -- (pf_width + t, 0) -- (2 pf_width + t, pf_width) -- (0, pf_width) -- cycle;

    sq = image(
        draw base rotated 180 shifted point 1 of bbox P shifted (pf_width, 0);
        draw base rotated   0 shifted point 3 of bbox P shifted (-pf_width, 0);
        draw side rotated  90 shifted point 0 of bbox P shifted (0, -pf_width);
        draw side rotated 270 shifted point 2 of bbox P shifted (0, +pf_width);
    );
    sq
enddef;
