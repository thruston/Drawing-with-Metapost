\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input archimedean-tools
beginfig(1);

    path s;
    s = poly 4 of (origin -- 42 right);
    pair m;
    m = median(s);

    picture unit[];
    unit0 = image(
        fill s withcolor Oranges 8 5;
        for i=1 upto length s:
            draw m -- point i-1/2 of s;
        endfor<D-`>
            
    );
    unit1 = image(fill s withcolor Blues 8 4);


    pair u, v;
    u = point 1 of s - point 0 of s;
    v = point 3 of s - point 0 of s;


    numeric n;
    n = 4




endfig;
\end{mplibcode}
\end{document}
