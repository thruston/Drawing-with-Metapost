\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
numeric _sqrtpp; 
_sqrtpp = 2.50662827463;

vardef gauss(expr mu, sigma, x) = 
   if abs(x - mu) < 4 sigma:
     mexp(-128 * (((x - mu) / sigma) ** 2)) / _sqrtpp / sigma
   else: 
     0 
   fi 
   enddef;

vardef gauss_curve(expr mu, sigma, a, b, s) = 
  (a, gauss(mu, sigma, a)) for x = a + s step s until b: .. (x, gauss(mu, sigma, x)) endfor
  enddef;

vardef percent(expr n, N) = 
    save p, s; 
    numeric p; 
    string s;
    p = 1 - n / N / N;
    s = decimal floor(1000 p);
    substring (0, length(s) - 1) of s & "." & substring (length(s)-1, infinity) of s & "\thinspace\%"
enddef;

path Z; Z = gauss_curve(0, 1, -4, 4, 1/8) xscaled 50 yscaled 220;
path A, B;
A = subpath (16,48) of Z -- (xpart point 48 of Z, 0) -- (xpart point 16 of Z, 0) -- cycle;
B = subpath (24,40) of Z -- (xpart point 40 of Z, 0) -- (xpart point 24 of Z, 0) -- cycle;
beginfig(1);
    draw Z withcolor Reds 8 5;
    numeric N, stack_height[]; N = 100;
    numeric plump, fat, gross; gross = plump = fat = 0;
    for i=1 upto N: for j = 1 upto N:
        numeric r, k;
        r = 50 normaldeviate;
        k = round(r);
        if known stack_height[k]:
            stack_height[k] := stack_height[k] + 1;
        else:
            stack_height[k] := 1;
        fi
        pair z; z = (r, uniformdeviate 1/4 + stack_height[k]);
        color shade; shade = Greens 8 8;
        if abs(r) >  50: plump := plump + 1; shade := Blues 8 8; fi
        if abs(r) > 100: fat   := fat   + 1; shade := Oranges 8 6 ; fi
        if abs(r) > 150: gross := gross + 1; shade := Reds 8 8; fi
        draw z withpen pencircle scaled 1/2 withcolor shade;
        undraw z withpen pencircle scaled 1/4;
    endfor endfor
    label("\textsc{Observed values}", (-180, 96));
    label("$abs(r) \le 1$: " & percent(plump, N),  (-180, 80));
    label("$abs(r) \le 2$: " & percent(fat, N), (-180, 68));
    label("$abs(r) \le 3$: " & percent(gross, N), (-180, 56));
    draw (left--right) scaled 220;
    for i = -4 upto 4:
        draw (50i, 0) -- (50i, -5);
        label.bot("\hbox to 5pt{\hss$" & decimal i & "$}", (50i, -5));
    endfor

endfig;
\end{mplibcode}
\end{document}

