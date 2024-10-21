\documentclass{standalone}
\usepackage{luamplib}
\usepackage{fontspec}
\setmainfont{PlayfairDisplay-Black}[Scale=2.8]
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input colorbrewer-rgb
randomseed:=2128.5073;
beginfig(1);
  n = 40; r = 12 ; s = 72;
  path explosion; explosion = for i=1 upto n:
    (if odd i: - fi r + s + uniformdeviate r) * dir (360/n*i) --
  endfor cycle; 
  path splash; splash = for i=1 upto n:
    (if odd i: - fi r + s + uniformdeviate r) * dir (360/n*i) ..
  endfor cycle; 
  picture P[];
  P1 = image(
    fill explosion withcolor Oranges 7 4;
    draw explosion withpen pencircle scaled 2 withcolor Reds 7 7;
    label("BOOM!", center explosion) withcolor Reds 7 7;
  );
  P2 = image(
    fill splash withcolor Blues 7 2;
    draw splash withpen pencircle scaled 2 withcolor Blues 7 7;
    label("SPLAT!", center splash) withcolor Blues 7 7;
  );
  label.lft(P1, 10 left); label.rt(P2, 10 right);
endfig;
\end{mplibcode}
\end{document}
