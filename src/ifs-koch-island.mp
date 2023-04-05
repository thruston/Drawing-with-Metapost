\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
beginfig(1);
    path T, H, tgen, hgen;
    T = for i = 0 upto 2: 100 up rotated 120i -- endfor cycle;
    H = for i = 1 upto 6: 100 up rotated 60i -- endfor cycle;
    tgen = hgen = origin -- right;

    for n = 1 upto 6:
        pair W; W = 208(floor((n-1)/3), -((n-1) mod 3)); 
        
        fill fullcircle scaled 200 shifted W withcolor Blues[8][6];

        unfill (for s = 1 upto length H:
            hgen zscaled (point s of H - point s-1 of H) 
                      shifted point s-1 of H --
                  endfor cycle) shifted W;
        fill (for s = 1 upto length T:
            tgen zscaled (point s of T - point s-1 of T) 
                 shifted point s-1 of T -- 
             endfor cycle) shifted W withcolor Greens[8][6];

        tgen := tgen scaled 1/3;
        hgen := hgen scaled 1/3;
        % tgen := tgen -- tgen rotated -60 shifted 1/3 right;
        % hgen := hgen -- hgen rotated +60 shifted 1/3 right;
        % tgen := tgen -- reverse tgen reflectedabout((1/3,0), (0, -0.57735)); 
        % hgen := hgen -- reverse hgen reflectedabout((1/3,0), (0, +0.57735));
        % tgen := tgen -- reverse tgen reflectedabout((1/2,0), (1/2, 1));
        % hgen := hgen -- reverse hgen reflectedabout((1/2,0), (1/2, 1));
        tgen := tgen -- subpath (length tgen-1, 0) of (tgen reflectedabout((1/3,0), (0, -0.57735))); 
        hgen := hgen -- subpath (length hgen-1, 0) of (hgen reflectedabout((1/3,0), (0, +0.57735)));
        tgen := tgen -- subpath (length tgen-1, 0) of (tgen reflectedabout((1/2,0), (1/2, 1)));
        hgen := hgen -- subpath (length hgen-1, 0) of (hgen reflectedabout((1/2,0), (1/2, 1)));
        show (n, length tgen);

    endfor


endfig;
\end{mplibcode}
\end{document}

