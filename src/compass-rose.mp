vardef compass_rose(expr shade, highlight) = 
    save currentpicture, s; 
    picture currentpicture; currentpicture := nullpicture; 
    drawoptions(withcolor shade);
    draw fullcircle scaled 144 withpen pencircle scaled 2;
    draw fullcircle scaled 138;
    draw thelabel("NW" infont defaultfont scaled 3/4, 64 up) rotated +45;
    draw thelabel("NE" infont defaultfont scaled 3/4, 64 up) rotated -45;
    draw thelabel("SE" infont defaultfont scaled 3/4, 64 down) rotated +45;
    draw thelabel("SW" infont defaultfont scaled 3/4, 64 down) rotated -45;
    draw fullcircle scaled 120;
    draw fullcircle scaled 118;
    draw fullcircle scaled 108;
    draw fullcircle scaled 106;
    for t=0 step 15 until 350: draw ((53,0) -- (60,0)) rotated t; endfor
    for t=0 step 45 until 350: draw ((69,0) -- (80,0)) rotated t; endfor
    path s; s = 8 right -- 60 up -- 8 left -- cycle;
    for t=0 upto 3: filldraw s rotated (45 + 90t); endfor
    s := s scaled 1.414;
    for t=0 upto 3: 
        s := s rotated 90t;
        fill s withcolor background; 
        fill subpath (-1/2, 1) of s -- cycle if t=0: withcolor highlight fi;
        draw s;
    endfor
    fill fullcircle scaled 28 withcolor background;
    draw fullcircle scaled 28;
    fill fullcircle scaled dotlabeldiam;
    label.top("N" infont "cmbx12", 84 up);
    label.bot("S" infont "cmbx12", 84 down);
    label.rt("E" infont "cmbx12", 84 right);
    label.lft("W" infont "cmbx12", 84 left);
    drawoptions();
    currentpicture
enddef;
