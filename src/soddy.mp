\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef circle_through(expr A, B, C) =
    save o; pair o;
    o = whatever * (A-B) rotated 90 shifted 1/2 [A,B]
      = whatever * (B-C) rotated 90 shifted 1/2 [B,C];
    fullcircle scaled 2 abs (A-o) shifted o
enddef;

beginfig(1);
    numeric r[]; r1 = 72; r2 = 55; r3 = 89;
    z1 = r1 * right;
    z2 = r2 * left;
    z3 = fullcircle scaled 2(r1 + r3) shifted z1 
         intersectionpoint
         fullcircle scaled 2(r2 + r3) shifted z2;
    path c[];
    forsuffixes $ = 1, 2, 3:
        c$ = fullcircle scaled 2 r$ shifted z$;
        draw c$ withcolor blue;
    endfor

    vardef soddy(expr want_outer)(text T) = 
        save t, p, q, f, r, w, n, j, k;
        numeric n; n = 0;
        path r[]; pair w[];
        forsuffixes $=T:
            r[incr n] = $;
            w[n] = center r[n];
        endfor
        pair p[], q[], f[], t[];
        for i = 1 upto 3:
            numeric j, k;
            j = i mod 3 + 1;
            k = j mod 3 + 1;
            p[i] = whatever[w[j], w[k]];
            p[i] - w[i] = whatever * (w[j] - w[k]) rotated 90;
            q[i] = r[i] intersectionpoint 
                (if want_outer: 
                    p[i] -- w[i] 
                else: 
                    w[i] -- 10[p[i], w[i]]
                fi);
            t[i] = point 1/45 angle (w[k] - w[j]) of r[j];
            f[i] = r[i] intersectionpoint (if want_outer:
                1.1[t[i], q[i]] -- 10[t[i], q[i]]
            else:
                t[i] -- 1/2[t[i], q[i]]
            fi);
        endfor
        circle_through(f1, f2, f3)
    enddef;

    c4 = soddy(true, c1, c2, c3);
    c5 = soddy(false, c1, c2, c3);

    draw c4 withcolor red;
    draw c5 withcolor green;
    draw soddy(false, c1, c2, c5);

endfig;
\end{mplibcode}
\end{document}
