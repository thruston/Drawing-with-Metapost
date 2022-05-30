\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\def\kw#1{\begingroup\def\_{\kern.04em
    \vbox{\hrule width.3em height .6pt}\kern.08em}%
\ifmmode\mathop{\textbf{#1}}\else\hbox{\bf#1\/}\fi\endgroup}
\def\op#1{\begingroup\def\_{\kern.04em
    \vbox{\hrule width.3em height .6pt}\kern.08em}%
\ifmmode\mathop{\textrm{#1}}\else\hbox{\rm#1\/}\fi\endgroup}
\def\id#1{\begingroup\def\_{\kern.04em
    \vbox{\hrule width.3em height .6pt}\kern.08em}%
\ifmmode\mathop{\textit{#1}}\else\hbox{\it#1\/}\fi\endgroup}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
    
% A--B = directrix, S = focus
vardef parabola(expr A, B, S) =
    save m, q, n, parabola;
    pair n; 
    n = whatever[A, B]; 
    n - S = whatever * (A-B) rotated 90;
    path parabola;
    for t=0 step 1/64 until 1:
        pair m, q;
        m = 1/2[S, t[A, B]];
        q = whatever[S, n]; q - m = whatever * (S - m) rotated 90;
        parabola := if known parabola: parabola -- fi q reflectedabout(S, m);
    endfor
    parabola
enddef;
input colorbrewer-rgb
beginfig(1);

    numeric i; i = 16;
    pair a, b, s; a = 160 up rotated 5; b = 160 down rotated 5; s = 60 * right;
    draw a--b; 

    path ff; ff = (-1, 1){1, -2} .. (-1/2, 1/4){1, -1} .. (0, 0){right} .. (1/2, 1/4){1, 1} .. (1, 1){1, 2};

    path p; p = parabola(a, b, s);
    pair tab; tab = whatever[a, b]; point i of p - tab = whatever * (a-b) rotated 90;
    pair q; q = point i of p reflectedabout(s, tab);
    pair n; n = whatever[a,b] = whatever[q, s];
    pair o; o = 1/2[n, s];

    % draw ff scaled 4 abs(s-o) 
            % rotated angle (b-a)
            % shifted o
            % withpen pencircle scaled 2 withcolor 7/8[red, white];
    
    interim ahangle := 24;
    drawarrow (b--a) shifted (o-n) withcolor 3/4;
    drawarrow (1/2[a, n] --b) rotatedabout(n, 90) withcolor 3/4;

    draw tab -- point i of p -- q -- tab -- s withcolor 3/4;
    
    drawarrow s -- point i of p 
                -- s reflectedabout(precontrol i of p rotatedabout(point i of p, 90), 
                                   postcontrol i of p rotatedabout(point i of p, 90))
               withcolor Blues 8 4;

    draw p withcolor Blues 8 6;
    dotlabel.lrt("$S$", s);
    dotlabel.urt("$A$", a);
    dotlabel.lrt("$B$", b);
    dotlabel.ulft("\kw{point} $i$ \kw{of} $p$", point i of p);
    interim dotlabeldiam := 2;
    dotlabel.bot("$\scriptstyle q$", q);
    dotlabel.llft("$\scriptstyle n$", n);
    dotlabel.llft("$\scriptstyle o$", o);
    dotlabel.lft("$\scriptstyle m\:$", 1/2[tab, s]); 
    dotlabel.lft("$\scriptstyle t[A, B]$", tab);

endfig;
\end{mplibcode}\llap{\tiny\texttt{\jobname}}
\end{document}

