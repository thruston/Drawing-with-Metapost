vardef base(expr Y, M, d) = 
    save m, y; numeric m, y;
    if M < 3:
        m = M + 9; 
        y = Y - 1;
    else:
        m = M - 3;
        y = Y;
    fi
    365/1024 y + (floor(y/4) - floor(y/100) + floor(y/400) + floor((2+3m)/5) + 30m + d - 307) / 1024
enddef;
