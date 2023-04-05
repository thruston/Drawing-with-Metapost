vardef hsv_color(expr h,s,v) =
    % following wikipedia article on "HSL and HSV"
    save chroma, hh, x, m;
    chroma = v*s;
    hh = h/60;
    x  = chroma * (1-abs(hh mod 2 - 1));
    m  = v - chroma;
    if     hh < 1: (chroma,x,0)+(m,m,m)
    elseif hh < 2: (x,chroma,0)+(m,m,m)
    elseif hh < 3: (0,chroma,x)+(m,m,m)
    elseif hh < 4: (0,x,chroma)+(m,m,m)
    elseif hh < 5: (x,0,chroma)+(m,m,m)
    else:          (chroma,0,x)+(m,m,m)
    fi
enddef;
