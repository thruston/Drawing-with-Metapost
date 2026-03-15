\documentclass[border=5mm]{standalone}
\usepackage{unicode-math}
\setmainfont{Fira Math}
\setmathfont{Fira Math}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    numeric u; u = 12mm;
    path xx; xx = (8 left -- 7 right) scaled u;

    numeric x; x = -28/31;

    vardef make_mark(expr xpos, mark) = 
        draw (up--down) scaled 3 
            shifted (xpos * u, 0)
            withpen pencircle scaled 1;
        label.bot(mark, (xpos * u, -4));
    enddef;

    make_mark(x-6, "$X-6$");
    make_mark(x-1, "$X-1$");
    make_mark(x, "$X$");
    make_mark(0, "$0$");
    make_mark(1, "$+1$");
    make_mark(6, "$+6$");
    
    vardef bracket(expr a, c, b) = 
        save ab, bar;
        pair ab; ab = b-a;
        path bar; bar = (a--b) shifted -(1/2[a,b]) scaled 3/8; 
        a {ab rotated 90} 
        ... bar shifted 1/2[a,c] ...
        {ab rotated 90} c {ab rotated -90}
        ... bar shifted 1/2[b,c] ...
        {ab rotated -90} b
    enddef;

    draw bracket((0, 10), (3u, 24), (6u, 10)) withcolor 2/3 blue;
    label.top(btex \begin{tabular}{c}
      Some long text that needs:\\
      something on the second line
      \end{tabular} etex, (3u, 24)) withcolor 2/3 blue;
    
    drawoptions(dashed withdots scaled 1/4);
    draw bracket(((x-1)*u, -20), ((x-3.5)*u, -36), ((x-6)*u, -20));
    draw bracket((6u, -20), (3.5u, -36), (1u, -20));
    draw (0, -36) -- (0, -20);
    draw (x*u, -52) -- (x*u, -20);
    drawoptions();

    label.bot("Pre-issue period", ((x-3.5)*u, -36));
    label.bot("Post-issue period", (3.5u,      -36));
    label.bot("Issue", (0, -36));
    label.bot("Announcement", (x*u, -52));
    
    drawarrow xx withpen pencircle scaled 1;
    label.rt("Months", point 1 of xx);

endfig;
\end{mplibcode}
\end{document}
