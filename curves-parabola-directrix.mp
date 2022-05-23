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

    path p; p = parabola(a, b, s);
    pair n; n = whatever[a, b]; point i of p - n = whatever * (a-b) rotated 90;
    pair q; q = point i of p reflectedabout(s, n);
    draw n -- point i of p -- q -- n -- s withcolor 3/4;
    pair z; z = whatever[a,b] = whatever[q, s];
    pair o; o = 1/2[z, s];
    interim ahangle := 24;
    drawarrow (b--a) shifted (o-z) withcolor 3/4;
    drawarrow (1/2[a, z] --b) rotatedabout(z, 90) withcolor 3/4;
    
    show angle (point i of p - s);
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
    dotlabel.llft("$\scriptstyle n$", z);
    dotlabel.llft("$\scriptstyle o$", o);
    dotlabel.lft("$\scriptstyle m\:$", 1/2[n, s]); 
    dotlabel.lft("$\scriptstyle t[A, B]$", n);

endfig;
\end{mplibcode}
\end{document}

