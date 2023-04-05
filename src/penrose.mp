input colorbrewer-rgb
numeric psi, size;
psi = (sqrt 5 - 1) / 2;
size = 800;
vardef inflate_tall(expr mode, level, a, b, c) = 
    save d, e; pair d, e; 
    if level = 0:
        drawoptions(withpen pencircle scaled 1/8);
        filldraw a--b--c--cycle withcolor (abs(b)/size)[Reds 7 2, Blues 8 2];
        if mode = 2:
            draw c--a--b;
        else:
            % save arc; path arc;
            % arc = fullcircle rotated angle (c-a) scaled 1/2 abs(b-a) shifted a 
            %     if turningnumber (a--b--c--cycle) < 0: cutafter else: cutbefore fi (a--b);
            % cutdraw arc withpen pencircle scaled 3/2 withcolor Reds 7 4;
            % cutdraw arc reflectedabout(b, 1/2[a,c]) withpen pencircle scaled 3/2 withcolor Blues 8 8;
            % draw arc reflectedabout(b, 1/2[a,c]) withpen pencircle scaled 1/2 withcolor Blues 8 2;
            draw a--b--c;
        fi
        drawoptions();
    else:
        if mode = 3:
            d = psi[b,a]; 
            inflate_tall(mode, level - 1, d, c, a);
            inflate_wide(mode, level - 1, c, d, b);
        elseif mode = 2:
            d = psi[a, b];
            e = psi[b, c]; 
            inflate_tall(mode, level - 1, c, a, e);
            inflate_tall(mode, level - 1, d, a, e);
            inflate_wide(mode, level - 1, e, d, b);
        fi
    fi
enddef;
vardef inflate_wide(expr mode, level, a, b, c) = 
    save d, e; pair d, e; 
    if level = 0:
        drawoptions(withpen pencircle scaled 1/8);
        filldraw a--b--c--cycle withcolor (abs(b)/size)[Reds 7 3, white];
        if mode = 2: 
            draw c--a--b; 
        else: 
            % save arc; path arc;
            % arc = fullcircle rotated angle (c-a) scaled 3/2 abs (b-a) shifted a
            %       if turningnumber (a--b--c--cycle) < 0: cutafter else: cutbefore fi (a--b);
            % cutdraw arc withpen pencircle scaled 3/2 withcolor Reds 7 4;
            % path arc;
            % arc = fullcircle rotated angle (a-c) scaled 1/2 abs (b-a) shifted c
            %       if turningnumber (a--b--c--cycle) > 0: cutafter else: cutbefore fi (c--b);
            % cutdraw arc withpen pencircle scaled 3/2 withcolor Blues 8 8;
            % draw arc withpen pencircle scaled 1/2 withcolor Blues 8 2;
            draw a--b--c; 
            
        fi
        drawoptions();
    else:
        if mode = 3:
            d = psi[a,b]; e = psi[a,c];
            inflate_tall(mode, level - 1, d, e, b);
            inflate_wide(mode, level - 1, e, d, a);
            inflate_wide(mode, level - 1, c, e, b);
        elseif mode = 2:
            d = psi[c, a]; 
            inflate_tall(mode, level - 1, d, c, b);
            inflate_wide(mode, level - 1, b, d, a);
        fi
    fi
enddef;

vardef penrose(expr mode) = 
    save a, b, c, P, R; 
    pair a, b, c;
    b = origin;
    c = (sind(18), sind(72)) scaled size;
    a = (-xpart c, ypart c);
    picture P; P = image(inflate_tall(mode, 7, a, b, c));
    picture R; R = image(
        for t = 0 upto 9:
            draw P if odd t: reflectedabout(b, c) fi rotatedabout(b, 72t);
        endfor);
    clip R to (unitsquare shifted -(1/2, 1/2) xscaled 987 yscaled 610);
    R
enddef;
