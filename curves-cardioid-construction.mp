\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

    numeric u; u = 144;

    path base; base = fullcircle rotated 180 scaled u;

    path cardioid; 
    cardioid = for t = 0 step 1/4 until length base:
        point 0 of base reflectedabout(precontrol t of base, postcontrol t of base) ..
    endfor cycle;

    numeric t; t = 5.4;
    pair A, M, P, P', Q, Q', R;
    A = point 0 of base;
    Q  = point t of base;
    Q' = point t-4 of base;
    P = A reflectedabout(precontrol t of base, postcontrol t of base);
    P' = A reflectedabout(precontrol t-4 of base, postcontrol t-4 of base);
    M = 1/2[P, P'];
    R = whatever[P, Q] = whatever[P', Q'];

    %draw Q' -- R -- Q withcolor 3/4;
    draw 3[postcontrol t of base, precontrol t of base]
      -- 5[precontrol t of base, postcontrol t of base] withcolor 3/4;  
    %draw 5[postcontrol t-4 of base, precontrol t-4 of base]
    %  -- 3[precontrol t-4 of base, postcontrol t-4 of base] withcolor 3/4;  

    draw fullcircle scaled 2 abs (Q-A) shifted Q withcolor 7/8;

    %
    %draw P' -- Q' -- Q -- P -- cycle;
    draw A -- Q -- P -- cycle;

    draw base withcolor 2/3 blue;
    draw origin withpen pencircle scaled dotlabeldiam withcolor 2/3 blue;
    draw cardioid withcolor 1/4[white, 1/2 red];

    dotlabel.ulft("$A$", A);
    %dotlabel.ulft("$M$", M);
    dotlabel.top ("$P$", P);
    %dotlabel.llft("$P'$", P');
    dotlabel.urt ("$Q$", Q);
    %dotlabel.bot ("$Q'$", Q');
    %dotlabel.lrt ("$R$", R);

endfig;
\end{mplibcode}
\end{document}

