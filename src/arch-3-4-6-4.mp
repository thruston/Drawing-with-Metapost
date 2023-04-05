\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibsetformat{metafun}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
    numeric r; r = 5;
    path d; d = for i=1 upto 12:
        up scaled r
           shifted (r * (sqrt(3)+2), 0)
           rotated 30i -- 
       endfor cycle;

    color shade[]; 
    shade0 = Oranges 8 3; 
    shade1 = Blues 8 3; 
    shade2 = Greens 8 3;
    shade3 = Reds 8 3;
    
    vardef unit(expr n) = image(
        fill d withcolor transparent (2, .9, shade[n mod 4]);
        draw d; 
    ) enddef;
    pair u, v;
    u = point 0 of d - point 3 of d;
    v = u rotated 60;
    numeric n; n = 6;
    for i=-n upto n:
        for j=-n upto n:
            draw unit(i*j) shifted ((i - floor(j / 2)) * u + j * v);
        endfor
    endfor
    clip currentpicture to unitsquare shifted -(1/2, 1/2) scaled (n * 9 r);
    picture p; p = image(
        draw d; draw point 0 of d withpen pencircle scaled 2;
        drawoptions(withcolor 3/4[red, white]);
        draw d shifted u; draw point 0 of d shifted u withpen pencircle scaled 2;
        drawoptions(withcolor 3/4[blue, white]);
        draw d shifted v; draw point 0 of d shifted v withpen pencircle scaled 2;
        drawoptions();
        drawarrow origin -- u withcolor red;
        drawarrow origin -- v withcolor blue;
    );
    label.bot(p, point 1/2 of bbox currentpicture shifted 13 down);
    label.bot(btex \vbox{\hsize 3.4in\noindent
        The vectors are chosen so that the dodecagons overlap to make 
        the required triangles, squares, and hexagons.} etex,
        point 1/2 of bbox currentpicture shifted 13 down);
endfig;
\end{mplibcode}
\end{document}

