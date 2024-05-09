\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

vardef connect(expr a, b, r, want_erase) = 
    save p; path p; p = a {b-a rotated r} .. b;
    if want_erase:
        draw p withpen pencircle scaled 4 withcolor background;
    fi
    drawarrow p
        cutbefore fullcircle scaled 20 shifted a
        cutafter  fullcircle scaled 20 shifted b;
enddef;

beginfig(1);
    % how many points?
    N = 7;
    % define the points, from the top, counter-clockwise
    for i=0 upto N-1:
        z[i] = up scaled 100 rotated (360/N*i);
    endfor
    interim ahangle := 30; % with slim arrow heads

    picture P[];
    P1 = image(
        for i=0 upto N-1:
            connect(z[i], z[(i+1) mod N], -30, false);
            connect(z[i], z[(i+2) mod N], -20, false);
            connect(z[i], z[(i+4) mod N],  30, false);
        endfor
        % label all the points...
        for i=0 upto N-1:
            label(decimal (i+1), z[i]) withcolor .67 red;
        endfor
    );
    P2 = image(
        for i=0 upto N-1:
            connect(z[i], z[(i+1) mod N], -30, true);
            connect(z[i], z[(i+2) mod N], -20, true);
            connect(z[i], z[(i+4) mod N],  30, true);
        endfor
        % label all the points...
        for i=0 upto N-1:
            label(decimal (i+1), z[i]) withcolor .67 red;
        endfor
    );

    label.top(P1, 16 up);
    label("Do you think it looks better with crossings?", origin);
    label.bot(P2, 10 down);
endfig;
\end{mplibcode}
\end{document}

