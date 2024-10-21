\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
input random-other-distributions

beginfig(1);

  numeric bucket[]; for i = 1 upto 5: bucket[i] = 0; endfor
  numeric scale; scale = 50;
  numeric N; N = 80;
  numeric stack_height[]; 
  numeric mu, r, k; mu = 0;
  pair w;

  for i=1 upto N: for j=1 upto N:
    r := exponentialdeviate scale;  
    k := floor r;
    mu := mu + (r - mu) / (i * N + j);

    if known stack_height[k]:
      stack_height[k] := stack_height[k] + 1;
    else:
      stack_height[k] := 1;
    fi

    w := (r, uniformdeviate 1/8 + stack_height[k]);
    

    color shade; 
    if     r <   scale: bucket[1] := bucket[1] + 1; shade := Greens 8 8;
    elseif r < 2 scale: bucket[2] := bucket[2] + 1; shade := Blues 8 8; 
    elseif r < 3 scale: bucket[3] := bucket[3] + 1; shade := Oranges 8 6;
    elseif r < 4 scale: bucket[4] := bucket[4] + 1; shade := Reds 8 6;
    else:               bucket[5] := bucket[5] + 1; shade := black;
    fi

    if r < 7 scale:  % trim very high ... 
      draw w withcolor shade;
    fi
  endfor endfor

  draw (origin -- 1.44 scale * up) shifted (mu, 0) withcolor 2/3 blue;
  label.top("$\mu$", (mu, 1.44 scale));

  path xx, yy;
  xx = origin -- 6 scale * right shifted 12 right;
  yy = origin -- 2 N * up;

  ahangle := 30;
  for x=1 upto 6: 
    draw (origin -- 3 down) shifted (scale * x, 0);
    label.bot(decimal x, (scale * x, -3));
  endfor
  drawarrow xx; 
  draw yy; 

  vardef exponential_pdf(expr x, lambda) = 
    if x < 0: 0 else: lambda * mexp(-256x * lambda) fi
  enddef;

  path E; 
  E = ((0, exponential_pdf(0, 1)) for x=1 upto 6: .. (x, exponential_pdf(x, 1)) endfor)
      xscaled scale yscaled 1.8N;

  draw E withcolor 1/2 red;

  string p;
  for i=1 upto 5:
    p := decimal (bucket[i] / N / N);
    label.bot("\tiny " & p, ((i-1/2) * scale, -10));
  endfor

  pair a, b;
  a = point 1/4 of E shifted (2,3);
  b = point 1/4 of E shifted (20, 30);
  draw a -- b withpen pencircle scaled 1/4;
  label.urt("$\lambda e^{-\lambda x}$", b);

  label.llft("\large\textsf{Histogram of exponential deviates}", urcorner currentpicture);

  input show_name

endfig;
\end{mplibcode}
\end{document}

