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

path Z; Z = gauss_curve(0, 1, -4, 4, 1/8) xscaled 50 yscaled 220;
path A, B;
A = subpath (16,48) of Z -- (xpart point 48 of Z, 0) -- (xpart point 16 of Z, 0) -- cycle;
B = subpath (24,40) of Z -- (xpart point 40 of Z, 0) -- (xpart point 24 of Z, 0) -- cycle;
beginfig(1);
    fill A withcolor Reds 8 1;
    fill B withcolor Reds 8 2;
    draw Z withcolor Reds 8 5;
    numeric stack_height[];
    numeric plump, fat, gross; gross = plump = fat = 0;
    for i=1 upto 100: for j = 1 upto 100:
        numeric r, k;
        r = 50 normaldeviate;
        k = round(r);
        if known stack_height[k]:
            stack_height[k] := stack_height[k] + 1;
        else:
            stack_height[k] := 1;
        fi
        pair z; z = (r, uniformdeviate 1/4 + stack_height[k]);
        draw z withpen pencircle scaled 1/2;
        undraw z withpen pencircle scaled 3/8;
        if abs(r) > 50: plump := plump + 1; fi
        if abs(r) > 100: fat := fat + 1; fi
        if abs(r) > 150: gross := gross + 1; fi
    endfor endfor
    label("$abs(r) < 1$: " & decimal (round(100 - plump / 100)) & "\%", (-150, 80));
    label("$abs(r) < 2$: " & decimal (round(100 - fat / 100)) & "\%", (-150, 68));
    label("$abs(r) < 3$: " & decimal (100 - gross / 100) & "\%", (-150, 56));
    draw (left--right) scaled 220;
    for i = -4 upto 4:
        draw (50i, 0) -- (50i, -5);
        label.bot("\hbox to 5pt{\hss$" & decimal i & "$}", (50i, -5));
    endfor

endfig;
\end{mplibcode}
\end{document}

